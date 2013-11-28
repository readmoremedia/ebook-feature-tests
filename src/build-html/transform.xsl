<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="xml"
                indent="yes"
                encoding="utf-8"
                omit-xml-declaration="yes" />

    <xsl:param name="feature.id" select="''" />

    <xsl:template match="/">
        <xsl:if test="normalize-space($feature.id != '') and
                      /data/featureset[@id = $feature.id]">

            <xsl:variable name="context" select="/data/featureset[@id = $feature.id]" />

            <html>
            <head>
                <meta charset="utf-8" />
                <title><xsl:value-of select="$context/title" /></title>
                <link rel="stylesheet" type="text/css" href="assets/css/stylesheet.web.css" />
                <style type="text/css">
                    <xsl:value-of select="$context/css" />
                </style>
            </head>
            <body>
                <xsl:if test="normalize-space($context/description) != ''">
                    <div class="description">

                    </div>
                </xsl:if>
                <div class="featureset">
                    <xsl:copy-of select="$context/content/node()" />
                </div>
            </body>
            </html>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
