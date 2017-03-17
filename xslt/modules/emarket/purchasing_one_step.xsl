<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM	"ulang://i18n/constants.dtd:file">

<xsl:stylesheet	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/TR/xlink">

<xsl:template match="result[@module = 'emarket' and @method = 'purchasing_one_step']">
		<xsl:apply-templates select="document('udata://system/listErrorMessages')/udata" />
		<xsl:variable name="customerid" select="udata/onestep/customer/@id" />
		<xsl:variable name="user-info" select="document(concat('upage://', user/@id))" />
		<xsl:variable name="last_order" select="$user-info//property[@name='last_order']/value/option/object/@id" />
		<xsl:variable name="tovari" select="document(concat('udata://emarket/cart/', $last_order))/udata" />
		<xsl:variable name="order_id" select="document('udata://emarket/ordersList')/udata/items/item[last()]/@id" />
        <xsl:variable name="order_info" select="document(concat('udata://emarket/order/', $order_id))/udata" />
		<h1>Подтверждение заказа</h1>
		<form  id="form_send_order" action="/emarket/saveInfo" method="POST">
		<xsl:if test="user/@id = 335">
			<table class="input_items_one_field">
				<tbody>
					<tr>
						<td>
							<div class="register_title">Имя <font color="red">*</font></div>
							<input type="text" name="data[{$customerid}][fname]" class="first_name" pattern="^[A-Za-zА-Яа-яЁё]+$" required="required" value="{$user-info//property[@name = 'fname']/value}"/>
						</td>
					</tr>
					<tr>
						<td>
							<div class="register_title">Фамилия </div>
							<input type="text" name="data[{$customerid}][lname]" class="last_name" pattern="^[A-Za-zА-Яа-яЁё]+$" required="required" value="{$order_info//property[@name = 'lname']/value}"/>
						</td>
					</tr>
					<tr>
						<td>
							<div class="input_title">Телефон <font color="red">*</font></div>
							<input name="data[{$customerid}][phone]"  id="phone" placeholder="(XXX)XXX-XX-XX" required="required" value="{$order_info//property[@name = 'phone']/value}"/>
						</td>
					</tr>
					<tr>
						<td>
							<div class="input_title">Эл. почта <font color="red">*</font></div>
							<input name="data[{$customerid}][email]" pattern="\S+@[a-z]+.[a-z]+" required="required" value="{$order_info//property[@name = 'email']/value}"/>
						</td>
					</tr>
				</tbody>
			</table>
		</xsl:if>
			<table cellspacing="0" cellpadding="6" class="basketcontent" style="width:600px">
				<tbody>
					<tr>
						<th align="left">Название</th>
						<th align="left">Цвет</th>
						<th>Размер</th>
						<th>Количество</th>
					</tr>
					<xsl:apply-templates select="document(concat('udata://emarket/cart/', $last_order))/udata" mode="spistov" />
				</tbody>
			</table>
			<div id="order_summary" style="display:none;">
				Итого: <xsl:value-of select="$tovari/summary/price/actual" /> р.
			</div>
			<table class="order_table nopadding" style="margin-top:10px;">
				<tbody>
					<tr>
						<td align="left">
							<input type="submit" class="button submit" value="Отправить оператору" style="width:160px;"/>
						</td>
						<td align="right" style="padding-left:20px;">
							<input type="button" class="button" value="Изменить заказ" onclick="window.location.href='/emarket/cart/'" style="width:130px;"/>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="radio" name="payment-id" class="courier" value="1042" checked="checked" style="display:none;" />
		</form>	
	</xsl:template>

	<xsl:template match="udata"  mode="spistov">
		<xsl:apply-templates select="items/item" mode="odnitem" />
	</xsl:template>

	<xsl:template match="item"  mode="odnitem">
		<tr>
			<td align="left"><xsl:value-of select="page/name" /></td>
			<xsl:if test="options/option/@id=4721 or not(options/option/@field-name='color')">
			<td align="left"></td>
			</xsl:if>
			<xsl:apply-templates select="options/option" mode="optitem" />
			
			<td align="center"><xsl:value-of select="amount" /></td>
		</tr>
	</xsl:template>

	<xsl:template match="option"  mode="optitem">
		<xsl:if test="not(@id=4721)">
			<td><xsl:value-of select="@name" /></td>
		</xsl:if>
	</xsl:template>


	<xsl:template match="result[@method = 'purchase']">
			<xsl:apply-templates select="document('udata://emarket/purchase')/udata" />
	</xsl:template>

	<xsl:template match="purchasing[@stage = 'result'][@step = 'successful']">
		<table width="100%" cellpadding="0" cellspacing="0">
		    <tbody>
		    	<tr>
			        <td>
			            <div class="header">
			                Спасибо за Ваш заказ
			            </div>
			        </td>
			    </tr>
			    <tr>
			        <td>
			            <div class="header">
			                В ближайшее время с Вами свяжется наш менеджер
			            </div>
			        </td>
			    </tr>
		    </tbody>
		</table>
	</xsl:template>


</xsl:stylesheet>