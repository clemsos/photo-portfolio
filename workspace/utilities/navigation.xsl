<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="navigation">

	
    <xsl:apply-templates select="page" />
	<xsl:apply-templates select="navigation-series/entry" />
	
    <xsl:if test="/data/events/login-info/@logged-in = 'true'">
      <li><a href="{$root}/symphony/">Admin</a></li>
      <li><a href="?debug">Debug</a></li>
    </xsl:if>


</xsl:template>
 

<xsl:template match="page">	
  <xsl:if test="not(types/type = 'hidden') and not(types/type = 'admin')">
    <li>
      	<a href="{$root}/{@handle}/">
	     <xsl:if test="$current-page-id = @id">
	        <xsl:attribute name="class">active</xsl:attribute>
	     </xsl:if>
        	<xsl:value-of select="name"/>
      	</a>
    </li>
  </xsl:if>
</xsl:template>

<xsl:template match="navigation-series/entry">
	<li>
		<xsl:if test="menu-top = 'Yes'">
	        <xsl:attribute name="class">top-item</xsl:attribute>
	     </xsl:if>
		<a href="{$root}/series/{title/@handle}">
	    <xsl:if test="$current-page = 'series'">
		     <xsl:if test=" ($serie-title != '') and ($serie-title = title/@handle) ">
		        <xsl:attribute name="class">active</xsl:attribute>
		     </xsl:if>
		</xsl:if>
		
		<xsl:value-of select="title"/>
		
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>