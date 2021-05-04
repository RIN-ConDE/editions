<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:txm="http://textometrie.org/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- This transformation produces a TXM compatible TEI-XML out of the "base" encoding of a ConDÉ corpus witness.
        This transformation keeps every bit of information in the 'base' file.
        
        The TXM formatting making files enormous, we also propose the "conde-to-txm-lighter.xsl" transformation,
        where all <choice> elements are resolved to their modernized/expanded version, and the <facsimile> and <lb> elements deleted.
        For the same size reason, this transformation will not indent the document automatically.
    -->
    
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
    
    <xsl:template match="/TEI/teiHeader/encodingDesc">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates/>
            <classDecl>
                <taxonomy id="pos">
                    <bibl><title>pos tagset built from model 
                        /home/mdecorde/runtime-rcpapplication.product/treetagger-models/fr.par</title></bibl>
                </taxonomy>
                <taxonomy id="lemma">
                    <bibl><title>fr lemma of the model
                        /home/mdecorde/runtime-rcpapplication.product/treetagger-models/fr.par</title></bibl>
                </taxonomy>
            </classDecl>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="//w">
        <xsl:copy copy-namespaces="no">
            <txm:form><xsl:apply-templates select="node()"/></txm:form>
            <txm:ana type="token-number"><xsl:value-of select="@n"/></txm:ana>
            <txm:ana type="#lemma"><xsl:value-of select="@lemma"/></txm:ana>
            <txm:ana type="#pos"><xsl:value-of select="@pos"/></txm:ana>
        </xsl:copy>
    </xsl:template>
    
    
    <!-- Changing part of the <edition> description. -->
    <xsl:template match="/TEI//editionStmt/edition">
        <xsl:copy copy-namespaces="no"><xsl:value-of select="replace(child::text(), 'complète', 'complète pour TXM')"/></>
    </xsl:template>
    
    <!-- Replace now useless part of the French <projectDesc> text with explanations on transformations from "base" file. -->
    <xsl:template match="//projectDesc[@xml:lang='fr']/p[contains(self::p, 'am/orig')]">
        <xsl:copy copy-namespaces="no"><xsl:text>Ce fichier est une modification du fichier dit de "base". Les informations morpho-syntaxiques et lemmes ont été modifiées pour permettre leur interrogation dans le logiciel TXM selon les modalités décrites dans l'élément classDecl ci-dessous.</xsl:text></>
    </xsl:template>
    
    
    <!-- Replace now useless part of the English <projectDesc> text with explanations on transformations from "base" file. -->
    <xsl:template match="//projectDesc[@xml:lang='en']/p[contains(self::p, 'am/orig')]">
        <xsl:copy copy-namespaces="no"><xsl:text>This file is derived from said "base" file. The part-of-speech and lemma information was modified to allow its interrogation through the TXM program as described in the subsequent classDecl element.</xsl:text></>
    </xsl:template>
    
</xsl:stylesheet>