<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'news'][@method = 'rubric']">
		
		<!-- TODO: блок с навигацией -->
		<!-- <xsl:apply-templates select="document('udata://stat/tagsCloud//10/10')/udata/lines" /> -->
		<div class="main_width content_wr">
	      
     		<div class="tags_block_content">
     			<a href="#">Статьи по теме налговой отчётности</a>
     			<a href="#">Восстановление налогового и бухучёта</a>
     			<a href="#">Бухотчётность, основные формы</a>
     			<a href="#">Анализ и ацдит бухотчётности</a>
     			<a href="#">Налоговая отчётность по упрощёнке</a>
     			<a href="#">Поставнока налогового и бухучёта</a>
     		</div>

        	<xsl:variable name="news" select="document(concat('udata://news/lastlist/', $pageId, '/?extProps=anons,tags,name'))/udata"/>

            <section>
                <xsl:apply-templates select="$news/items/item" />
            </section>
        </div>

	</xsl:template>



</xsl:stylesheet>