<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:variable name="pageId" select="/result/@pageId" />
	<xsl:variable name="module" select="/result/@module" />
	<xsl:variable name="method" select="/result/@method" />
	<xsl:variable name="requestUri" select="/result/@request-uri" />
	<xsl:variable name="errors" select="document('udata://system/listErrorMessages')/udata" />
	<xsl:variable name="langPrefix" select="/result/@pre-lang" />
	<xsl:variable name="lang" select="/result/@lang" />
	<xsl:variable name="userId" select="/result/user/@id" />
	<xsl:variable name="userType" select="/result/user/@type" />
	<xsl:variable name="userInfo" select="document(concat('uobject://', $userId))/udata" />
	<xsl:variable name="isDefault" select="/result/page/@is-default" />
	<xsl:variable name="pageLink" select="/result/page/@link" />
	<xsl:variable name="domain" select="/result/@domain" />
	<!--<xsl:variable name="siteInfoPage" select="document('upage://1')/udata/page" />-->
	<!--<xsl:variable name="siteInfo" select="$siteInfoPage//group[@name = 'site_info']/property" />-->
	<xsl:variable name="siteInfoPageId" select="'2'" />
	<xsl:variable name="isAjax" select="document('udata://content/isAjaxRequest')/udata" />
	<xsl:variable name="siteInfoPage" select="document(concat('upage://',$siteInfoPageId))/udata/page" />


    <!--<xsl:variable name="logotip" select="$siteInfoPage//property[@name='logo']/value"/>-->


    <xsl:param name="p" select="'0'" />
    <xsl:param name="catItems" select="'5'" />
    <xsl:param name="bookmarks" select="'0'"/>

	<xsl:param name="search_string" />
	<xsl:param name="param0" />

    <xsl:variable name="isAdmin">
        <xsl:choose>
            <xsl:when test="$userType = 'admin' or $userType = 'sv'">1</xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="rootPageId">
        <xsl:choose>
            <xsl:when test="count(/result/parents/page) != 0">
                <xsl:value-of select="/result/parents/page[1]/@id"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="/result/@pageId"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:param name="_request_time" />
    <xsl:param name="_query_string" />
    <xsl:param name="_http_accept" />
    <xsl:param name="_http_accept_charset" />
    <xsl:param name="_http_accept_encoding" />
    <xsl:param name="_http_accept_language" />
    <xsl:param name="_http_host" />
    <xsl:param name="_http_referer" />
    <xsl:param name="_http_user_agent" />
    <xsl:param name="_remote_addr" />
    <xsl:param name="_remote_host" />
    <xsl:param name="_request_uri" />


    <xsl:param name="sort"/>


</xsl:stylesheet>