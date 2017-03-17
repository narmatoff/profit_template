<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	
	
	<xsl:template match="item" mode="cat-main_item">
		<a href="{@link}">
			<xsl:call-template name="makeThumbnail">
				<xsl:with-param name="alt" select="."/>
				<xsl:with-param name="width" select="459"/>
				<xsl:with-param name="height" select="200"/>
				<xsl:with-param name="element_id" select="@id"/>
				<xsl:with-param name="field_name" select="'header_pic'"/>
			</xsl:call-template>
        </a>
	</xsl:template>


	<xsl:template match="udata[@module = 'catalog'][@method = 'getSmartCatalog']">
		<xsl:apply-templates select=".//lines/item" />
	</xsl:template>

	<xsl:template match="udata[@module = 'catalog' and @method = 'getSmartCatalog']//item">
        <xsl:variable name="item_opc" select="document(concat('upage://',@id))" />
        <xsl:variable name="item_pic" select="$item_opc//property[@name='photo']/value[position() = 1]" />
        
                <table width="254" cellpadding="0" cellspacing="0" border="0" align="left" style="position:relative;">
                    <tbody>
                        <tr>
                            <td width="20" rowspan="2"><img src="{$template-resources}/images/none.gif" width="1" height="1" alt=""/></td>
                            <td style="position:relative">
                                <div style="position:relative;top:0;left:0">
                                    <div style="height:353px;vertical-align:middle;">
                                        <a href="{@link}">
                                            <xsl:call-template name="makeThumbnail">
                                                <xsl:with-param name="alt" select="."/>
                                                <xsl:with-param name="width" select="234"/>
                                                <xsl:with-param name="height" select="351"/>
                                                <xsl:with-param name="element_id" select="@id"/>
                                                <xsl:with-param name="field_name" select="'photo'"/>
                                            </xsl:call-template>
                                        </a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:5px; background-color:#212121">
                                <table cellpadding="0" cellspacing="5" border="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td class="list_name"><xsl:value-of select="." /></td>
                                        </tr>
                                        <tr>
                                            <td class="list_price"><xsl:value-of select="translate(format-number($item_opc//property[@name='price']/value, '###,###'), ',', ' ' )" /> руб</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="20"><img src="{$template-resources}/images/none.gif" width="1" height="1" alt=""/></td>
                        </tr>
                    </tbody>
                </table>
	</xsl:template>

</xsl:stylesheet>