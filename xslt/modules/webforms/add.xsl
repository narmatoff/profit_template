<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">
<xsl:stylesheet	version="1.0"
				xmlns="http://www.w3.org/1999/xhtml"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:date="http://exslt.org/dates-and-times"
				xmlns:udt="http://umi-cms.ru/2007/UData/templates"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				exclude-result-prefixes="xsl date udt xlink">

    <!--_______________________________________________________Левая плашка________________________________________________________-->
    <xsl:template match="udata[@module = 'webforms'][@method = 'add']" mode="recall-webforms">
        <form method="post" action="{$langPrefix}/webforms/send/" class="form">
            <xsl:apply-templates select="items" mode="address" />
            <xsl:apply-templates select="groups/group" mode="simple" />
            <input type="hidden" name="system_form_id" value="{/udata/@form_id}" />
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{/udata/@form_id}" />
			<input type="submit" value="Перезвоните мне" class="button button__yellow"/>
        </form>
    </xsl:template>

        <!--_______________________________________________________плашка внизу страницы________________________________________________________-->
    <xsl:template match="udata[@module = 'webforms'][@method = 'add']" mode="q-webforms">
        <form method="post" action="{$langPrefix}/webforms/send/" class="form">
            <xsl:apply-templates select="items" mode="address" />
            <xsl:apply-templates select="groups/group" mode="simple-question" />
            <input type="hidden" name="system_form_id" value="{/udata/@form_id}" />
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{/udata/@form_id}" />
			<input type="submit" value="Получить консультацию" class="button button__yellow button__centered questions_button"/>
        </form>
    </xsl:template>

    <xsl:template match="group" mode="simple-question">
        <xsl:apply-templates select="field" mode="simple-question" />
    </xsl:template>

     <xsl:template match="field" mode="simple-question">
        <input type="text" name="{@input_name}" id="{@name}_field" placeholder="{@title}" class="questions_input">
            <xsl:if test="@required = 'required'">
                <xsl:attribute name="required">
                    <xsl:text>required</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@name = 'telefon'">
            	<xsl:attribute name="placeholder">
                    <xsl:text>+7 (___) ___-__-__</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="data-inputmask">
                    <xsl:text>'mask': '+7 (999)-999-99-99'</xsl:text>
                </xsl:attribute>
            </xsl:if>
        </input>
    </xsl:template>

    <xsl:template match="group" mode="simple">
        <xsl:apply-templates select="field" mode="simple" />
    </xsl:template>

    <xsl:template match="field" mode="simple">
        <input type="text" name="{@input_name}" id="{@name}_field" placeholder="{@title}">
            <xsl:if test="@required = 'required'">
                <xsl:attribute name="required">
                    <xsl:text>required</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@name = 'telefon'">
            	<xsl:attribute name="placeholder">
                    <xsl:text>+7 (___) ___-__-__</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="data-inputmask">
                    <xsl:text>'mask': '+7 (999)-999-99-99'</xsl:text>
                </xsl:attribute>
            </xsl:if>
        </input>
    </xsl:template>
    <!--_______________________________________________________Callbacl Form________________________________________________________-->

    <xsl:template match="udata[@module = 'webforms'][@method = 'add']" mode="callback">
        <form method="post" action="{$langPrefix}/webforms/send/" class="callback-form">
            <xsl:apply-templates select="items" mode="address" />
            <xsl:apply-templates select="groups/group" mode="webforms" />
            <input type="hidden" name="system_form_id" value="{/udata/@form_id}" />
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{/udata/@form_id}" />
            <input type="submit" value="&send;" class="send"/>
        </form>
    </xsl:template>

    <!--******************************Feedback hide form************************************-->
    <xsl:template match="udata[@module = 'webforms'][@method = 'add']" mode="feedback_hide">
        <div class="hide-popup mfp-hide" id="leave-bid">
            <h4>&submit-request;</h4>

            <form method="post" action="{$langPrefix}/webforms/send/" class="feedback-popup">
                <input type="hidden" name="system_form_id" value="{/udata/@form_id}" />
                <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{/udata/@form_id}" />
                <xsl:apply-templates select="items" mode="address" />
                <xsl:apply-templates select="groups/group" mode="webforms-contacts" />
                <input type="submit" value="&send;" class="send"/>
            </form>

            <div class="close">
            </div>
        </div>
    </xsl:template>


    <!--_______________________________________________________________________________________________________________-->

	<xsl:template match="udata[@module = 'webforms'][@method = 'add']">
		<form method="post" action="{$langPrefix}/webforms/send/" onsubmit="site.forms.data.save(this); return site.forms.check(this);">
			<xsl:apply-templates select="items" mode="address" />
			<xsl:apply-templates select="groups/group" mode="webforms" />
			<input type="hidden" name="system_form_id" value="{/udata/@form_id}" />
			<input type="hidden" name="ref_onsuccess" value="/webforms/posted/{/udata/@form_id}" />
			<div class="form_element">
				<xsl:apply-templates select="document('udata://system/captcha/')/udata" />
			</div>
			<div class="form_element">
				<input type="submit" class="button" value="Отправить" />
			</div>
		</form>
	</xsl:template>

	<xsl:template match="udata[@module = 'webforms'][@method = 'add']" mode="contacts">
		<form method="post" class="feedback" action="/webforms/send/" onsubmit="site.forms.data.save(this); return site.forms.check(this);">
			<input type="hidden" name="system_form_id" value="{/udata/@form_id}" />
			<input type="hidden" name="ref_onsuccess" value="/webforms/posted/{/udata/@form_id}" />
			<xsl:apply-templates select="items" mode="address" />
			<xsl:apply-templates select="groups/group" mode="webforms-contacts" />
			<input type="submit" value="отправить" class="send"/>
		</form>
	</xsl:template>

	<xsl:template match="group" mode="webforms-contacts" >
		<xsl:apply-templates select="field" mode="webforms-contacts" />
	</xsl:template>

	<xsl:template match="field" mode="webforms-contacts">
		<label for="{@name}_field">
            <xsl:value-of select="@title"/>
            <xsl:apply-templates select="." mode="webforms_required-contacts" />
        </label>
		<xsl:apply-templates select="." mode="webforms_input_type" />
	</xsl:template>

	<xsl:template match="group" mode="webforms">
		<xsl:apply-templates select="field" mode="webforms" />
	</xsl:template>

	<xsl:template match="field" mode="webforms">
		<div class="form_element">
			<label>
				<xsl:apply-templates select="." mode="webforms_required" />
				<span><xsl:value-of select="@title" /><xsl:text>:</xsl:text></span>
				<xsl:apply-templates select="." mode="webforms_input_type" />
			</label>
		</div>
	</xsl:template>

	<xsl:template match="field" mode="webforms_input_type">
		<input type="text" name="{@input_name}" id="{@name}_field">
			<xsl:if test="@required = 'required'">
				<xsl:attribute name="required">
					<xsl:text>required</xsl:text>
				</xsl:attribute>
			</xsl:if>
		</input>
	</xsl:template>

	<xsl:template match="field[@type = 'text']" mode="webforms_input_type">
		<textarea name="{@input_name}" id="{@name}_field">
			<xsl:if test="@required = 'required'">
				<xsl:attribute name="required">
					<xsl:text>required</xsl:text>
				</xsl:attribute>
			</xsl:if>
		</textarea>
	</xsl:template>

	<xsl:template match="field[@type = 'relation']" mode="webforms_input_type">
		<select name="{@input_name}">
			<xsl:if test="@multiple">
				<xsl:attribute name="multiple">
					<xsl:text>multiple</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<option value=""></option>
			<xsl:apply-templates select="values/item" mode="webforms_input_type" />
		</select>
	</xsl:template>

	<xsl:template match="item" mode="webforms_input_type">
		<option value="{@id}"><xsl:apply-templates /></option>
	</xsl:template>

	<xsl:template match="field" mode="webforms_required" />

	<xsl:template match="field[@required = 'required']" mode="webforms_required">
		<xsl:attribute name="class">
			<xsl:text>required</xsl:text>
		</xsl:attribute>
	</xsl:template>
	<xsl:template match="field[@required = 'required']" mode="webforms_required-contacts">
		<span>*</span>
	</xsl:template>
	<xsl:template match="items" mode="address">
		<xsl:apply-templates select="item" mode="address" />
	</xsl:template>

	<xsl:template match="item" mode="address">
		<input type="hidden" name="system_email_to" value="{@id}" />
	</xsl:template>

	<xsl:template match="items[count(item) &gt; 1]" mode="address">
		<xsl:choose>
			<xsl:when test="count(item[@selected='selected']) != 1">
				<div class="form_element">
					<label class="required">
						<span><xsl:text>Кому отправить:</xsl:text></span>
						<select name="system_email_to">
							<option value=""></option>
							<xsl:apply-templates select="item" mode="address_select" />
						</select>
					</label>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="item[@selected='selected']" mode="address" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="item" mode="address_select">
		<option value="{@id}"><xsl:apply-templates /></option>
	</xsl:template>

</xsl:stylesheet>