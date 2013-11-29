<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="html" indent="yes" encoding="utf-8" />
    <xsl:param name="feature.id" select="''" />

    <xsl:template match="/">
        <xsl:if test="normalize-space($feature.id != '') and
                      /data/featureset[@id = $feature.id]">

            <xsl:variable name="context" select="/data/featureset[@id = $feature.id]" />

            <html>
                <head>
                    <title><xsl:value-of select="$context/title" /></title>
                    <link rel="stylesheet" type="text/css" href="assets/css/stylesheet.web.css" />
                    <style type="text/css">
                        <xsl:value-of select="$context/css" />
                    </style>

                </head>
                <body>
                    <div id="control-bar" class="cf">
                        <div id="toc">
                            <div class="control-button" id="toc-button">Table of Contents</div>
                        </div>
                        <div id="font-sizer">
                            <span title="Decrease font size" class="control-button sizer-button" id="font-smaller">&#9660;</span>
                            <span title="Increase font size" class="control-button sizer-button" id="font-larger">&#9650;</span>
                        </div>
                    </div>

                    <xsl:if test="normalize-space($context/description) != ''">
                        <div class="description">

                        </div>
                    </xsl:if>
                    <div id="featureset" class="cf">
                        <xsl:copy-of select="$context/content/node()" />
                    </div>

                    <script src="assets/js/jquery.js"></script>
                    <script src="assets/js/web.js"></script>
                </body>
            </html>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
