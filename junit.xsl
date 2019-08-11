<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:html="http://www.w3.org/1999/xhtml"
	xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="html">

	<xsl:output method="text" />
	<xsl:template match="testsuite">
		<xsl:for-each select="testcase">
		    <xsl:apply-templates select="failure"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="testsuite2">
		<xsl:for-each select="testcase">
		    <xsl:apply-templates select="failure"/>
			<xsl:for-each select="failure">
		    <xsl:apply-templates select="current()"/>
				<xsl:value-of select="@message"/>
				<!-- 
				<xsl:value-of
					select="fn:substring-after( @message, 'Error loading ')">
					<xsl:value-of
						select="fn:substring-after(current(),'3')" />
					<xsl:value-of select="current()" />
				</xsl:value-of> -->
				<xsl:text>&#10;&#13;</xsl:text>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="failure">
	<xsl:value-of select="substring-before(substring-after(current(),': '),':')" /><xsl:text>=</xsl:text>
	<xsl:value-of select="substring-before(substring-after(substring-after(current(),':'),':'),'&#10;')" /><xsl:text>&#13;</xsl:text>
	</xsl:template>

</xsl:stylesheet>