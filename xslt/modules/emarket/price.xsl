<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet	version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

<xsl:template match="udata[@module = 'emarket'][@method = 'price']">
	<xsl:choose>
		<xsl:when test="currencies/price/actual &gt; 0">
			<xsl:value-of select="currencies/price/actual"/>&nbsp;<xsl:value-of select="price/@suffix"/>
		</xsl:when>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>