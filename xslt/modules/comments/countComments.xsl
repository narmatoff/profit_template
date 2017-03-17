<?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE xsl:stylesheet SYSTEM    "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:umi="http://www.umi-cms.ru/TR/umi"
                exclude-result-prefixes="xsl date udt umi">

<xsl:template match="udata[@module = 'comments'][@method = 'countComments']">
    <xsl:value-of select="."/>
</xsl:template>

</xsl:stylesheet>