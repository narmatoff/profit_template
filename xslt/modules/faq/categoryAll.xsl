<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM    "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:umi="http://www.umi-cms.ru/TR/umi"
                exclude-result-prefixes="xsl date udt umi">

    <xsl:template match="udata[@module = 'faq'][@method = 'categoryAll']">
		<xsl:apply-templates select="items" mode="faq_lists-items"/>	
    </xsl:template>

    <xsl:template match="items" mode="faq_lists-items">
        <section>
    	   	<xsl:apply-templates select="item" mode="faq_lists-item"/>
	   </section>
    </xsl:template>

    <xsl:template match="item" mode="faq_lists-item">
    	<article>
	        <div class="post_heading">
	          <div class="post_header">
	          	<a href="{@link}">
	          		<xsl:value-of select="@name"/>
	          	</a>
	          </div>
	        </div>
	        <p><xsl:value-of select="question" disable-output-escaping="yes"/></p>
	        <p><xsl:value-of select="answer" disable-output-escaping="yes"/></p>
      </article>
    </xsl:template>




</xsl:stylesheet>