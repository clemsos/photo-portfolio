<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">

	<xsl:if test="$serie-title = ''">
	<h1><xsl:value-of select="$page-title"/></h1>
	<ul id="series">
		<xsl:apply-templates select="series-all/entry"/>
	</ul>
	</xsl:if>
	
	<xsl:if test="$serie-title != ''">
		<xsl:call-template name="single-serie">
		
		</xsl:call-template>
	</xsl:if>
	
</xsl:template>


<xsl:template match="series-all/entry">
	<li>
	<div class="serie">
		
		<a href="{$root}/series/{title/@handle}/">
		<h3><xsl:value-of select="title"/></h3>
		<img src="{$workspace}/uploads/thumbnails/{pictures/item/thumbnail/item/thumbnail/filename}" title="{title}" />
		</a>
		
	</div>
	</li>
	
</xsl:template>

<xsl:template name="single-serie">
	<div id="serie">
			<div class="slideshow pictures">
				<xsl:if test="/data/series-all/entry/description != ''">
					<div class="description slide" rel="0">				
						<xsl:value-of disable-output-escaping="yes" select="/data/series-all/entry/description"/>
					</div>
				</xsl:if>
				<xsl:for-each select="/data/series-all/entry/pictures/item">
					<div id="picture-{@id}" class="picture slide">
						<img src="{$workspace}/uploads/{picture}" title="{title}" />
					</div>
				</xsl:for-each>

				<div class="slide" rel="0">
					<ul id="thumbnails">
						<li class="thumb thumb-describe"><a class="describe" href="#">Description</a></li>
						<xsl:for-each select="/data/series-all/entry/pictures/item">
							<li class="thumb">
								<a href="{$workspace}/uploads/{picture}">
								<img src="{$workspace}/uploads/thumbnails/{thumbnail/item/thumbnail/filename}" title="{title}" />
								</a>
							</li>
						</xsl:for-each>
					</ul>
			<div class='clear' />
				</div>
			</div>
			<div class='clear' />
			<div class="nav">
				<a href="{$current-url}" class="first-but">First</a>
				<a href="#" id="prev">Prev</a> 
				<span class="current-pic">1</span> |
				<xsl:value-of select="count(/data/series-all/entry/pictures/item)" />
				<a href="#" class="thumbs-but">Thumbnails</a>
				<a href="#" id="next">Next</a> 
			</div>
			
			<div class="slideshow">
				<div class="">
				</div>
				<xsl:for-each select="/data/series-all/entry/pictures/item">
					<div id="picture-{@id}-legend" class="legend">
						<xsl:if test="title != ''">
							<h4><xsl:value-of select="title"/></h4>
						</xsl:if>
						<xsl:if test="legend != ''">
							<p><xsl:value-of select="legend"/></p>
						</xsl:if>
					</div>
				</xsl:for-each>
				<div class="">
				</div>
			</div>
	</div>

</xsl:template>

</xsl:stylesheet>