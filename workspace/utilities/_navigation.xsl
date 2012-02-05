<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="navigation">
	<ul id="menu">
		<xsl:apply-templates select="page[not(types/type = 'hidden') and not(types/type = 'admin')]"/>
	</ul>
	<div class="clear"></div>
</xsl:template>

<xsl:template match="page">
	<li>
		<a href="{$root}/{@handle}/">
			<xsl:if test="@handle = $root-page">
				<xsl:attribute name="class">active</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="name"/>
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>