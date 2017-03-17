<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template name="head">
		<meta charset="UTF-8"/>
	    <title><xsl:value-of select="result/@title"/></title>
	    <meta charset="UTF-8"/>
	    <meta name="viewport" content="width=device-width,width=1160"/>
	    <meta name="description" content="{result/meta/description}"/>
	    <meta name="keywords" content="{result/meta/keywords}"/>
	    <meta name="author" content="lum.ru"/>
	    <style>
	      .loading_resources{
	      position: fixed;
	      width: 100%;
	      height: 100%;
	      background-color: rgba(0, 0, 0, 0.7);
	      top: 0;
	      left: 0;
	      z-index: 99;
	      display: block;
	      transition:all ease .8s;
	      }
	    </style>
	    <xsl:if test="result/@pageId">
		   <xsl:variable name="relCanonical" select="document(concat('udata://seo/getRelCanonical/void/', result/@pageId))/udata/@link" />
		   <xsl:if test="$relCanonical">
		      <link rel="canonical">
		         <xsl:attribute name="href">
		            <xsl:value-of select="$relCanonical" />
		         </xsl:attribute>
		      </link>
		   </xsl:if>
		</xsl:if>
	    <script src="https://cdn.jsdelivr.net/pace/1.0.2/pace.min.js"></script>
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/pace/1.0.2/themes/yellow/pace-theme-center-simple.css"/>
	    <link rel="stylesheet" href="{$template-resources}dist/css/main.css"/>
	    <link rel="stylesheet" href="{$template-resources}dist/components/swiper/dist/css/swiper.css"/>
	    <link rel="stylesheet" href="{$template-resources}dist/components/magnific-popup/dist/magnific-popup.css"/>
        <xsl:if test="result/page/properties/group[@name = 'more_params']/property[@name = 'robots_deny']/value">
            <meta name="ROBOTS" CONTENT="NOINDEX, NOFOLLOW"/>
        </xsl:if>

        <!-- styles -->
		
    </xsl:template>

</xsl:stylesheet>