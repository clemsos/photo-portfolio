<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<div id="writing">
		
		<xsl:if test="$writing-title = ''">
		<h2><xsl:value-of select="writings-all/entry[featured = 'Yes']/title"/></h2>
		
			<div class="full-text">
				<xsl:copy-of select="writings-all/entry[featured = 'Yes']/body" />
			</div>
		</xsl:if>
		
		<xsl:if test="$writing-title != ''">
			<h2><xsl:value-of select="/data/writings-all/entry[@id= $writing-title ]/title" /></h2>
			<div class="full-text">
				<xsl:copy-of select="/data/writings-all/entry[@id= $writing-title ]/body" />
			</div>
		</xsl:if>

		<div class="utils">
			<ul id="files">
				<xsl:apply-templates select="writings-all/entry"/>
			</ul>
		</div>
	</div>
</xsl:template>


<xsl:template match="writings-all/entry">
	<li class="writings">
		<h4><a class="writing" href="{$root}/{$root-page}/{@id}"><xsl:value-of select="title"/></a></h4>
		<xsl:value-of select="excerpt"/>
		
	<xsl:if test="document/filename = ''">
		<p><a class='dl' href="{$workspace}/uploads/writings/{document/filename}">Download
		(<xsl:value-of select="substring-after(document/@type,'/')"/>,<xsl:value-of select="document/@size"/>)</a></p>
	</xsl:if>
		
	</li>
</xsl:template>

<xsl:template name="single-writing">

</xsl:template>

</xsl:stylesheet>