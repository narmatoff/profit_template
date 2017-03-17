<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM    "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:umi="http://www.umi-cms.ru/TR/umi"
                exclude-result-prefixes="xsl date udt umi">

    <xsl:template match="udata[@module = 'faq'][@method = 'category']">
        <apan>&empty;</apan>
    </xsl:template>

    <xsl:template match="udata[@module = 'faq'][@method = 'category'][items/item]">
        <ul class="comments">
            <xsl:apply-templates select="items/item" mode="category.list"/>
        </ul>
        <xsl:call-template name="numpages">
            <xsl:with-param name="total" select="total"/>
            <xsl:with-param name="limit" select="per_page"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="item" mode="category.list">
        <li>
            <a href="{@link}">
                <xsl:value-of select="@name"/>
            </a>
            <div>
                <span>&question;</span>
                <p>
                    <xsl:value-of select="question"/>
                </p>
            </div>
            <div>
                <span>&answer;</span>
                <p>
                    <xsl:value-of select="answer"/>
                </p>
            </div>
        </li>
    </xsl:template>

</xsl:stylesheet>