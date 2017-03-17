<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="total" />

	<xsl:template match="total[. &gt; ../per_page]">
		<xsl:apply-templates select="document(concat('udata://system/numpages/', ., '/', ../per_page))/udata" />
	</xsl:template>

	<xsl:template match="udata[@module = 'system'][@method = 'numpages']">
        <nav class="nav-table clearfix">
            <ul class="clearfix_paging">
                <xsl:apply-templates select="tobegin_link[../items/item[1] &gt; 1]" />
                <xsl:apply-templates select="items/item" mode="numpages" />
                <xsl:apply-templates select="toend_link[@page-num &gt; ../items/item[last()]/@page-num]" />&nbsp;&nbsp;|&nbsp;&nbsp;
                <xsl:apply-templates select="toprev_link" mode="num-news" />
                <xsl:apply-templates select="tonext_link" mode="num-news" />
            </ul>
        </nav>
	</xsl:template>

	<xsl:template match="toprev_link">
        <li>
            <a href="{.}"><img src="{$template-resources}images/left-arrow.png" alt="begin-table" class="begin-table"/></a>
        </li>
	</xsl:template>

	<xsl:template match="tobegin_link">
		<li><a href="{.}"><xsl:text>1</xsl:text></a></li>
	</xsl:template>

	<xsl:template match="tobegin_link[../items/item[1] != 2]">
		<li><a href="{.}"><xsl:text>1</xsl:text></a><xsl:text>&#8230;</xsl:text></li>
	</xsl:template>

	<xsl:template match="item" mode="numpages">
		<li><a href="{@link}"><xsl:value-of select="." /></a></li>
	</xsl:template>

	<xsl:template match="item[@is-active = '1']" mode="numpages">
        <li class="active">
		    <a href="{@link}"><xsl:value-of select="." /></a>
        </li>
	</xsl:template>

	<xsl:template match="toend_link">
        <li>
		    <a href="{.}"><xsl:value-of select="@page-num + 1" /></a>
        </li>
	</xsl:template>

	<xsl:template match="toend_link[@page-num &gt; ../items/item[last()]]">
        <li>
		    <xsl:text>&#8230;</xsl:text><a href="{.}"><xsl:value-of select="@page-num + 1" /></a>
        </li>
	</xsl:template>

	<xsl:template match="tonext_link">
        <li>
            <a href="{.}"><img src="{$template-resources}images/right-arrow.png" alt="end-table" class="end-table"/></a>
        </li>
	</xsl:template>


	<xsl:template name="numpages">
        <xsl:param name="limit" />
        <xsl:param name="total" />
        <xsl:if test="$total > $limit">
            <xsl:apply-templates select="document(concat('udata://system/numpages/', $total, '/', $limit))/udata" mode="news-pager" /></xsl:if>
    </xsl:template>
    <xsl:template match="udata[@module = 'system' and @method = 'numpages']" mode="news-pager">
       <div class="catalog_pages" style="margin-top:30px;margin-bottom:-50px;padding-bottom:20px;float:right;">
            Страница
            <xsl:value-of select="items/item[@is-active='1']" />
            из
            <xsl:choose>
                <xsl:when test="toend_link">
                    <xsl:value-of select="toend_link/@page-num + 1" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="items/item[@is-active='1']" />
                </xsl:otherwise>
            </xsl:choose>
            <a href="#" style="margin-left:25px;">Показать все</a>
            <xsl:apply-templates select="toprev_link" mode="num-good" />
            <xsl:apply-templates select="tonext_link" mode="num-good" />
        </div>
       <!--  <div class="breadcrumbs2_wrapper">
            <ul class="breadcrumbs2">
                <xsl:apply-templates select="toprev_link" mode="num-news" />
                <xsl:apply-templates select="items/item" mode="num-news" />
                <xsl:apply-templates select="tonext_link" mode="num-news" />
            </ul>
        </div> -->
    </xsl:template>
    <xsl:template match="item[@is-active='1']" mode="num-news">
        <li><span><xsl:value-of select="." disable-output-escaping="no" /></span>
        </li>
    </xsl:template>
    <xsl:template match="item" mode="num-news">
        <li>
            <a href="{@link}">
                <xsl:value-of select="." disable-output-escaping="no" />
            </a>
        </li>
    </xsl:template>
    <xsl:template match="tonext_link" mode="num-good">
        <img style="margin-left:25px;" align="absmiddle" src="{$template-resources}/images/arrow_right.png" alt="Next" onmouseover="this.src='{$template-resources}/images/arrow_right_over.png'" onmouseout="this.src='{$template-resources}/images/arrow_right.png'" onclick="document.location='{.}'"/>
    </xsl:template>
    <xsl:template match="toprev_link" mode="num-good">
        <img style="margin-left:25px;" align="absmiddle" src="{$template-resources}/images/arrow_left.png" alt="Previous" hspace="10" onmouseover="this.src='{$template-resources}/images/arrow_left_over.png'" onmouseout="this.src='{$template-resources}/images/arrow_left.png'" onclick="document.location='{.}'"/>
    </xsl:template>
    <xsl:template match="tonext_link" mode="num-news">
        <a href="{.}">Следующая&nbsp;<img src="{$template-resources}/images/arrow1.gif" alt="" width="5" height="5" align="absmiddle" style="margin-bottom:1px"/></a>
    </xsl:template>
    <xsl:template match="toprev_link" mode="num-news">
        <a href="{.}"><img src="{$template-resources}/images/arrow2.gif" alt="" width="5" height="5" align="absmiddle" style="margin-bottom:1px"/>&nbsp;Предыдущая</a>&nbsp;&nbsp;
    </xsl:template>

</xsl:stylesheet>