<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <!--******************************Главная категория************************************-->
    <xsl:template match="result[@module = 'catalog'][@method = 'category'][page/@id='&catMainId;']" priority="1">

    	<div class="main_width category_wr">
			<xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/(uslugi)/100/1/?extProps=ikonka,name,kratkoe_opisanie')/udata" mode="cat-with-description"/>
    	</div>

    	


        <!-- <xsl:call-template name="numpages">
            <xsl:with-param name="total" select="$catalog-items/total" />
            <xsl:with-param name="limit" select="25" />
        </xsl:call-template> -->
    </xsl:template>

    <xsl:template match="udata[@module = 'catalog'][@method = 'getCategoryList']" mode="subcategory-menu-top">
		<xsl:apply-templates select="items" mode="subcategory-menu-top_items"/>
    </xsl:template>

    <xsl:template match="items" mode="subcategory-menu-top_items">
    	<div class="tags_block_content">
			<xsl:apply-templates select="item" mode="subcategory-menu-top_items_item"/>
		</div>
    </xsl:template>

    <xsl:template match="item" mode="subcategory-menu-top_items_item">

    	<a href="{@link}">
    		<xsl:attribute name="class">
    			<xsl:if test="@link = $pageLink">
					<xsl:text>selected</xsl:text>
    			</xsl:if>
    		</xsl:attribute>
    		<xsl:value-of select="."/>
    	</a>
    </xsl:template>

    <xsl:template match="result[@module = 'catalog'][@method = 'category']">

	    <div id="showmenuhere" class="main_width content_wr">

	    	<xsl:variable name="catForSubitems">
	    		<xsl:choose>
	    			<xsl:when test="count(parents/page) = 1">
	    				<xsl:value-of select="$pageId"/>
	    			</xsl:when>
	    			<xsl:otherwise>
	    				<xsl:value-of select="parents/page[2]/@id"/>
	    			</xsl:otherwise>
	    		</xsl:choose>
	    	</xsl:variable>

	    	<xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/',$catForSubitems,'/100/1'))/udata" mode="subcategory-menu-top"/>
    		
			<section>
				<article>
					<div umi:element-id="{$pageId}" umi:field-name="content">
				        <xsl:value-of select=".//property[@name='descr']/value" disable-output-escaping="yes"/>
				    </div>
				</article>
			</section>
    	</div>
		
		<xsl:apply-templates select="document(concat('udata://catalog/getSmartCatalog/notemplate/',$pageId,'///2/?extProps=name&amp;extGroups=opisanie'))" mode="getSmartCatalog-etap"/>
		
		<xsl:apply-templates select=".//property[@name='primery_dokumentov']" mode="uslugi-sertifikaty"/>
		
		
		
		<!-- доебашить эту шнягу -->
		<xsl:variable name="objectId" select="/result/page/@object-id" />
		<xsl:variable name="tmpOtzyv" select="document(concat('udata://content/setReq/otzyv_o_usluge/eq/', $objectId))" />
		<!-- fields_filter[otzyv_o_usluge][eq]=',$objectId, -->
		<xsl:apply-templates select="document(concat('udata://content/getList//19/1/10/1///otzyv_o_usluge/',$objectId,'/?extGroups=dannye_o_otzyve'))" mode="uslugi-review"/>
		<xsl:variable name="tmpOtzyvO" select="document(concat('udata://content/unsetReq/otzyv_o_usluge/eq/', $objectId))" />


        <!-- <xsl:call-template name="numpages">
            <xsl:with-param name="total" select="$catalog-items/total" />
            <xsl:with-param name="limit" select="25" />
        </xsl:call-template> -->
    </xsl:template>

    <xsl:template match="property" mode="uslugi-sertifikaty">
    	<div class="full_width full_width__lightgrey our_partners">
	      <div class="big_heading big_heading_black">&doc_example;</div>
	      <div class="cert_list magnific_gallery">
			<xsl:apply-templates select="value" mode="about-sertifikaty"/>
	      </div>
	    </div>
    </xsl:template>

</xsl:stylesheet>