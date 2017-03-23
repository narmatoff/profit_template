<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM    "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:umi="http://www.umi-cms.ru/TR/umi"
                exclude-result-prefixes="xsl date udt umi">

<!-- родительская категория -->
    <xsl:template match="result[@module = 'faq'][@method = 'project'] | result[@module = 'faq'][@method = 'category']">
		
		<xsl:variable name="parPage">
			<xsl:choose>
    			<xsl:when test="@method = 'project'">
    				<xsl:value-of select="$pageId"/>
    			</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="parents/page/@id"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="parLink">
			<xsl:choose>
    			<xsl:when test="@method = 'project'">
    				<xsl:value-of select="parents/page[2]/@link"/>
    			</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="pageLink"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="parId">
			<xsl:choose>
    			<xsl:when test="@method = 'project'">
    				<xsl:text></xsl:text>
    			</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$pageId"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="faqCategoryAll" select="document(concat('udata://faq/categoryAll//', $parId ,'//'))/udata"/>

        
        <div class="full_width full_width__white">
      		<div class="main_width content_wr">
	        		<div class="tags_block_content">
						<xsl:apply-templates select="document(concat('udata://faq/project//', $parPage, '/100/1'))" mode="tags_block_faq"/>
			        </div>

		        <xsl:apply-templates select="$faqCategoryAll"/>
		        
		        <!-- кнопка прокрутки + пагинация -->
		        <xsl:call-template name="numpages">
    		        <xsl:with-param name="requesurl" select="concat('/udata://faq/categoryAll//', $parId ,'//')" />
    		        <xsl:with-param name="template" select="'modules/faq/categoryAll.xsl'" />

    		        <xsl:with-param name="total" select="$faqCategoryAll/total" />
            		<xsl:with-param name="limit" select="$faqCategoryAll/per_page" />
        		</xsl:call-template>
			
			</div>
			



		</div>

      	<xsl:if test="$isAjax = 'no'">
		
			<xsl:call-template name="addQuestionForm">
				<xsl:with-param name="pageCat" select="$parPage"/>
				<xsl:with-param name="parentsLink" select="parLink"/>
			</xsl:call-template>

		</xsl:if>
    </xsl:template>





	<xsl:template match="udata[@module = 'faq'][@method = 'project']" mode="tags_block_faq">
		<xsl:param name="parentsLink" />
		<xsl:apply-templates select="lines/item" mode="faq_project_item">
			<xsl:with-param name="parentsLink" select="$parentsLink"/>
		</xsl:apply-templates>
	</xsl:template>

    <xsl:template match="lines/item" mode="faq_project_item">
		<xsl:param name="parentsLink" />

    	<a href="{@link}">
    		<xsl:attribute name="class">
    			<xsl:choose>
    				<xsl:when test="@link = $pageLink">
						<xsl:text>selected</xsl:text>
    				</xsl:when>
    				<xsl:when test="@link = $parentsLink">
						<xsl:text>selected</xsl:text>
    				</xsl:when>
    			</xsl:choose>
    		</xsl:attribute>
    		<xsl:value-of select="@name"/>
    	</a>
    </xsl:template>
	
	<xsl:template name="addQuestionForm">
    	<xsl:param name="pageCat" />
    	<xsl:param name="parentsLink" />

	    <div class="full_width full_width__lightgrey our_certs">
	    	<div class="big_heading big_heading_black">&add_question;</div>
				<form action="/faq/post_question" method="post" class="form_faq">
			        <input type="text" placeholder="Ваше имя" class="questions_input" name="nick" required="required"/>
			        <input type="text" placeholder="Тема вопроса" class="questions_input" name="title" required="required"/>
					<textarea name="question" class="questions_input" placeholder="Ваш вопрос" required="required"></textarea>
			        <select name="cat" class="questions_input" required="required" id="faq_cat_id">
			        	<option selected="selected" disabled="disabled">
			        		<xsl:text disable-output-escaping="yes">&select_question_cat;</xsl:text>
			        	</option>
			        	<xsl:apply-templates select="document(concat('udata://faq/project//', $pageCat, '/100/1'))" mode="faq_cat_option">
			        		<xsl:with-param name="parentsLink" select="$parentsLink"/>
			        	</xsl:apply-templates>
					</select>
			        <input type="submit" value="Задать вопрос" class="button button__yellow button__centered questions_button"/>

			    </form>
    	</div>
    </xsl:template>

    <xsl:template match="udata[@module = 'faq'][@method = 'project']" mode="faq_cat_option">
    	<xsl:param name="parentsLink" />
		<xsl:apply-templates select="lines/item" mode="faq_cat_option_item">
			<xsl:with-param name="parentsLink" select="$parentsLink"/>
		</xsl:apply-templates>
    </xsl:template>

    <xsl:template match="item" mode="faq_cat_option_item">
    	<xsl:param name="parentsLink" />
		<option value="{@id}">
			<xsl:choose>
				<xsl:when test="@link = $parentsLink">
					<xsl:attribute name="selected">
						<xsl:text>selected</xsl:text>
					</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<xsl:value-of select="@name"/>
		</option>
    </xsl:template>
    

</xsl:stylesheet>