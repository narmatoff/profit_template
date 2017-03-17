<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template match="udata[@module = 'content'][@method = 'getRecentPages']" mode="catalog-category">
        <section class="recent-views">

            <h3 class="recent-views-title">
                <xsl:choose>
                    <xsl:when test="count(items/item)=0">
                        &not_seeing;
                    </xsl:when>
                    <xsl:otherwise>
                        &u_see;
                    </xsl:otherwise>
                </xsl:choose>
            </h3>

            <div class="recent-views-content clearfix">
                <xsl:apply-templates select="items/item" mode="recent-page"/>
            </div>

        </section>
    </xsl:template>

    <xsl:template match="item" mode="recent-page">
        <div class="recent-views-item">
            <xsl:call-template name="makeThumbnail">
                <xsl:with-param name="width" select="222"/>
                <xsl:with-param name="height" select="186"/>
                <xsl:with-param name="element_id" select="@id"/>
                <xsl:with-param name="field_name"><xsl:text>menu_pic_a</xsl:text></xsl:with-param>
                <xsl:with-param name="class">recent-views-item-img</xsl:with-param>
            </xsl:call-template>
            <a href="{@link}" class="recent-views-item-link">
                <xsl:value-of select="document(concat('upage://',@id,'.h1'))/udata/property/value"/>
            </a>
        </div>
    </xsl:template>

</xsl:stylesheet>