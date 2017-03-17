<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM    "ulang://i18n/constants.dtd:file">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" xmlns:udt="http://umi-cms.ru/2007/UData/templates" xmlns:umi="http://www.umi-cms.ru/TR/umi" xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xsl date udt umi">
    <xsl:template match="udata[@module = 'users'][@method = 'viewAuthor']">
        <xsl:value-of select="nickname" />
    </xsl:template>
    <xsl:template match="udata[@module = 'users'][@method = 'viewAuthor']">
        <xsl:value-of select="fname" />&nbsp;
        <xsl:value-of select="lname" />
    </xsl:template>
    <xsl:template match="result[@module = 'users' and @method = 'login']">
        <xsl:apply-templates select="document('udata://users/auth/')/udata" />
    </xsl:template>
    <xsl:template match="result[@module = 'users' and @method = 'auth']">
        <xsl:apply-templates select="document('udata://users/auth/')/udata" />
    </xsl:template>
    <xsl:template match="udata[@module = 'users' and @method = 'auth']">
        <xsl:param name="_http_referer" />
        <table class="common" width="100%">
            <tbody>
                <tr>
                    <th>Зарегистрированный пользователь</th>
                </tr>
                <tr>
                    <td width="50%" valign="top">
                        <form id="dealerlogin" action="/users/login_do/" method="post">
                            <table class="window" align="left">
                                <tbody>
                                    <tr>
                                        <th>Имя пользователя:</th>
                                        <td>
                                            <input id="login" name="login" value="" class="text" type="text" vk_1578c="subscribed" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Пароль:</th>
                                        <td>
                                            <input id="password" name="password" value="" class="password" type="password" vk_1578c="subscribed" />
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <!-- <a href="javascript:void(Form.REGISTERED_FORMS['dealerlogin'].submit())"><img src="{$template-resources}images/enter.png" onmouseover="this.src='{$template-resources}images/enter_over.png'" onmouseout="this.src='{$template-resources}images/enter.png'" border="0"/></a> -->
                                            <input type="submit" value="вход" />
                                            <input style="display:none;" type="hidden" name="from_page" value="{$_http_referer}" />
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
        <p>
            Если Вы еще не зарегистрированы на сайте, Вы можете
            <a href="/users/registrate/" class="sub">зарегистрироваться</a>.
        </p>
        <p>
            Если Вы забыли пароль, Вы можете
            <a href="/users/forget/" class="sub">воспользоваться сервисом восстановления пароля</a>.
        </p>
    </xsl:template>
    <xsl:template match="result[@method = 'registrate']">
        <xsl:apply-templates select="document('udata://users/registrate')/udata" />
    </xsl:template>
    <xsl:template match="udata[@method = 'registrate']">
        <xsl:apply-templates select="document('udata://system/listErrorMessages')/udata" />
    </xsl:template>
    <xsl:template match="result[@module = 'users'][@method = 'registrate_done']">
        <h4>
            <xsl:text>Заголовок </xsl:text>
        </h4>
        <p>
            <xsl:text> Сообщение о пройденной регистрации </xsl:text>
        </p>
    </xsl:template>
    <xsl:template match="udata[@module = 'users' and @method = 'registrate']">
        <table class="common" width="100%">
            <tbody>
                <tr>
                    <th>Новый пользователь</th>
                </tr>
                <tr>
                    <td>
                        <form action="/users/registrate_do/" method="post" enctype="multipart/form-data">
                            <table class="window" border="0" width="100%">
                                <tbody>
                                    <xsl:apply-templates select="document('udata://data/getCreateForm/52')/udata/group" mode="registrate_fields"/>
                                    <tr>
                                        <th>Пароль:</th>
                                        <td>
                                            <input type="password" name="password1" class="text" value="" vk_1578c="subscribed" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Подтверждение пароля:</th>
                                        <td>
                                            <input type="password" name="password2" class="text" value="" vk_1578c="subscribed" />
                                        </td>
                                    </tr>

                                    <!-- <tr>
                                        <th>Имя пользователя:</th>
                                        <td>
                                            <input type="text" name="login1" class="text" value="" vk_1578c="subscribed" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Пароль:</th>
                                        <td>
                                            <input type="password" name="password1" class="text" value="" vk_1578c="subscribed" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Подтверждение пароля:</th>
                                        <td>
                                            <input type="password" name="password2" class="text" value="" vk_1578c="subscribed" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Имя:</th>
                                        <td>
                                            <input type="text" name="firstName" class="text" value="" vk_1578c="subscribed" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Фамилия:</th>
                                        <td>
                                            <input type="text" name="lastName" class="text" value="" vk_1578c="subscribed" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Город:</th>
                                        <td>
                                            <input type="text" name="city" class="text" value="" vk_1578c="subscribed" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Адрес:</th>
                                        <td>
                                            <input type="text" name="address" class="text" value="" vk_1578c="subscribed" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Телефон:</th>
                                        <td>
                                            <input type="text" name="phone" class="text" value="" vk_1578c="subscribed" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Email:</th>
                                        <td>
                                            <input type="text" name="email" class="text" value="" vk_1578c="subscribed" />
                                        </td>
                                    </tr> -->
  <!--                                   <tr>
                                        <th>Хочу стать оптовым клиентом: </th>
                                        <td>
                                            <table border="0" cellpadding="0" cellspacing="0" align="left" style="">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <input type="checkbox" name="checkboxG4" id="checkboxG4" class="css-checkbox" />
                                                            <label for="checkboxG4" class="css-label radGroup1"></label>
                                                        </td>
                                                        <td style="padding-left:5px;padding-right:10px"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr> -->
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <input type="submit" value="зарегистрироваться" />
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>

    </xsl:template>

    <xsl:template match="field[@type='string']" mode="registrate_fields">
        <tr>
            <th><xsl:value-of select="@title"/>:</th>
            <td>
                <input type="text" id="{@field_id}" name="{@input_name}" class="text" value="" >
                    <xsl:if test="@is_important">                        
                            <xsl:attribute name="required">required</xsl:attribute>
                    </xsl:if>
                </input>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="field[@type='boolean']" mode="registrate_fields">
          <tr>
                <th><xsl:value-of select="@title"/>: </th>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" align="left" style="">
                        <tbody>
                            <tr>
                                <td>
                                    <input type="checkbox" name="{@input_name}" id="{@input_name}" class="css-checkbox" />
                                    <label for="{@input_name}" class="css-label radGroup1"></label>
                                </td>
                                <td style="padding-left:5px;padding-right:10px"></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
    </xsl:template>

    <xsl:template match="result[@module = 'users'][@method = 'activate']">
        <h1>Именить пароль</h1>
        <xsl:apply-templates select="document(concat('udata://users/activate/',$param0,'/'))/udata" />
    </xsl:template>
    <xsl:template match="udata[@module = 'users'][@method = 'activate']">
        <xsl:apply-templates select="document('udata://content/redirect/(/users/auth/)/')/udata" />
    </xsl:template>
    <xsl:template match="udata[@module = 'users'][@method = 'activate'][error]">
        <xsl:value-of select="error" />
    </xsl:template>
    <!-- ///////////// изменение пароля ///////////// -->
    <xsl:template match="result[@method = 'forget']">
        <form id="forget" method="post" action="/users/forget_do/">
            <!--             <script>
                < ![CDATA[
                    jQuery(document).ready(function()
                    {
                        jQuery('#forget input:radio').click(function()
                        {
                            jQuery('#forget input:text').attr('name', jQuery(this).attr('id'));
                        });
                    });

                ]] >
            </script> -->
            <div>
                <label>
                    <span>
                        <input type="radio" id="forget_login" name="choose_forget" checked="checked" />
                        <xsl:text>Логин</xsl:text>
                    </span>
                </label>
                <label>
                    <span>
                        <input type="radio" id="forget_email" name="choose_forget" />
                        <xsl:text>Е-мэйл</xsl:text>
                    </span>
                </label>
            </div>
            <div>
                <input type="text" name="forget_login" />
            </div>
            <div>
                <input type="submit" value="Отправить" />
            </div>
        </form>
    </xsl:template>
    <xsl:template match="result[@method = 'forget_do']">
        <p>
            <xsl:text>Сообщение о том, что на почту выслана ссылка для получения нового пароля</xsl:text>
        </p>
    </xsl:template>
    <xsl:template match="result[@module = 'users'][@method = 'restore']">
        <h1><xsl:value-of select="@header" /></h1>
        <xsl:apply-templates select="document(concat('udata://users/restore/',$param0,'/'))/udata" />
    </xsl:template>
    <xsl:template match="udata[@module = 'users'][@method = 'restore'][@status = 'fail']">
        <div>Пароль успешно изменен, на e-mail адрес, указанный при регистрации выслано уведомление.</div>
        <div>
            <p>Логин:
                <xsl:value-of select="login" />
            </p>
            <p>Пароль:
                <xsl:value-of select="password" />
            </p>
        </div>
    </xsl:template>
    <xsl:template match="udata[@module = 'users'][@method = 'restore'][@status = 'fail']">
        <div>Невозможно восстановить пароль: неверный код активации.</div>
    </xsl:template>
    <!-- ///////////// изменение данных ///////////// -->
    <xsl:template match="result[@method = 'settings']">
    </xsl:template>
    <xsl:template match="result[@module = 'users'][@method = 'profile']">
        <xsl:apply-templates select="document(concat('udata://users/profile/notemplate/', $param0))/udata" mode="profile" />
    </xsl:template>
    <xsl:template match="udata[@method = 'profile']" mode="profile">
        <p>Данного пользователя не существует</p>
    </xsl:template>
    <xsl:template match="udata[@method = 'profile'][id]" mode="profile">
        <xsl:apply-templates select="document(concat('uobject://', id))//properties" mode="userinfo" />
    </xsl:template>
    <xsl:template match="properties" mode="userinfo">
        <p>Логин (ник):
            <xsl:value-of select=".//property[@name = 'login']/value" />
        </p>
        <p>Имя:
            <xsl:value-of select=".//property[@name = 'fname']/value" />
        </p>
        <p>Фамилия:
            <xsl:value-of select=".//property[@name = 'lname']/value" />
        </p>
    </xsl:template>
</xsl:stylesheet>
