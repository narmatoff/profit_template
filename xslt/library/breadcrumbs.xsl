<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="navi">
    	<ul class="breadcrumbs" itemscope="itemscope" itemtype="http://schema.org/BreadcrumbList">
    		<li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem">
    			<a href="/" itemscope="itemscope" itemtype="http://schema.org/Thing" itemprop="item"><span itemprop="name">Главная</span></a>
    			<meta itemprop="position" content="1" />
    		</li>
        	<xsl:apply-templates select="document('udata://core/navibar/////')/udata/items/item" mode="breadcrumb" />
    	</ul>
    </xsl:template>
	

    <xsl:template match="item[position() = last()]" mode="breadcrumb">
		 	<li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem">
			 	<span itemprop="name"><xsl:value-of select="."/></span>
			 	<meta itemprop="position" content="{position()+1}" />
		 	</li>
	</xsl:template>

    <xsl:template match="item" mode="breadcrumb">
	    <li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem">
	    	<a href="{@link}" itemscope="itemscope" itemtype="http://schema.org/Thing" itemprop="item">
	    		<span itemprop="name"><xsl:value-of select="."/></span>
	    	</a>
		 	<meta itemprop="position" content="{position()+1}" />
	    </li>
	</xsl:template>

</xsl:stylesheet>