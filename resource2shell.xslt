<?xml version="1.0" encoding="iso-8859-1"?>
<!--

An XSLT script to convert a primitive resource from HA-Linux CIB xml
into environment variables that can be used with OCF resource agents.

http://github.com/joekhoobyar/ha-tools

Author:		Joe Khoobyar <joe@ankhcraft.com>
License:	GNU General Public License (GPL) version 2
Copyright (c) 2009 All Rights Reserved

-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="text" version="1.0" encoding="utf-8" media-type="text/plain"/>

	<xsl:param name="resource-id"/>

	<xsl:template match="/">
		<xsl:value-of select="concat('OCF_RESOURCE_INSTANCE=&quot;',$resource-id,'&quot; ')"/>
		<xsl:apply-templates select="//primitive[@id = $resource-id]"/>
	</xsl:template>

	<xsl:template match="primitive[@class = 'ocf']">
		<xsl:apply-templates select="instance_attributes/attributes/nvpair"/>
		<xsl:value-of select="concat('&quot;$OCF_ROOT/resource.d/',@provider,'/',@type,'&quot;')"/>
	</xsl:template>

	<xsl:template match="nvpair[@name = 'OCF_CHECK_LEVEL']">
		<xsl:value-of select="concat('OCF_CHECK_LEVEL=&quot;',@value,'&quot; ')"/>
	</xsl:template>

	<xsl:template match="nvpair">
		<xsl:value-of select="concat('OCF_RESKEY_',@name,'=&quot;',@value,'&quot; ')"/>
	</xsl:template>

</xsl:stylesheet>
