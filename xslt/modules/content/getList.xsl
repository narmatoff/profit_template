<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <!--_______________________________________________________Main page review getList________________________________________________________-->

    <xsl:template match="udata[@module = 'content'][@method = 'getList']" mode="main-review" >

		<xsl:apply-templates select="items" mode="main-review_items"/>
		
    </xsl:template>
	
	<xsl:template match="items" mode="main-review_items">
		<div class="full_width onepageslider">
      <div class="big_heading">отзывы наших клиентов</div>
      <div class="swiper-container call_backs">
        <div class="swiper-wrapper">
	      	<xsl:apply-templates select="item" mode="main-review_items_item"/>
        </div>
      </div>
      <div class="slider-button-next call_backs_arrow__next arrow__next"></div>
      <div class="slider-button-prev call_backs_arrow__prev arrow__prev"></div>
    </div>        
	</xsl:template>

	<xsl:template match="item" mode="main-review_items_item">

		<xsl:variable name="pwd">
			<xsl:choose>
				<xsl:when test=".//property[@name='fotografiya']/value/@path">
					<xsl:value-of select=".//property[@name='fotografiya']/value/@path"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>{$template-resources}dist/img/callbacker.jpg</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div class="swiper-slide call_backs_item">
            <div class="callbacker_img">
            	<xsl:call-template name="makeThumbnail">
            		<xsl:with-param name="alt" select="name"/>
            		<xsl:with-param name="pwd" select="$pwd"/>
            		<xsl:with-param name="element_id" select="@id"/>
            		<xsl:with-param name="width" select="'68'"/>
            		<xsl:with-param name="height" select="'68'"/>
            	</xsl:call-template>
            </div>
            <div class="callbacker_name"><xsl:value-of select="name"/></div>
            <div class="callbacker_date"><xsl:value-of select="document(concat('udata://content/convertDate/', .//property[@name='publish_time']/value/@unix-timestamp))/udata" disable-output-escaping="yes"/></div>
            <div class="callbacker_text"><xsl:value-of select=".//property[@name='tekst_otzyva']/value" disable-output-escaping="yes" /></div>
          </div>
        
	</xsl:template>


	<!--_______________________________________________________Uslugi page review getList________________________________________________________-->

    <xsl:template match="udata[@module = 'content'][@method = 'getList']" mode="uslugi-review" >
		<xsl:if test="total > 0">
			<xsl:apply-templates select="items" mode="uslugi-review_items"/>
		</xsl:if>
    </xsl:template>
	
	<xsl:template match="items" mode="uslugi-review_items">
			<div class="full_width onepageslider">
	      <div class="big_heading">мы помогли</div>
	      <div class="swiper-container call_backs">
	        <div class="swiper-wrapper">
		      	<xsl:apply-templates select="item" mode="main-review_items_item"/>
	        </div>
	      </div>
	      <div class="slider-button-next call_backs_arrow__next arrow__next"></div>
	      <div class="slider-button-prev call_backs_arrow__prev arrow__prev"></div>
	    </div>        
	</xsl:template>

    <!--_______________________________________________________Main page review team________________________________________________________-->

    <xsl:template match="udata[@module = 'content'][@method = 'getList']" mode="main-team" >
    	<div class="full_width full_width__grey our_team">
	      <div class="big_heading">наша команда</div>

			<xsl:apply-templates select="items" mode="main-team_items"/>

	      <a href="{document(concat('upage://', &aboutId;))/udata/page/@link}" class="button button__yellow button__centered about_button">Узнать о нас больше</a>
	    </div>
    </xsl:template>

    <xsl:template match="items" mode="main-team_items">
	    <div class="team_list">
	    	<xsl:apply-templates select="item" mode="main-team_items_item"/>
	    </div>
    </xsl:template>

    <xsl:template match="item" mode="main-team_items_item">
    	<div class="team_list_item">
    		<xsl:call-template name="makeThumbnail">
        		<xsl:with-param name="alt" select="name"/>
        		<xsl:with-param name="pwd" select=".//property[@name='fotografiya']/value/@path"/>
        		<xsl:with-param name="element_id" select="@id"/>
        		<xsl:with-param name="width" select="'211'"/>
        		<xsl:with-param name="height" select="'226'"/>
        		<xsl:with-param name="class" select="'team_list_item_img'"/>
        	</xsl:call-template>
          <div class="team_list_item_info">
            <div class="team_list_item_info_name">
            	<xsl:value-of select=".//property[@name='fio']/value" disable-output-escaping="yes" />
            </div>
            <div class="team_list_item_info_status">
            	<xsl:value-of select=".//property[@name='dolzhnost']/value/item/@name" disable-output-escaping="yes" />
            </div>
            <div class="team_list_item_info_text">
            	<xsl:value-of select=".//property[@name='opisanie']/value" disable-output-escaping="yes" />
            </div>
            <a href="tel:{.//property[@name='telefon']/value}" class="team_list_item_info_phone"><xsl:value-of select=".//property[@name='telefon']/value" /></a>
            <a href="mailto:{.//property[@name='email']/value}" class="team_list_item_info_email"><xsl:value-of select=".//property[@name='email']/value" /></a>
          </div>
        </div>
    </xsl:template>

	<!--_______________________________________________________About page review getList________________________________________________________-->

    <xsl:template match="udata[@module = 'content'][@method = 'getList']" mode="about-review" >
		
		<xsl:apply-templates select="items" mode="about-review_items"/>
		
    </xsl:template>
	
	<xsl:template match="items" mode="about-review_items">
	
	<div class="testimonials_sliderwr">
        <div class="pensils"></div>
        <div class="sunglasses"></div>
        <div class="coffeecup"></div>
        <div class="notebook"></div>
        <div class="testimonials-container swiper-container">
          <div class="swiper-wrapper">
	      	<xsl:apply-templates select="item" mode="about-review_items_item"/>
          </div>
          <div class="slider2-button-next testimonials_arrow__next arrow__next"></div>
          <div class="slider2-button-prev testimonials_arrow__prev arrow__prev"></div>
        </div>
      </div>
	</xsl:template>

	<xsl:template match="item" mode="about-review_items_item">
	
		<xsl:variable name="pwd">
			<xsl:choose>
				<xsl:when test=".//property[@name='fotografiya']/value/@path">
					<xsl:value-of select=".//property[@name='fotografiya']/value/@path"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>{$template-resources}dist/img/callbacker.jpg</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div class="swiper-slide testimonials_item">
		    <div class="testimonials_item_photo">
				<xsl:call-template name="makeThumbnail">
            		<xsl:with-param name="alt" select="name"/>
            		<xsl:with-param name="pwd" select="$pwd"/>
            		<xsl:with-param name="element_id" select="@id"/>
            		<xsl:with-param name="width" select="'128'"/>
            		<xsl:with-param name="height" select="'129'"/>
            	</xsl:call-template>
		    </div>
		    <div class="testimonials_item_name">
		        <xsl:value-of select="name"/>
		    </div>
		    <div class="testimonials_item_info">
		        <xsl:value-of select=".//property[@name='kratkaya_informaciya_o_sebe']/value" disable-output-escaping="yes" />
		    </div>
		    <div class="testimonials_item_about">
		        <xsl:value-of select=".//property[@name='tekst_otzyva']/value" disable-output-escaping="yes" />
		    </div>
		    <div class="testimonials_item_strategy">
		        <div class="testimonials_item_strategy_cel">
		            <img alt="" class="testims_img" src="{$template-resources}dist/img/svg/pricel.svg"/>
		            <div class="testims_name">
		                Цель работы
		            </div>
		            <div class="testims_info">
		               	<xsl:value-of select=".//property[@name='cel_raboty']/value" disable-output-escaping="yes" />
		            </div>
		        </div>
		        <div class="testimonials_item_strategy_str">
		            <img alt="" class="testims_img" src="{$template-resources}dist/img/svg/strategy.svg"/>
		            <div class="testims_name">
		                Стратегия
		            </div>
		            <div class="testims_info">
		                <xsl:value-of select=".//property[@name='strategiya']/value" disable-output-escaping="yes" />
		            </div>
		        </div>
		        <div class="testimonials_item_strategy_result">
		            <img alt="" class="testims_img" src="{$template-resources}dist/img/svg/result.svg"/>
		            <div class="testims_name">
		                Результат
		            </div>
		            <div class="testims_info">
		                <xsl:value-of select=".//property[@name='rezultat']/value" disable-output-escaping="yes" />
		            </div>
		        </div>
		    </div>
		    <div class="testimonials_item_about">
		    	<xsl:if test=".//property[@name='fajl_s_otzyvom']/value">
					<a href="{.//property[@name='fajl_s_otzyvom']/value}" target="_blank">читать благодарственное письмо</a>
		    	</xsl:if>
		    </div>
		</div>

        
	</xsl:template>

</xsl:stylesheet>
