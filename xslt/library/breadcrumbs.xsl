<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="navi">
    	<ul class="breadcrumbs">
    		<li>
    			<a href="/">Главная</a>
    		</li>
        	<xsl:apply-templates select="document('udata://core/navibar/////')/udata/items/item" mode="breadcrumb" />
    	</ul>
    </xsl:template>
	

    <xsl:template match="item[position() = last()]" mode="breadcrumb">
		 	<li>
			 	<xsl:value-of select="."/>
		 	</li>
	</xsl:template>

    <xsl:template match="item" mode="breadcrumb">
	    <li>
	    	<a href="{@link}"><xsl:value-of select="."/></a>
	    </li>
	</xsl:template>

</xsl:stylesheet>