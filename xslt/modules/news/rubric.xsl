<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'news'][@method = 'rubric']">
		
		<!-- TODO: блок с навигацией -->
		<!-- <xsl:apply-templates select="document('udata://stat/tagsCloud//10/10')/udata/lines" /> -->
		<div class="main_width content_wr">
	      
     		<div class="tags_block_content">
     			<xsl:apply-templates select="document(concat('udata://content/getTags/', $pageId))/udata/items/item" mode="news-lents-tag"/>
     		</div>

        	<xsl:variable name="news" select="document(concat('udata://news/lastlist/', $pageId, '///?extProps=anons,tags,name'))/udata"/>

            <section>
                <xsl:apply-templates select="$news/items/item" />
	            <!-- кнопка прокрутки + пагинация -->
		        <xsl:call-template name="numpages">
			        <xsl:with-param name="requesurl" select="concat('/udata://news/lastlist/', $pageId, '///?extProps=anons,tags,name')" />
			        <xsl:with-param name="template" select="'modules/news/lastlist.xsl'" />

			        <xsl:with-param name="total" select="$news/total" />
	        		<xsl:with-param name="limit" select="$news/per_page" />
	    		</xsl:call-template>
            </section>

        </div>

	</xsl:template>



</xsl:stylesheet>