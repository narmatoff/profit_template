<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <!--******************************Главная категория************************************-->
    <xsl:template match="result[@module = 'catalog'][@method = 'category']">

    	
    	<xsl:apply-templates select="document('udata://catalog/getSmartFilters//15//3/86')/udata"/>

        <xsl:variable name="catalog-items" select="document(concat('udata://catalog/getSmartCatalog//',$pageId,'///5'))/udata"/>
		
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tbody>
                    <tr>
                        <td width="100%" valign="top">
                            <xsl:apply-templates select="$catalog-items"/>
                        </td>
                        <td width="20"><img src="{$template-resources}/images/none.gif" width="1" height="1" alt=""/></td>
                    </tr>
                </tbody>
            </table>

            <div><xsl:value-of select=".//property[@name='descr']/value" disable-output-escaping="yes"/></div>
            


        <xsl:call-template name="numpages">
            <xsl:with-param name="total" select="$catalog-items/total" />
            <xsl:with-param name="limit" select="25" />
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>