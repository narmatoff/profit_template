<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
	
	
	<xsl:template match="udata[@module = 'data'][@method = 'getGuideItems']" mode="main-partner">
		<xsl:apply-templates select="items" mode="main-partner_items"/>
	</xsl:template>

	<xsl:template match="items" mode="main-partner_items">
		<div class="full_width full_width__darkgrey our_partners">
	      	<div class="big_heading big_heading_white">Наши партнеры</div>
	      	<div class="logo_list">
		     	<xsl:apply-templates select="item" mode="main-partner_items_item"/>   
		    </div>
    	</div>
	</xsl:template>
	
	<xsl:template match="item" mode="main-partner_items_item">
		<xsl:variable name="item" select="document(concat('uobject://', @id))" />
		<div class="logo_list_item">
			<!-- <xsl:call-template name="makeThumbnail">
			        		<xsl:with-param name="alt" select="name"/>
			        		<xsl:with-param name="pwd" select="$item//property[@name='izobrazhenie_chb']/value/@path"/>
			        		<xsl:with-param name="element_id" select="@id"/>
			        		<xsl:with-param name="width" select="'auto'"/>
			        		<xsl:with-param name="height" select="'44'"/>
			        	</xsl:call-template> -->
			<img src="{$item//property[@name='izobrazhenie_chb']/value/@path}" alt="{name}"/>
		</div>
	</xsl:template>

	<xsl:template match="item" mode="nashi_priemuwestva">
		<xsl:variable name="item" select="document(concat('uobject://', @id))" />
		<div class="ease_with_us_item"><img src="{$item//property[@name='izobrazhenie']/value}" alt="{@name}"/>
			<span><xsl:value-of select="@name"/></span>
          	<xsl:value-of select="$item//property[@name='opisanie']/value" disable-output-escaping="yes"/>
        </div>
	</xsl:template>

    <xsl:template name="date">
        <xsl:param name="time"/>
        <xsl:value-of select="document(concat('udata://system/convertDate/',$time,'/(d.m.Y)'))/udata"/>
    </xsl:template>

    <!--_______________________________________________________Simple menu________________________________________________________-->

    <xsl:template match="items|value|udata" mode="simple-menu">
        <ul>
            <xsl:apply-templates select="item|page" mode="simple-menu"/>
        </ul>
    </xsl:template>

    <xsl:template match="item|page" mode="simple-menu">
        <li>
            <a href="{@link}">
                <xsl:value-of select="@name|name"/>
            </a>
        </li>
    </xsl:template>

    
    <!--
    	=============================================================
    	    					Price	
        =============================================================
    -->
	<xsl:template name="price">
	    <xsl:param name="price" select="1000"/>
	    <xsl:choose>
		    <!-- Тысячи -->
	        <xsl:when test="string-length($price) = 4">
	            <xsl:value-of select="substring($price, 1, 1)"/>
	            <xsl:text> </xsl:text>
	            <xsl:value-of select="substring($price, 2, 3)"/>
	        </xsl:when>
	        <!-- Десятки тысяч -->
	        <xsl:when test="string-length($price) = 5">
	            <xsl:value-of select="substring($price, 1, 2)"/>
	            <xsl:text> </xsl:text>
	            <xsl:value-of select="substring($price, 3, 3)"/>
	        </xsl:when>
	        <!-- Сотни тысяч -->
	        <xsl:when test="string-length($price) = 6">
	            <xsl:value-of select="substring($price, 1, 3)"/>
	            <xsl:text> </xsl:text>
	            <xsl:value-of select="substring($price, 4, 3)"/>
	        </xsl:when>
	        <!-- Миллион -->
	        <xsl:when test="string-length($price) = 7">
	            <xsl:value-of select="substring($price, 1, 1)"/>
	            <xsl:text> </xsl:text>
	            <xsl:value-of select="substring($price, 2, 3)"/>
	            <xsl:text> </xsl:text>
	            <xsl:value-of select="substring($price, 5, 3)"/>
	        </xsl:when>
	        <!-- Десятки миллионов -->
	        <xsl:when test="string-length($price) = 8">
	            <xsl:value-of select="substring($price, 1, 2)"/>
	            <xsl:text> </xsl:text>
	            <xsl:value-of select="substring($price, 3, 3)"/>
	            <xsl:text> </xsl:text>
	            <xsl:value-of select="substring($price, 6, 3)"/>
	        </xsl:when>
	    </xsl:choose>
	    <xsl:text>&suffix;</xsl:text>
	</xsl:template>



</xsl:stylesheet>