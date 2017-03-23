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
            <a href="{.}">&lt;</a>
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
            <a href="{.}">&gt;</a>
        </li>
	</xsl:template>


	<xsl:template name="numpages">
        <xsl:param name="requesurl" />
        <xsl:param name="template" />

        <xsl:param name="limit" />
        <xsl:param name="total" />

		<xsl:if test="$total > ($p + 1) * $limit">
			<input type="button" value="&show_more;" class="button button__yellow button__centered questions_button show_more">
				<xsl:attribute name="data-requesurl">
					<xsl:value-of select="$requesurl"/>
				</xsl:attribute>
				<xsl:attribute name="data-page">
					<xsl:value-of select="$p"/>
				</xsl:attribute>
				<xsl:attribute name="data-total">
					<xsl:value-of select="$total"/>
				</xsl:attribute>
				<xsl:attribute name="data-perpage">
					<xsl:value-of select="$limit"/>
				</xsl:attribute>
				<xsl:attribute name="data-template">
					<xsl:value-of select="$template"/>
				</xsl:attribute>
			</input>

		</xsl:if>

        <xsl:if test="$total > $limit">
            <xsl:apply-templates select="document(concat('udata://system/numpages/', $total, '/', $limit))/udata" mode="paging.numbers" /></xsl:if>
    </xsl:template>


	<xsl:template match="udata[not(tobegin_link) and toend_link]" mode="paging.words">
	    <div class="paging-words">
	      <a>«&nbsp;В начало</a>
	      &nbsp;    
	      <a>«&nbsp;Предыдущая</a>    
	      &nbsp;&nbsp;|&nbsp;&nbsp;
	      <a class="active" href="{tonext_link}">Следующая&nbsp;»</a>
	      &nbsp;
	      <a class="active" href="{toend_link}">В&nbsp;конец&nbsp;»</a>
	    </div>
	</xsl:template>

	<xsl:template match="udata[tobegin_link and toend_link]" mode="paging.words">
	    <div class="paging-words">
	      <a class="active" href="{tobegin_link}">«&nbsp;В начало</a>
	      &nbsp;
	      <a class="active" href="{toprev_link}">«&nbsp;Предыдущая</a>
	      &nbsp;&nbsp;|&nbsp;&nbsp;
	      <a class="active" href="{tonext_link}">Следующая&nbsp;»</a>
	      &nbsp;
	      <a class="active" href="{toend_link}">В&nbsp;конец&nbsp;»</a>
	    </div>
	</xsl:template>
	 
	<xsl:template match="udata[tobegin_link and not(toend_link)]" mode="paging.words">
	    <div class="paging-words">
	      <a class="active" href="{tobegin_link}">«&nbsp;В начало</a>
	      &nbsp;
	      <a class="active" href="{toprev_link}">«&nbsp;Предыдущая</a>
	      &nbsp;&nbsp;|&nbsp;&nbsp;
	      <a>Следующая&nbsp;»</a>
	      &nbsp;
	      <a>В&nbsp;конец&nbsp;»</a>
	    </div>
	</xsl:template>



	<xsl:template match="udata[items]" mode="paging.numbers">  
	    <div class="paging-numbers" hidden="true">
	    
	      <table align="center">
	        <tbody>
	          <tr><td>
	            
	            <span>Страницы:</span>
	            <xsl:apply-templates select="items" mode="paging.numbers" />
	            
	          </td></tr>
	        </tbody>
	      </table>
	    
	    </div>
	</xsl:template>
	  
	<xsl:template match="item" mode="paging.numbers">
	    <a class="active" href="{@link}">
	       <xsl:value-of select="." />   
	    </a>
	</xsl:template>
	  
	<xsl:template match="item[@is-active = '1']" mode="paging.numbers">
	    <a>
	       <xsl:value-of select="." />   
	    </a>
	</xsl:template>


</xsl:stylesheet>