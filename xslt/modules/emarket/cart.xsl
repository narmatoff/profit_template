<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM    "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:umi="http://www.umi-cms.ru/TR/umi"
                exclude-result-prefixes="xsl date udt umi">

    












    <xsl:template match="udata[@module = 'emarket' and @method = 'cart']" mode="basket_sticker">

            <xsl:apply-templates select="summary" mode="basket_vse" />


    </xsl:template>

<xsl:template match="summary[amount = 0]" mode="basket_vse">
    </xsl:template>

    <xsl:template match="summary[amount &gt; 0]" mode="basket_vse">

            <a href="/emarket/cart/" style="color:#FFFFFF;font-weight:bold;text-decoration:none">
                <img src="{$template-resources}/images/basket.png" alt="Корзина заказов" width="16" height="16" border="0" style="margin-bottom: -4px"/>
                &nbsp;&nbsp;
                В корзине <span id="basketquantity"><xsl:value-of select="amount" /></span>
            </a>
    </xsl:template>


    <xsl:template match="udata[@module = 'emarket' and @method = 'cart']" mode="basket_sticker_asdasd">

            <xsl:apply-templates select="summary" mode="basket" />


    </xsl:template>

    <xsl:template match="summary[amount = 0]" mode="basket">
    </xsl:template>

    <xsl:template match="summary[amount &gt; 0]" mode="basket">

        <div id="basketcontent">
            <div class="basketcontent_title">Корзина</div>
            <table cellspacing="0" cellpadding="6" class="basketcontent">
                <tbody>
                    <tr>
                        <th>Наименование</th>
                        <th align="left">К-во</th>
                    </tr>
                    <xsl:apply-templates select="document('udata://emarket/cart')/udata/items/item" mode="itemb" />
                </tbody>
            </table>
            <div class="basketcontent_continue"><a href="/emarket/cart/">Продолжить заказ</a></div>
        </div>



    </xsl:template>
    <xsl:template match="result[@module='emarket' and @method='cart']">
        <div class="clearfix"></div>
    <h1>В корзине нет товаров</h1>

    </xsl:template>

    <xsl:template match="result[@module='emarket' and @method='cart'][udata/summary/amount &gt; 0]">
        <h1>Корзина</h1>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td>
                        <style>
                            input.text {
                                width:40px; height:23px;
                                border:1px solid #535353;
                                background-color: #2D2D2D;
                                color:#AAAAAA;
                            }
                        </style>
                        <form action="/emarket/purchasing_one_step" method="post">
                            <table cellspacing="0" cellpadding="6" class="basketcontent" style="width:600px">
                                <tbody>
                                    <tr>
                                        <th>Удалить</th>
                                        <th>Наименование</th>
                                        <th>Размер</th>
                                        <th>Цвет</th>
                                        <th>К-во</th>
                                    </tr>
                                    <xsl:apply-templates select="document('udata://emarket/cart')/udata/items/item" mode="cart_item" />
                                    
                                </tbody>
                            </table>
                            <br clear="all"/>
                            <!-- <img onclick="" src="{$template-resources}/images/apply.png" onmouseover="this.src='{$template-resources}/images/apply_over.png'" onmouseout="this.src='{$template-resources}/images/apply.png'"/>
                            &nbsp;&nbsp;&nbsp;&nbsp; -->
                            <input value="Продолжить" type="submit"/>
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="item" mode="itemb">
        <tr>  
            <td class="bname"><xsl:value-of select="page/name" />, <xsl:apply-templates select="options"  mode="cart.options"/></td>
            <td class="bquantity"><xsl:value-of select="amount" /></td>
        </tr>
    </xsl:template>

    <xsl:template match="options" mode="cart.options">
        <xsl:apply-templates select="option" mode="cart.option"/>
    </xsl:template>

    <xsl:template match="option" mode="cart.option">
        <xsl:choose>
            <xsl:when test="@field-name='size'">
                р. <xsl:value-of select="@name" />,
            </xsl:when>
            <xsl:otherwise>
                &nbsp;цвет: <xsl:value-of select="@name" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
                        
    <xsl:template match="item" mode="cart_item">
        <tr>
            <td class="bdel" align="center">
                <form id="remove_{@id}" action="/emarket/basket/remove/element/{@id}/" method="get">
                    <input type="checkbox" class="remove" name="remove_{@id}"/>
                </form>
            </td>
            <td class="bname"><xsl:value-of select="@name" /></td>
            <xsl:apply-templates select="options"  mode="cart.options.item"/>
            <td class="bquantity">
                <input type="text" class="text" name="{@id}" value="{amount}"/>

            </td>
        </tr>

    </xsl:template>

    <xsl:template match="options" mode="cart.options.item">
        <xsl:apply-templates select="option" mode="cart.option.item"/>
    </xsl:template>

    <xsl:template match="option" mode="cart.option.item">
        <xsl:choose>
            <xsl:when test="@field-name='size'">
                <td class="bcolor"><xsl:value-of select="@name" /></td>
            </xsl:when>
            <xsl:otherwise>
                <td class="bsize"><xsl:value-of select="@name" /></td>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


</xsl:stylesheet>