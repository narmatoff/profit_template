<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="udata[@module = 'catalog'][@method = 'getCategoryList']" mode="cat-main">
		
		<xsl:apply-templates select=".//items/item" mode="cat-main_item"/>

	</xsl:template>
	
	<xsl:template match="item" mode="cat-main_item">
        <a href="{@link}" class="category_item">
			<img umi:element-id="{@id}" umi:field-name="ikonka" src="{.//property[@name='ikonka']/value}" alt="{@name}"/>
		    <span umi:element-id="{@id}" umi:field-name="name"><xsl:value-of select="@name"/></span>
    		</a>
	</xsl:template>


</xsl:stylesheet>