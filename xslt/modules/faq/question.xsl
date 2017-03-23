<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:umi="http://www.umi-cms.ru/TR/umi"
                exclude-result-prefixes="xsl date udt umi">

    <xsl:template match="result[@module = 'faq'][@method = 'question']">
    	<div class="full_width full_width__white">
      		<div id="showmenuhere" class="main_width content_wr">
      			<div class="tags_block_content">
					<xsl:apply-templates select="document(concat('udata://faq/project//', parents/page[1]/@id, '/100/1'))" mode="tags_block_faq">
						<xsl:with-param name="parentsLink" select="parents/page[2]/@link"/>
					</xsl:apply-templates>
		        </div>
		        <section>
		        	<p><xsl:value-of select=".//property[@name='question']/value" disable-output-escaping="yes"/></p>
	        		<p><xsl:value-of select=".//property[@name='answer']/value" disable-output-escaping="yes"/></p>
		        </section>
      		</div>
      	</div>

      	<xsl:call-template name="addQuestionForm">
			<xsl:with-param name="pageCat" select="parents/page[1]/@id"/>
			<xsl:with-param name="parentsLink" select="parents/page[2]/@link"/>
		</xsl:call-template>
		
	</xsl:template>


</xsl:stylesheet>