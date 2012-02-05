<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="header.xsl"/>
<xsl:import href="date-time.xsl"/>
<xsl:import href="navigation.xsl"/>

<xsl:variable name="member-is-logged-in" select="boolean(//events/member-login-info/@logged-in = 'yes')"/>
<xsl:param name="serie-title" value=''/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />
	
<xsl:template match="/">

<head>
<title><xsl:call-template name="page-head-title"/></title>
<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/style.css" />

<meta name="description" content="photographer,photography,photograph,摄影师,摄影,图片,照片,image,picture,Shanghai,China" />
<meta name="keywords" content="landscape, architecture, architect, architectural, 建筑师, 建筑, construction, building, 房地产, industrial, urbanism, urban, urban planning, 城市, design, 设计" />
<meta name="author" content="peterdixie,Peter,Dixie" />
   
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript"></script>
<!--[if lt IE 8]>
  <link rel="stylesheet" href="{$workspace}/ie.css" type="text/css" media="screen, projection">
<![endif]-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js" type="text/javascript"></script>
<script src="{$workspace}/js/jquery.cycle.all.min.js" type="text/javascript"></script>
<script src="{$workspace}/js/peterdixie.js" type="text/javascript"></script>
</head>

<body>
 <div id="wrap">
	
	<div id="sidebar">
		<div id="branding">
			<h1><a href="{$root}"><xsl:value-of select="$website-name"/></a></h1>
		</div>
		<div id="nav">
		  <ul id="menu">
			<li class="home last">
				<a href="{$root}" name="Back to Home">
					<xsl:if test="$current-page = 'home'">
					     <xsl:attribute name="class">active</xsl:attribute>
					</xsl:if>
					Home
				</a>
			</li>
			<xsl:apply-templates select="data/navigation-series/entry"/>
			<xsl:apply-templates select="data/navigation"/>
		  </ul>
		
			<div id="infos" class="last">
				<a href="mailto:hello@peterdixie.com" title="Get in touch with me">peter@peterdixie.com</a>
				<p>+86 134 0216 1177</p>
				<p>+86 136 8165 5600 <span class="zh">(中文)</span></p>
				<p>skype: Peter.Dixie</p>
				<ul id='sns'>
					<li>
						<a  class="posterous" href="http://peterdixie.posterous.com">Weibo</a>
					</li>
					
					<li>
						<a class="twitter" href="https://twitter.com/peterdixie">Twitter</a>
					</li>
					<li>
						<a class="weibo" href="http://blog.sina.com.cn/peterdixie">Posterous </a>
					</li>
					
				</ul>
				<div class="clear" />
			</div>	
			<div id="copyright" class="last">
				<p>(c) Peter Dixie</p> 
				<p>All rights reserved</p>
			</div>
			
		</div>
	</div>
	<div id="content">
		<xsl:apply-templates/>
	</div>
	
	<div class="clear"></div>	
</div>

</body>

</xsl:template>
</xsl:stylesheet>