<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="content/__common.xsl" />
	<xsl:include href="webforms/__common.xsl" />
	<xsl:include href="catalog/__common.xsl" />
	<xsl:include href="news/__common.xsl" />
	<xsl:include href="faq/__common.xsl"/>

	<xsl:template match="result">
		<xsl:value-of select="."/>
	</xsl:template>

	

</xsl:stylesheet>