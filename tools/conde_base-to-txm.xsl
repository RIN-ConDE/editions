<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:txm="http://textometrie.org/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- This transformation produces a TXM compatible TEI-XML out of the "base" encoding of a ConDÉ corpus witness.
        The TXM formatting making files enormous, all <choice> elements will be resolved to their modernized/expanded version and the <facsimile> and <lb> elements deleted.
        If you wish to make a complete TXM version of a document, the "conde-to-txm-full.xsl" transformation is available.
        For the same size reason, this transformation will not indent the document automatically.
    -->
    
    <xsl:output method="xml" version="1.1" encoding="UTF-8" omit-xml-declaration="no" indent="no" undeclare-prefixes="yes"/>
    
    <xsl:template match=".">
        <xsl:apply-templates/>
    </xsl:template>
        
    <!-- Copying all unchanging nodes. -->
    <xsl:template match="node()|@*">
        <xsl:copy inherit-namespaces="no">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Slightly changing the identifiers of divs. -->
    <xsl:template match="//div/@xml:id">
        <xsl:attribute name="xml:id">
            <xsl:value-of select="replace(self::node(),'-base-', '-txm-')"/>
        </xsl:attribute>
    </xsl:template>
    
    <!-- Copy root with namespace and add TXM namespace with "txm" prefix. -->
    <xsl:template match="/TEI">
        <xsl:copy copy-namespaces="yes">
            <xsl:namespace name="txm" select="'http://textometrie.org/1.0'"/>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Add required TXM declaration into the encodingDesc as specified in the TXM public model. -->
    <xsl:template match="/TEI/teiHeader/encodingDesc">
        <xsl:copy inherit-namespaces="no">
            <xsl:apply-templates/>
            <classDecl xmlns="http://www.tei-c.org/ns/1.0">
                <taxonomy id="pos" xmlns="http://www.tei-c.org/ns/1.0">
                    <bibl xmlns="http://www.tei-c.org/ns/1.0"><title xmlns="http://www.tei-c.org/ns/1.0">pos tagset built from model 
                        /home/mdecorde/runtime-rcpapplication.product/treetagger-models/fr.par</title></bibl>
                </taxonomy>
                <taxonomy id="lemma" xmlns="http://www.tei-c.org/ns/1.0">
                    <bibl xmlns="http://www.tei-c.org/ns/1.0"><title xmlns="http://www.tei-c.org/ns/1.0">fr lemma of the model
                        /home/mdecorde/runtime-rcpapplication.product/treetagger-models/fr.par</title></bibl>
                </taxonomy>
            </classDecl>
        </xsl:copy>
    </xsl:template>
    
    <!-- Transform work tokens to match TXM model. -->
    <xsl:template match="//w">
        <xsl:copy inherit-namespaces="no">
            <txm:form><xsl:apply-templates select="node()"/></txm:form>
            <txm:ana type="token-number"><xsl:value-of select="@n"/></txm:ana>
            <txm:ana type="#lemma"><xsl:value-of select="@lemma"/></txm:ana><txm:ana type="#pos"><xsl:value-of select="@pos"/></txm:ana>
        </xsl:copy>
    </xsl:template>
    
    <!-- Keep only the contents of the second child of <choice> elements, which will necessarily be either <expan>, <reg> or <corr>. -->
    <xsl:template match="//choice"><xsl:value-of select="child::*[2]"/></xsl:template>
    
    <!-- Abandon facsimile image information, as well as now useless line beginnings. -->
    <xsl:template match="//lb"/>
    <xsl:template match="//facsimile/descendant-or-self::*"/>
        
    <!-- Change part of the <edition> description to signal TXM format. -->
    <xsl:template match="/TEI//editionStmt/edition">
        <xsl:copy copy-namespaces="no"><xsl:value-of select="replace(text(), 'complète', 'simplifiée pour TXM')"/></xsl:copy>
    </xsl:template>
    
    <!-- Replace now useless part of the French <projectDesc> text with explanations on transformations from "base" file. -->
    <xsl:template match="//projectDesc[@xml:lang='fr']/p[contains(self::p, 'am/orig')]">
        <xsl:copy copy-namespaces="no"><xsl:text>Ce fichier est une modification du fichier dit de "base". Les informations morpho-syntaxiques et lemmes ont été modifiées pour permettre leur interrogation dans le logiciel TXM selon les modalités décrites dans l'élément classDecl ci-dessous. Ces changements multipliant considérablement la taille des documents, nous avons également appliqué les règles de simplification suivantes.</xsl:text></xsl:copy>
        <xsl:copy copy-namespaces="no"><xsl:text>Dans cette version dite "simplifiée" de l'édition, les éléments choice ont été résolus systématiquement : ne figure ici que le contenu textuel des enfants expan/reg/corr. Les informations graphiques sur la source originelle (facsimile, zone, etc), ont également été supprimées.</xsl:text></xsl:copy>
    </xsl:template>
    
    
    <!-- Replace now useless part of the English <projectDesc> text with explanations on transformations from "base" file. -->
    <xsl:template match="//projectDesc[@xml:lang='en']/p[contains(self::p, 'am/orig')]">
        <xsl:copy copy-namespaces="no"><xsl:text>This file is derived from said "base" file. The part-of-speech and lemma information was modified to allow its interrogation through the TXM program as described in the subsequent classDecl element. As these changes multiply considerably the size of the documents, we also applied the following simplification rules.</xsl:text></xsl:copy>
        <xsl:copy copy-namespaces="no"><xsl:text>In the present "lighter" version of the edition, the choice elements were systematically resolved: only the text content of their expan/reg/corr children is displayed here. The graphic information on the material source (facsimile, zone, etc), were deleted as well.</xsl:text></xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>