<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

   <xsl:template match="udata[@method = 'lastlist']/archive"/>
   <xsl:template match="udata[@method = 'lastlist']/archive_link"/>
   <xsl:template match="udata[@method = 'lastlist']/total"/>
   <xsl:template match="udata[@method = 'lastlist']/per_page"/>
   <xsl:template match="udata[@method = 'lastlist']/category_id"/>
   <xsl:template match="udata[@method = 'lastlist']/extended"/>

	<xsl:template match="udata[@method = 'lastlist']/items/item">

		<article>	
          <div class="post_heading">
            <div class="post_date">
				<xsl:apply-templates select="document(concat('udata://content/convertDate/', @publish_time, '/d%20M/1'))/udata" mode="news-date"/>
            </div>
            <div class="post_header">
            	<a href="{@link}">
            		<xsl:value-of select="@name"/>
            	</a>
            </div>
          </div>
       	<xsl:apply-templates select=".//property[@name='tags']" mode="news-lents-tags"/>
      
          <xsl:value-of select=".//property[@name='anons']/value" disable-output-escaping="yes"/>
        </article>

	</xsl:template>

	<xsl:template match="property" mode="news-lents-tags">
		<div class="post_tags">
            <div class="tags_block_content">
            	<!-- TODO: написать обработку кликов по тегам -->
            	<xsl:apply-templates select="value" mode="news-lents-tag"/>
	        </div>
      </div>
	</xsl:template>

	<xsl:template match="value|item" mode="news-lents-tag">
		<a href="#tag" data-tag="{.}">
			<xsl:attribute name="class">
				<xsl:text>tag_link</xsl:text>
				<xsl:if test="@is_selected">
					<xsl:text> selected</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<xsl:value-of select="."/>
		</a>
	</xsl:template>

	<xsl:template match="d" mode="news-date">
		<span><xsl:value-of select="."/></span>
	</xsl:template>

	
	<xsl:template match="M" mode="news-date">
		<span><xsl:value-of select="."/></span>
	</xsl:template>
</xsl:stylesheet>