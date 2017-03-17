<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <!--_______________________________________________________Main menu________________________________________________________-->
    <xsl:template match="udata[@module = 'menu'][@method = 'draw']" mode="menu-top">
		<ul class="top_nav__menu" >
        	<xsl:apply-templates select="item" mode="menu-top_item" />
        </ul>
    </xsl:template>
    <xsl:template match="item" mode="menu-top_item">
    	<li>
			<a href="{@link}">
	            <xsl:value-of select="@name" />
	        </a>
	    </li>
    </xsl:template>

    <xsl:template match="item[@status='active']" mode="menu-top_item">
    	<li class="selected_menuitem">
			<a href="{@link}">
	            <xsl:value-of select="@name" />
	        </a>
	    </li>
    </xsl:template>

  
</xsl:stylesheet>
