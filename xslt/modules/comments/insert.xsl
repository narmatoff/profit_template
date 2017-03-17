<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM    "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:udt="http://umi-cms.ru/2007/UData/templates"
                xmlns:umi="http://www.umi-cms.ru/TR/umi"
                exclude-result-prefixes="xsl date udt umi">

    <xsl:template match="udata[@module = 'comments'][@method = 'insert']">
        <span>&empty-comment;</span>
    </xsl:template>

    <xsl:template match="udata[@module = 'comments'][@method = 'insert'][items/item]">
        <ul class="comments">
            <xsl:apply-templates select="items/item" mode="comments.list"/>
        </ul>
        <xsl:value-of select="per_page"/>
        <xsl:call-template name="numpages">
            <xsl:with-param name="total" select="total" />
            <xsl:with-param name="limit" select="per_page" />
        </xsl:call-template>
        <xsl:apply-templates select="user" mode="addcomment" />
    </xsl:template>

    <xsl:template match="item" mode="comments.list">
        <li>
            <span class="autor">
                <xsl:apply-templates select="document(concat('udata://users/viewAuthor/', @author_id))/udata"/>
            </span>
            <span class="title">
                <xsl:value-of select="@title"/>
            </span>
            <span class="time">
                <xsl:value-of select="document(concat('udata://data/dateConvert/', @publish_time))"/>
            </span>
            <div class="massage">
                <xsl:value-of select="." disable-output-escaping="yes"/>
            </div>
        </li>
    </xsl:template>

    <xsl:template match="user" mode="addcomment">
        <xsl:apply-templates select="document(concat('udata://comments/insert/', $pageId))/udata/action"/>
    </xsl:template>

    <xsl:template match="action">

        <h3><a name="addcomment">Добавить комментарий</a></h3>

        <form method="post" action="{.}" name="form_addcomment" id="form_addcomment">

            <fieldset class="intext">
                <label for="comment_title" id="for_title" title="Заголовок">
                    <span>Заголовок:&nbsp;<sup class="asterisk">*</sup></span>
                    <input type="text" name="title" id="comment_title" />
                </label>

                <label for="comment_author">
                    <span>Ваш ник:</span>
                    <input type="text" name="author_nick" id="comment_author" />
                </label>

                <label for="comment_email">
                    <span>Ваш e-mail:</span>
                    <input type="text" name="author_email" id="comment_email" />
                </label>

                <label for="comment_text" id="for_comment" title="Текст">
                    <span>Текст:&nbsp;<sup class="asterisk">*</sup></span>
                    <textarea name="comment" id="comment_text" cols="6" />
                </label>
            </fieldset>

            <input class="btt submit-send" type="submit" value="отправить"/>

        </form>

    </xsl:template>


    <xsl:template match="user[@status = 'auth']">
        <h3><a name="addcomment">Добавить комментарий</a></h3>

        <form method="post" action="/comments/post/{/result/@pageId}/" name="form_addcomment" id="form_addcomment">

            <fieldset class="intext">
                <label for="comment_title" id="for_title" title="Заголовок">
                    <span>Заголовок:&nbsp;<sup class="asterisk">*</sup></span>
                    <input type="text" name="title" id="comment_title" />
                </label>

                <label for="comment_text" id="for_comment" title="Текст">
                    <span>Текст:&nbsp;<sup class="asterisk">*</sup></span>
                    <textarea name="comment" id="comment_text" cols="6" />
                </label>
            </fieldset>

            <input class="submit-send" type="submit" value="Отправить"/>

        </form>
    </xsl:template>

</xsl:stylesheet>