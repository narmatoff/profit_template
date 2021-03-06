<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <!--_______________________________________________________Main page________________________________________________________-->

    <xsl:template match="result[@module = 'content'][@method = 'content'][page/@is-default='1']" priority="1">

        <section class="">
            <div umi:element-id="{$pageId}" umi:field-name="content">
                <xsl:value-of select=".//property[@name='content']/value" disable-output-escaping="yes"/>
            </div>
        </section>
    </xsl:template>

    <xsl:template match="result[@module = 'content'][@method = 'content'][page/@id='&aboutId;']" priority="1">
    	<div>
		<section>
        <article umi:element-id="{$pageId}" umi:field-name="content">
            <xsl:value-of select=".//property[@name='content']/value" disable-output-escaping="yes"/>
        </article>
      </section>
    </div>
    
    <div class="testimonials_block" id="clients">
      <div class="big_heading big_heading_white">Наши клиенты</div>
      <xsl:apply-templates select="document('udata://content/getList//19/1/10/1/name/rand?extGroups=dannye_o_otzyve')" mode="about-review" />
    </div>

    <div class="full_width full_width__grey our_team">
      <div class="big_heading">наша команда</div>
		<xsl:apply-templates select="document('udata://content/getList//20/1/500/1?extGroups=informaciya_o_specialiste')/udata/items" mode="main-team_items"/>
      <!-- <a href="" class="button button__yellow button__centered about_button">Узнать о нас больше</a> -->
    </div>
    <div class="full_width full_width__white our_partners">
		<div class="big_heading big_heading_black">Сертификаты</div>
		<div class="cert_list magnific_gallery">
			<xsl:apply-templates select=".//property[@name='sertifikaty']/value" mode="about-sertifikaty"/>
		</div>
    </div>
            
    </xsl:template>
	
	<xsl:template match="value" mode="about-sertifikaty">
	    <a class="cert_list_item a_img_hoverer" href="{.}">
        	<xsl:call-template name="makeThumbnail">
        		<xsl:with-param name="alt" select="@alt"/>
        		<xsl:with-param name="pwd" select="@path"/>
        		<xsl:with-param name="element_id" select="@id"/>
        		<!-- <xsl:with-param name="width" select="'211'"/> -->
        		<xsl:with-param name="height" select="'334'"/>
        	</xsl:call-template>
	    </a>
	</xsl:template>

    <!--_______________________________________________________Страница отзывов________________________________________________________-->
    <xsl:template match="result[@module = 'content'][@method = 'content'][page/@id='&reviewsId;']" priority="1">
        <div class="wrap">
            <xsl:call-template name="navi"/>

            <section class="reviews clearfix">
                <h1>
                    <xsl:value-of select=".//property[@name='h1']/value"/>
                </h1>

                <div umi:module="content" umi:method="menu" umi:sortable="sortable">
                    <xsl:apply-templates select="document(concat('udata://content/menu///',$pageId))/udata/items/item"
                                         mode="rev-item"/><!--system/system-templates.xsl-->
                </div>
            </section>

        </div>
    </xsl:template>

    <!--_______________________________________________________Contacts page________________________________________________________-->

    <xsl:template match="result[@module = 'content'][@method = 'content']">
        <div class="">
            <section class="content">
                <div umi:element-id="{$pageId}" umi:field-name="content">
                    <xsl:value-of select=".//property[@name='content']/value" disable-output-escaping="yes"/>
                </div>
            </section>
        </div>
    </xsl:template>


</xsl:stylesheet>