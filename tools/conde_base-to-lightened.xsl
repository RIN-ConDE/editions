<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- This transformation aims to produce a lighter file, based on the 'base' TEI-XML version of a ConDÉ project corpus witness.
            Lightening such a file facilitates search and display of the texts, some of the corpus witnesses being very large
            and display being usually based on a modernized version of the text.
            This transformation therefore removes <facsimile> and <lb> elements, which only aim to reconstruct the original pages.
            It also only keeps the modernized/expanded portions of text in the <choice> elements. -->
    
    <xsl:output method="xml" version="1.1" encoding="UTF-8" omit-xml-declaration="no" indent="no" undeclare-prefixes="yes"/>
    
    <xsl:template match=".">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Copy all unchanging nodes. -->
    <xsl:template match="node()|@*">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Keep only the contents of the second child of <choice> elements, which will necessarily be either <expan>, <reg> or <corr>. -->
    <xsl:template match="//choice"><xsl:value-of select="child::*[2]"/></xsl:template>
    
    <!-- Abandon facsimile image information, as well as now useless line beginnings. -->
    <xsl:template match="//lb"/>
    <xsl:template match="//facsimile/descendant-or-self::*"/>
    
    <!-- Change part of the <edition> description. -->
    <xsl:template match="/TEI//editionStmt/edition">
        <xsl:copy copy-namespaces="no"><xsl:value-of select="replace(child::text(), 'complète', 'simplifiée')"/></xsl:copy>
    </xsl:template>
    
    <!-- Replace now useless part of the French <projectDesc> text with explanations on transformations from "base" file. -->
    <xsl:template match="//projectDesc[@xml:lang='fr']/p[contains(self::p, 'am/orig')]">
        <xsl:copy copy-namespaces="no"><xsl:text>Dans cette version dite "simplifiée" de l'édition, les éléments choice ont été résolus systématiquement : ne figure ici que le contenu textuel des enfants expan/reg/corr. Les informations graphiques sur la source originelle (facsimile, zone, etc), ont également été supprimées. Ce document a été produit, en plus de la version complète, afin de limiter la taille de certains témoins et faciliter l'affichage et la recherche textuelle dans ce document.</xsl:text></xsl:copy>
    </xsl:template>
    
    
    <!-- Replace now useless part of the English <projectDesc> text with explanations on transformations from "base" file. -->
    <xsl:template match="//projectDesc[@xml:lang='en']/p[contains(self::p, 'am/orig')]">
        <xsl:copy copy-namespaces="no"><xsl:text>In the present "lighter" version of the edition, the choice elements were systematically resolved: only the text content of their expan/reg/corr children is displayed here. The graphic information on the material source (facsimile, zone, etc), were deleted as well. This document was produced, alongside the complete version, so as to limit the size of some witnesses and thereby facilitate display and text research in this document.</xsl:text></xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>