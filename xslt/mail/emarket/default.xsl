<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output encoding="utf-8" method="html" indent="yes" />

	<xsl:template match="status_notification">
		<xsl:text>Ваш заказ #</xsl:text>
		<xsl:value-of select="order_number" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="status" />
		<br/><br/>
		<xsl:text>Посмотреть историю заказов вы можете в своем </xsl:text>
		<a>
			<xsl:call-template name="personal_link" />
			<xsl:text>личном кабинете</xsl:text>
		</a>.
	</xsl:template>

	<xsl:template match="status_notification_receipt">
		<xsl:text>Ваш заказ #</xsl:text>
		<xsl:value-of select="order_number" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="status" />
		<br/><br/>
		<xsl:text>Посмотреть историю заказов вы можете в своем </xsl:text>
		
		<a>
			<xsl:call-template name="personal_link"/>
			<xsl:text>личном кабинете</xsl:text>
		</a>.
		<br/><br/>
		<xsl:text>Квитанцию на оплату вы можете получить, перейдя по </xsl:text>
		<a href="http://{domain}/emarket/receipt/{order_id}/{receipt_signature}/">
			<xsl:text>этой ссылке</xsl:text>
		</a>.
	</xsl:template>

	<xsl:template match="neworder_notification">
		<xsl:text>Поступил новый заказ #</xsl:text>
		<xsl:value-of select="order_number" />
		<xsl:text> (</xsl:text>
		<a href="http://{domain}/admin/emarket/order_edit/{order_id}/">
			<xsl:text>Просмотр</xsl:text>
		</a>
		<xsl:text>)</xsl:text><br/><br/>
		<xsl:text>Способ оплаты: </xsl:text>
		<xsl:value-of select="payment_type" /><br/>
		<xsl:text>Статус оплаты: </xsl:text>
		<xsl:value-of select="payment_status" /><br/>
		<xsl:text>Сумма оплаты:  </xsl:text>
		<xsl:value-of select="price" /><br/>
	</xsl:template>

	<xsl:template match="neworder_notification_dlr">
		<xsl:variable name="order-info" select="document(concat('udata://emarket/order/', order_id))/udata" />
		<xsl:variable select="document(concat('uobject://',order_id))//property[@name='customer_id']/value/item/@id" name="customer1"/>
			<xsl:text>Заказ №</xsl:text>
			<xsl:value-of select="order_number" />
			<!-- <xsl:text> (</xsl:text>
			<a href="http://{domain}/admin/emarket/order_edit/{order_id}/">
				<xsl:text>Просмотр в системе администрирования</xsl:text>
			</a>
			<xsl:text>)</xsl:text><br/> --><br/>
			<xsl:text>Организация:  </xsl:text>
			<xsl:value-of select="$order-info//property[@name='naimenovanie_organizacii']/value" /><br/>
			<xsl:text>Телефон:  </xsl:text>
			
				<xsl:value-of select="$order-info//property[@name='phone']/value" />
				<br/>
			<xsl:text>Эл. почта:  </xsl:text>
			
			<xsl:value-of select="$order-info//property[@name='e-mail']/value" />
			<br/>
			<xsl:text>Контактное лицо:  </xsl:text>
			<xsl:value-of select="$order-info//property[@name='lname']/value" /><br/>
			
			<br/>
		<xsl:text>Состав заказа</xsl:text><br/>
		<table>
			<tr>
				<td style="border:1px solid #cccccc;padding: 5px;">Артикул</td>
				<td style="border:1px solid #cccccc;padding: 5px;">Название</td>
				<td style="border:1px solid #cccccc;padding: 5px;">Цвет</td>
				<td style="border:1px solid #cccccc;padding: 5px;">Размер</td>
				<td style="border:1px solid #cccccc;padding: 5px;">Количество</td>
				<td style="border:1px solid #cccccc;padding: 5px;">Стоимость</td>
			</tr>
			<xsl:apply-templates select="$order-info/items/item" mode="order_info_del" />
		</table>
		<xsl:text>Итого:</xsl:text>
		<xsl:choose>
			<xsl:when test="$order-info/summary/price/original">
				<xsl:value-of select="$order-info/summary/price/original" /></xsl:when>
			<xsl:otherwise><xsl:value-of select="price" /></xsl:otherwise>
		</xsl:choose><br/>
		<xsl:text>Итого с доставкой:</xsl:text>
		<xsl:value-of select="price" /><br/>
			<xsl:text>Комментарии к заказу:  </xsl:text>
			<xsl:value-of select="$order-info//property[@name='kommentarii_k_zakazu']/value" /><br/>
	</xsl:template>

	<xsl:template match="neworder_notification_user">
		<xsl:variable name="order-info" select="document(concat('udata://emarket/order/', order_id))/udata" />
		<xsl:variable select="document(concat('uobject://',order_id))//property[@name='customer_id']/value/item/@id" name="customer1"/>
			<xsl:text>Заказ №</xsl:text>
			<xsl:value-of select="order_number" />
			<!-- <xsl:text> (</xsl:text>
			<a href="http://{domain}/admin/emarket/order_edit/{order_id}/">
				<xsl:text>Просмотр в системе администрирования</xsl:text>
			</a>
			<xsl:text>)</xsl:text><br/> --><br/>
			<xsl:text>Контактное лицо:  </xsl:text>
			<xsl:value-of select="$order-info//property[@name='lname']/value" /><br/>
			<xsl:text>Телефон:  </xsl:text>
			
				<xsl:value-of select="$order-info//property[@name='phone']/value" />
				<br/>
			<xsl:text>Мобильный телефон:  </xsl:text>
			<xsl:value-of select="$order-info//property[@name='mobilnyj_telefon']/value" /><br/>
			<xsl:text>Эл. почта:  </xsl:text>
			
			<xsl:value-of select="$order-info//property[@name='e-mail']/value" />
			<br/>
			<xsl:text>Адрес доставки:  </xsl:text>
			
					<xsl:value-of select="$order-info//property[@name='adres']/value" />
				<br/>
			<xsl:text>Комментарии к заказу:  </xsl:text>
			<xsl:value-of select="$order-info//property[@name='kommentarii_k_zakazu']/value" /><br/>
			<xsl:text>Способ доставки:  </xsl:text>
			<xsl:value-of select="$order-info/delivery/method/@name" /><br/>
			<xsl:text>Cтоимость доставки:  </xsl:text>
			<xsl:value-of select="$order-info/delivery/price/delivery" /> (<xsl:value-of select="$order-info/delivery/price/@suffix" />)
			<br/>
			
			<br/>
		<xsl:text>Состав заказа</xsl:text><br/>
		<table>
			<tr>
				<td style="border:1px solid #cccccc;padding: 5px;">Артикул</td>
				<td style="border:1px solid #cccccc;padding: 5px;">Название</td>
				<td style="border:1px solid #cccccc;padding: 5px;">Цвет</td>
				<td style="border:1px solid #cccccc;padding: 5px;">Размер</td>
				<td style="border:1px solid #cccccc;padding: 5px;">Количество</td>
				<td style="border:1px solid #cccccc;padding: 5px;">Стоимость</td>
			</tr>
			<xsl:apply-templates select="$order-info/items/item" mode="order_info_del" />
		</table>
		<xsl:text>Итого:</xsl:text>
		<xsl:choose>
			<xsl:when test="$order-info/summary/price/original">
				<xsl:value-of select="$order-info/summary/price/original" /></xsl:when>
			<xsl:otherwise><xsl:value-of select="price" /></xsl:otherwise>
		</xsl:choose><br/>
		<xsl:text>Итого с доставкой:</xsl:text>
		<xsl:value-of select="price" />
	</xsl:template>
	
	<xsl:template match="invoice_subject">
		<xsl:text>На сайте </xsl:text>
		<xsl:value-of select="domain" />
		<xsl:text> успешно сформирован счет</xsl:text>
	</xsl:template>
	
	<xsl:template match="invoice_content">
		<xsl:text>Вы можете распечатать счет для юридических лиц, </xsl:text> 
		<xsl:text>перейдя по следующей ссылке</xsl:text>
		<p>
			<a href="http://{domain}{invoice_link}">
				<xsl:value-of select="concat('http://', domain, invoice_link)" />
			</a>
		</p>
	</xsl:template>
	
	<xsl:template name="personal_link">
		<xsl:attribute name="href">
			<xsl:choose>
				<xsl:when test="personal_params">
					<xsl:value-of select="concat('http://', domain, '/emarket/personal/void/', personal_params, '/')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat('http://', domain, '/emarket/personal/')" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>

	<xsl:template match="item" mode="order_info_del">
        <xsl:variable name="item_page" select="document(concat('upage://',page/@id))/udata" />


        <tr>
            <td style="border:1px solid #cccccc;padding: 5px;"><xsl:value-of select="$item_page/page/properties/group/property[@name='artikul']/value" /></td>
            <td style="border:1px solid #cccccc;padding: 5px;"><xsl:value-of select="$item_page/page/name" /></td>
            <xsl:if test="not(options/option/@field-name = 'color')"><td valign="middle" style="text-align:center;border:1px solid #cccccc;padding: 5px;"></td></xsl:if>
			<xsl:apply-templates select="options/option" mode="order_option" />
            <td valign="middle" style="text-align:center;border:1px solid #cccccc;padding: 5px;"><xsl:value-of select="amount"/></td>
            <td valign="middle" style="text-align:center;border:1px solid #cccccc;padding: 5px;"><xsl:value-of select="ceiling(total-price/actual)" /></td>
        </tr>
	 </xsl:template>
	 <xsl:template match="option" mode="order_option">
        <td valign="middle" style="text-align:center;border:1px solid #cccccc;padding: 5px;"><xsl:value-of select="@name" /></td>
	 </xsl:template>

</xsl:stylesheet>