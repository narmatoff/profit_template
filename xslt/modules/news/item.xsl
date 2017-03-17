<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'news'][@method = 'item']">
            <section class="content">
                <h1><xsl:value-of select=".//property[@name='h1']/value"/></h1>

                <div umi:element-id="{$pageId}" umi:field-name="content">
                    <xsl:value-of select=".//property[@name='content']/value" disable-output-escaping="yes"/>
                </div>
            </section>
	</xsl:template>

</xsl:stylesheet>