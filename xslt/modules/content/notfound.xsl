<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="result[@module = 'content'][@method = 'notfound']">
        <div class="wrap clearfix">
            <h1 style="padding: 100px 0;text-align: center;line-height: 35px">
                <xsl:text>&notfound-page;</xsl:text>
            </h1>
        </div>
	</xsl:template>

</xsl:stylesheet>