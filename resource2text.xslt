<?xml version='1.0' encoding='iso-8859-1'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="text" version="1.0" encoding="utf-8" media-type="text/plain"/>

	<xsl:param name="resource-id"/>

	<xsl:template match="//resources">
		<xsl:value-of select="concat('OCF_RESOURCE_INSTANCE=&quot;',$resource-id,'&quot;')"/><xsl:text>
</xsl:text>
		<xsl:apply-templates select=".//primitive[@id = $resource-id]"/>
	</xsl:template>

	<xsl:template match="primitive[@class = 'ocf']">
		<xsl:value-of select="concat('OCF_RESOURCE_AGENT=&quot;',@provider,'::',@type,'&quot;')"/><xsl:text>
</xsl:text>
		<xsl:apply-templates select="./instance_attributes/attributes/nvpair"/>
	</xsl:template>

	<xsl:template match="nvpair[@name = 'OCF_CHECK_LEVEL']">
		<xsl:value-of select="concat('OCF_CHECK_LEVEL=&quot;',@value,'&quot;')"/><xsl:text>
</xsl:text>
	</xsl:template>

	<xsl:template match="nvpair">
		<xsl:value-of select="concat('OCF_RESKEY_',@name,'=&quot;',@value,'&quot;')"/><xsl:text>
</xsl:text>
	</xsl:template>

</xsl:stylesheet>
