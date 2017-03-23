<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:output encoding="utf-8" method="html" indent="yes"/>

    <xsl:param name="template-name"/>
    <xsl:param name="template-resources"/>

    <xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$isAjax = 'yes'">
				<xsl:apply-templates select="result"/>	
			</xsl:when>
			<xsl:otherwise>
				
			
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html/&gt;</xsl:text>
        <html lang="ru">

			<head>
                <xsl:call-template name="head"/>
            </head>

            <body>
				<header class="main_header">
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="$isDefault = 1">
								<xsl:text>main_header</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>notmain_header_two</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:if test="$isDefault">
						<video autoplay="autoplay" muted="muted" loop="loop" poster="{.//property[@name='izobrazhenie']/value}" class="main_header_video">	<source src="{.//property[@name='video']/value}" type="video/{.//property[@name='video']/value/@ext}"/>
						</video>
					</xsl:if>
				    <div class="top_nav_wr">
				        <div class="top_nav">
				            <div class="top_nav__address">
				                <span umi:element-id="{$siteInfoPageId}" umi:field-name="gorod">
				                    <xsl:value-of select="$siteInfoPage//property[@name='gorod']/value"/>
				                </span>
				                <span umi:element-id="{$siteInfoPageId}" umi:field-name="adres">
				                    <xsl:value-of select="$siteInfoPage//property[@name='adres']/value"/>
				                </span>
				                <a href="#map" class="anchor">
				                    &show_map;
				                </a>
				            </div>

				            <!-- верхнее меню -->
				            <xsl:apply-templates select="document('udata://menu/draw/top')/udata" mode="menu-top"/>
				        </div>
				    </div>
				    <div class="middle_nav">
				    	<xsl:if test="$isDefault = 1">
					        <div class="middle_nav__name">
					        	<!-- TODO: Засунуть в шаблон -->
					        	<img src="{$template-resources}dist/img/svg/profit_sova.svg" alt="Логотип"/>


				           		
					        </div>
				    	</xsl:if>

				        <h1 class="middle_nav__slogan" umi:element-id="{$pageId}" umi:field-name="h1">
				            <xsl:value-of select=".//property[@name='h1']/value"/>
				        </h1>

				        <xsl:if test="$pageId = &aboutId;">
							<a href="#showmenuhere" class="button anchor">&about_company;</a>
			    		    <a href="#clients" class="button anchor">&our_client;</a>
			    		    <a href="#team" class="button anchor">&staff;</a>
			    		    <a href="#sert" class="button anchor">&certificate;</a>
			    		</xsl:if>
				    	
				    	<xsl:if test="$isDefault = 1">
					        <a class="button button__yellow anchor" href="#questions" >
					            &get_consult;
					        </a>
				    	</xsl:if>
				    </div>

		            <xsl:if test="$pageId != &aboutId;">
					    <div class="arrow_bottom arrow_bottom__header">
					    </div>
					</xsl:if>
				</header>
				<!-- проблема главной -->
				<xsl:apply-templates select="$errors"/>
			    
			    <div class="full_width full_width__white">
					<xsl:choose>
						<xsl:when test="$isDefault = 1">
							<xsl:call-template name="main"/>	
						</xsl:when>
						<xsl:otherwise>
						    <div id="showmenuhere" class="main_width content_wr">
								<xsl:call-template name="navi"/>
							</div>
								<xsl:apply-templates select="result"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<div  id="questions">
					<xsl:attribute name="class">
						<xsl:text>full_width full_width_</xsl:text>
						<xsl:choose>
							<xsl:when test="$isDefault = 1">
								<xsl:text>_white</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>_darker</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text> questions</xsl:text>
					</xsl:attribute>
			      <div>
			      	<xsl:attribute name="class">
			      		<xsl:text>big_heading</xsl:text>
			      		<xsl:if test="not($isDefault)">
			      			<xsl:text> big_heading_white</xsl:text>
			      		</xsl:if>
			      	</xsl:attribute>
			      		&have_question;
			      </div>
			      <div class="questions_text">
			      	<xsl:attribute name="class">
			      		<xsl:text>questions_text</xsl:text>
			      		<xsl:if test="not($isDefault)">
			      			<xsl:text> questions_text_white</xsl:text>
			      		</xsl:if>
			      	</xsl:attribute>
			      	&long_text_main;
			      </div>

			      <xsl:apply-templates select="document('udata://webforms/add/129')/udata" mode="q-webforms"/>

			
			    </div>

			    <xsl:if test="$pageId != &contactsId;">
			    	
			    <div class="full_width full_width__white main_contacts">
			      <div class="main_contacts_map" id="map">
			      </div>
			      <div class="main_contacts_info">
			        <div class="main_contacts_info_block">
			          <div class="big_heading big_heading_white contacts_list_heading">&contat;</div>
			          <div class="contacts_list">
			            <div class="contacts_list_adr"><span umi:element-id="{$siteInfoPageId}" umi:field-name="gorod"><xsl:value-of select="$siteInfoPage//property[@name='gorod']/value"/></span>, <span umi:element-id="{$siteInfoPageId}" umi:field-name="adres"><xsl:value-of select="$siteInfoPage//property[@name='adres']/value"/></span></div>
			            <div class="contacts_list_phone">&phone;: <span umi:element-id="{$siteInfoPageId}" umi:field-name="telefon"><xsl:value-of select="$siteInfoPage//property[@name='telefon']/value"/></span></div>
			            <div class="contacts_list_email">&email;: <span umi:element-id="{$siteInfoPageId}" umi:field-name="email"><xsl:value-of select="$siteInfoPage//property[@name='email']/value"/></span></div>
			            <div class="contacts_list_time">&work-time;:<br/><span umi:element-id="{$siteInfoPageId}" umi:field-name="rezhim_raboty"><xsl:value-of select="$siteInfoPage//property[@name='rezhim_raboty']/value" disable-output-escaping="yes"/></span></div>
			          </div>
			        </div>
			      </div>
			    </div>
			    </xsl:if>
			    <footer class="full_width">
			      <div class="footer_content">
			        <div class="footer_content_cprt" umi:element-id="{$siteInfoPageId}" umi:field-name="slogan_v_podvale"><xsl:value-of select="$siteInfoPage//property[@name='slogan_v_podvale']/value"/></div>
			        <div id="totop" class="return_totop"></div>
			      </div>
			    </footer>
			    <div class="loading_resources"></div>
			    <script src="{$template-resources}dist/components/jquery/dist/jquery.js"></script>
			    <script src="{$template-resources}dist/components/swiper/dist/js/swiper.js"></script>
			    <script src="{$template-resources}dist/components/waypoints/lib/noframework.waypoints.js"></script>
			    <script src="{$template-resources}dist/components/skrollr/src/skrollr.js"></script>
			    <script src="{$template-resources}dist/components/jquery.easing/js/jquery.easing.js"></script>
			    <script src="{$template-resources}dist/components/magnific-popup/dist/jquery.magnific-popup.js"></script>
			    <script src="{$template-resources}dist/components/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
			    <script src="//cdnjs.cloudflare.com/ajax/libs/packery/2.1.1/packery.pkgd.min.js"></script>
			    <script src="{$template-resources}dist/js/all.min.js"></script>

			    <div class="callback_block callback_block_positioned">
			      <div class="callback_block_trigger"></div>
			      <xsl:apply-templates select="document('udata://webforms/add/121')/udata" mode="recall-webforms"/>
			    </div>
				<script async="async" defer="defer" src="https://maps.googleapis.com/maps/api/js?v=3&amp;key=AIzaSyA0_o-_q0LpshBxPq-YAFdmz6COmzdqbw0&amp;callback=initMap" />
			    <script src="{$template-resources}js/maps.js"></script>

				<!-- <xsl:value-of select="document('udata://content/customIncludeQuickEditJs')/udata" disable-output-escaping="yes"/> -->


            </body>
        </html>
        </xsl:otherwise>
		</xsl:choose>
    </xsl:template>

    <xsl:include href="__common.xsl"/>
    <xsl:include href="../__common.xsl"/>

</xsl:stylesheet>

