<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'news'][@method = 'rubric']">
        <xsl:variable name="news" select="document(concat('udata://news/lastlist/', $pageId, '/'))/udata"/>
            <xsl:apply-templates select="$news/total"/>
            <section class="news-wrap">
                <xsl:apply-templates select="$news/items/item" />
            </section>

	</xsl:template>

</xsl:stylesheet>