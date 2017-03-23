<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:umi="http://www.umi-cms.ru/TR/umi"
                exclude-result-prefixes="xsl date udt umi">

    <xsl:template match="result[@module = 'faq'][@method = 'post_question']">
        <div class="questions_text">
        	<xsl:apply-templates select="document('udata://faq/post_question')/udata"/>
        </div>
	</xsl:template>

	<xsl:template match="udata[@module = 'faq'][@method = 'post_question']">
    		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>


</xsl:stylesheet>