<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template name="main">
		<div id="showmenuhere" class="main_width category_wr" umi:element-id="3" umi:module="catalog" umi:method="category">
			<xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/(uslugi)/100/1/?extProps=ikonka,name')/udata" mode="cat-main"/>
    	</div>
        <div class="full_width privelegies">
	      <div class="ease_with_us">
	        <div class="big_heading" umi:element-id="$pageId" umi:field-name="nazvanie_zagolovka"><xsl:value-of select=".//property[@name='nazvanie_zagolovka']/value"/></div>
	        <p umi:element-id="$pageId" umi:field-name="tekst_pod_zagolovkom"><xsl:value-of select=".//property[@name='tekst_pod_zagolovkom']/value" disable-output-escaping="yes" /></p>
	      </div>

	      <div class="ease_with_us_items">
	      	<xsl:apply-templates select=".//property[@name='nashi_priemuwestva']/value" mode="nashi_priemuwestva"/>
	      </div>
    	</div>

	    <!-- отзывы -->
		<xsl:apply-templates select="document('udata://content/getList//19/1/10/1?extGroups=dannye_o_otzyve')" mode="main-review"/>
	    <!-- отзывы -->

	    <!-- отзывы -->
		<xsl:apply-templates select="document('udata://content/getList//20/1/4/1?extGroups=informaciya_o_specialiste')" mode="main-team"/>
	    <!-- отзывы -->
		
		<!-- пертнеры -->
		<xsl:apply-templates select="document('udata://data/getGuideItems//128')" mode="main-partner"/>
		<!-- пертнеры -->
		
    
    
    </xsl:template>

</xsl:stylesheet>