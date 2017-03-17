<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet	version="1.0"
				xmlns="http://www.w3.org/1999/xhtml"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:date="http://exslt.org/dates-and-times"
				xmlns:udt="http://umi-cms.ru/2007/UData/templates"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				exclude-result-prefixes="xsl date udt xlink">

	<xsl:param name="template" />

	<xsl:template match="result[@module = 'webforms'][@method = 'posted']">
		<div>
			<xsl:apply-templates select="document(concat('udata://webforms/posted/', $template,'/'))/udata" />
		</div>
	</xsl:template>

	<xsl:template match="udata[@module = 'webforms'][@method = 'posted']">
        <div class="wrap clearfix">
		    <h1 style="padding: 100px 0;text-align: center;line-height: 35px"><xsl:value-of select="." disable-output-escaping="yes" /></h1>
		    <div class="button leave-bid-button-zad" style="margin:-60px 0px 0px 42%;width: 140px;" onclick="history.back();">Назад</div>
        </div>

	</xsl:template>

</xsl:stylesheet>