<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet	version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <!-- жилой объект -->
    <xsl:template match="result[@module = 'catalog'][@method = 'object']">
        <xsl:value-of select="document(concat('udata://content/addRecentPage/', $pageId))"/>
        <table border="0" cellpadding="0" cellspacing="0" width="782">
    <tbody>
        <tr>
            <td style="padding-top:23px;" valign="top" width="56">

                <img alt="Previous" height="51" onclick="document.location='{document(concat('udata://system/getPrevious/', $pageId))/udata/link}'" onmouseout="this.src='{$template-resources}images/arrow_left_big.png'" onmouseover="this.src='{$template-resources}images/arrow_left_big_over.png'" src="{$template-resources}images/arrow_left_big.png" style="cursor:pointer;margin-right: 20px" width="20"/>

            </td>
            <td valign="top" width="400" height="1000">
     
    <div class="swiper-container gallery-top">
        <div class="swiper-wrapper">
            <xsl:apply-templates select=".//property[@name='photo']/value" mode="photo_l" />

        </div>
        <!-- Add Arrows -->
        <div class="swiper-button-next swiper-button-black"></div>
        <div class="swiper-button-prev swiper-button-black"></div>
    </div>
    <div class="swiper-container gallery-thumbs">
        <div class="swiper-wrapper">

            <xsl:apply-templates select=".//property[@name='photo']/value" mode="photo_m" />

        </div>


    </div>
            </td>
            <td style="padding-top:30px;padding-left: 20px;" valign="top" width="270">
                <div style="padding-bottom:0px; height:30px; color:white; font-size:18px; text-transform:uppercase">
                    <xsl:value-of select="page/name"/>
                </div>
                <div class="list_price" style="margin-bottom:20px; text-align:left">
                    <xsl:apply-templates select="document(concat('udata://emarket/price/', $pageId, '//1'))/udata" />
                </div>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                        <xsl:apply-templates select=".//property[@name='color']" mode="option"/>
                        <xsl:apply-templates select=".//property[@name='size']" mode="option"/>
                        <xsl:apply-templates select=".//property[@name='material']" mode="option"/>
                    </tbody>
                </table>
                <div class="order_form" id="order_form">
                    <form id="basket_{$pageId}" action="/emarket/basket/put/element/{$pageId}/" method="get">
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>
                                    Размер
                                </td>
                                <td>
                                    Цвет
                                </td>
                                
                            </tr>
                            <tr>
                            	<xsl:apply-templates select=".//property[@name='size']" mode="basket-option"/>
                            	<xsl:apply-templates select=".//property[@name='color']" mode="basket-option"/>

                                <td>
                                    <img onclick="document.getElementById('basket_{$pageId}').submit()" onmouseout="this.src='{$template-resources}images/add_to_basket.png'" onmouseover="this.src='{$template-resources}images/add_to_basket_over.png'" src="{$template-resources}images/add_to_basket.png"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                </div>
                <xsl:apply-templates select="document('udata://emarket/cart')/udata" mode="basket_sticker_asdasd" />
            </td> 
            <td style="padding-top:23px" valign="top" width="56">
                <img alt="Next" height="51" onclick="document.location='{document(concat('udata://system/getNext/', $pageId))/udata/link}'" onmouseout="this.src='{$template-resources}images/arrow_right_big.png'" onmouseover="this.src='{$template-resources}images/arrow_right_big_over.png'" src="{$template-resources}images/arrow_right_big.png" style="cursor:pointer;" width="20"/>
            </td>
        </tr>
    </tbody>
</table>
    </xsl:template>

<xsl:template match="property" mode="option">
	<tr>
	    <td>
	        <xsl:value-of select="title"/>:
	    </td>
	    <td>
	    	<xsl:choose>
	    		<xsl:when test="@type = 'string'">
			        <xsl:value-of select="value"/>
	    		</xsl:when>
	    		<xsl:when test="@type = 'optioned'">
	    			<xsl:apply-templates select="value/option/object" mode="option-object"/>
	    		</xsl:when>
	    	</xsl:choose>
	    </td>
	</tr>
</xsl:template>

<xsl:template match="object" mode="option-object">
	<xsl:value-of select="@name"/>
	<xsl:choose>
		<xsl:when test="position() != last()">,&nbsp;</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template match="property" mode="basket-option">
	<td>
        <select id="{@name}" name="options[{@name}]">
			<xsl:apply-templates select="value/option/object" mode="basket-option-item"/>
        </select>
    </td>
</xsl:template>

<xsl:template match="object" mode="basket-option-item">
    <option value="{@id}">
        <xsl:value-of select="@name"/>
    </option>
</xsl:template>

    <xsl:template match="value" mode="photo">
        <script type="text/javascript">
                            images[<xsl:value-of select="@id" />] = new Image();
                    images[<xsl:value-of select="@id" />].src="{.}";
                    images[<xsl:value-of select="@id" />].h = 600;
                    maxImageHeight = Math.max(maxImageHeight, 600);
                        </script>

    </xsl:template>

    <xsl:template match="value" mode="photo_m">
        <div class="swiper-slide" style="background-image:url({document(concat('udata://system/makeThumbnailFull/(',@path,')/100/auto/notemplate/0/1'))//src})"></div>
    </xsl:template>

    <xsl:template match="value" mode="photo_l">
        <div class="swiper-slide" style="background-image:url({document(concat('udata://system/makeThumbnailFull/(',@path,')/400/auto/notemplate/0/1'))//src})"></div>
    </xsl:template>

</xsl:stylesheet>