<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template match="udata[@module = 'catalog'][@method = 'getSmartFilters']"> 
		<div class="filter">
			<xsl:apply-templates select="document(concat('udata://catalog/getSmartFilters//', $pageId, '/0/3'))/udata" mode="filter"/>
		</div>
    </xsl:template>

    <xsl:template match="udata" mode="filter">
		<form action="" method="get">
			<xsl:apply-templates select="group[@name='filter']/field" mode="field_filter"/>
			<xsl:apply-templates select="group[@name='opisanie']/field" mode="field_filter_opisanie"/>
	        <div>
                <br/>
                <input name="search" type="hidden" value="yes"/>
            	<input onmouseout="this.src='{$template-resources}images/search.png'" onmouseover="this.src='{$template-resources}images/search_over.png'" src="{$template-resources}images/search.png" type="submit"/>
	        </div>    
	    </form>
	</xsl:template>

	<xsl:template match="field" mode="field_filter">
		<div>
			<xsl:value-of select="@title" /><br/>
            <select name="filter[{@name}]">
            	<option value="">
					Все
				</option>
                <xsl:apply-templates select="item" mode="field_filter_item"/>
            </select>
        </div>
      
	</xsl:template>

	<xsl:template match="item" mode="field_filter_item">
		<option value="{.}">
			<xsl:value-of select="." />
		</option>
	</xsl:template>

	<xsl:template match="field" mode="field_filter_opisanie">
		<div>
			<xsl:value-of select="@title" /><br/>
            <input class="text" name="filter[{@name}]" type="text" value=""/>
            <!-- <xsl:apply-templates select="item" mode="field_filter_opisanie_item"/> -->
        </div>
      
	</xsl:template>

	<xsl:template match="item" mode="field_filter_opisanie_item">
		
	</xsl:template>

	</xsl:stylesheet>