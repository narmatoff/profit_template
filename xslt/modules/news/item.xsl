<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'news'][@method = 'item']">

    <div class="main_width content_wr">
    	<section>
	        <article><a href="#" class="post_back"></a>
	          <div class="post_heading">
	            <div class="post_date">
					<xsl:apply-templates select="document(concat('udata://content/convertDate/', .//property[@name = 'publish_time']/value/@unix-timestamp, '/d%20M/1'))/udata" mode="news-date"/>
	            </div>
	            <div class="post_header">
	            	<xsl:value-of select="page/name"/>
	            	</div>
	          </div>
	          <div class="post_author"><span>Автор - </span>
	          	<span>
	          		<xsl:value-of select=".//property[@name='avtor']/value/item/@name"/>
	          	</span>
	          </div>

	       	<xsl:apply-templates select=".//property[@name='tags']" mode="news-lents-tags"/>
			<xsl:if test=".//property[@name='publish_pic']/value/@path">
				<xsl:call-template name="makeThumbnail">
	        		<xsl:with-param name="alt" select="name"/>
	        		<xsl:with-param name="pwd" select=".//property[@name='publish_pic']/value/@path"/>
	        		<xsl:with-param name="element_id" select="@id"/>
	        		<xsl:with-param name="width" select="'728'"/>
	        		<xsl:with-param name="height" select="'auto'"/>
	        	</xsl:call-template>
			</xsl:if>

	          <xsl:value-of select=".//property[@name='content']/value" disable-output-escaping="yes" />

	          <strong>поделиться</strong>
	        </article>
	      </section>
    </div>

	</xsl:template>

</xsl:stylesheet>