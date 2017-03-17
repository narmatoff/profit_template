<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <!--******************************News item on main page************************************-->
    <xsl:template match="udata[@method = 'lastlist']/items/item" mode="news-item">
        <div class="main-news-item">
            <a href="{@link}" umi:element-id="{@id}" umi:field-name="name"><xsl:value-of select="."/></a>
            <p style="margin-top:5px;" umi:element-id="{@id}" umi:field-name="publish_time">
                <xsl:call-template name="date">
                    <xsl:with-param name="time" select="@publish_time"/>
                </xsl:call-template>
            </p>
        </div>
    </xsl:template>

	<!--
<xsl:template match="udata[@module = 'news'][@method = 'lastlist']">
		<div class="news" umi:element-id="{category_id}" umi:module="news" umi:method="lastlist" umi:sortable="sortable" umi:add-method="popup" />
	</xsl:template>
-->

	<xsl:template match="udata[@method = 'lastlist']/items/item">
		<xsl:variable name="news" select="document(concat('upage://',@id))/udata"/>
		<div class="news-item clearfix">
            <h2 class="news-item-title"><a href="{@link}"><xsl:value-of select="."/></a></h2>


            <xsl:if test="$news//property[@name='anons_pic']/value!=''">
                <div class="news-img">
                    <xsl:call-template name="makeThumbnail">
                        <xsl:with-param name="width" select="190"/>
                        <xsl:with-param name="height" select="189"/>
                        <xsl:with-param name="element_id" select="@id"/>
                        <xsl:with-param name="field_name"><xsl:text>anons_pic</xsl:text></xsl:with-param>
                    </xsl:call-template>
                </div>
            </xsl:if>
            <div class="news-content">
                <xsl:if test="$news//property[@name='anons_pic']/value=''">
                    <xsl:attribute name="style">width:100%</xsl:attribute>
                </xsl:if>
                	<xsl:value-of select="$news//property[@name='anons']/value" disable-output-escaping="yes" />

                <p class="news-date">
                    <xsl:call-template name="date">
                        <xsl:with-param name="time" select="@publish_time"/>
                    </xsl:call-template>
                </p>

                <!-- div class="news-more-info button">
                    <a href="{@link}">&podrobn;</a>
                </div> -->
            </div>
        </div>
	</xsl:template>

</xsl:stylesheet>