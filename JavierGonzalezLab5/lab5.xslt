<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Computer Science Majors</title>
      </head>
      <body>
        <table border="1" bordercolor="black" cellpadding="6">
          <tr>
            <td colspan="6">
            <font size="5">
              <b>Computer Science Majors</b>
            </font>
            <p/>
            <xsl:apply-templates select="students/student"/>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="student">
    <xsl:if test="major='CS:BS'">
      <xsl:apply-templates select="id"/>
      <br/>
      <xsl:apply-templates select="lastName"/>    
      <xsl:apply-templates select="firstName"/>
      <br/>
      <xsl:apply-templates select="dateEnrolled"/>
      <br/>
      <xsl:apply-templates select="major"/>
      <br/>
    </xsl:if>
    <p/>
  </xsl:template>

  <xsl:template match="id">
    ID = <xsl:value-of select="self::node()"/>
  </xsl:template>

  <xsl:template match="lastName">
    Name = <xsl:value-of select="self::node()"/>,
  </xsl:template>

  <xsl:template match="firstName">
    <xsl:value-of select="self::node()"/>
  </xsl:template>

  <xsl:template match="dateEnrolled">
    Date-enrolled: <xsl:value-of select="self::node()"/>
  </xsl:template>

  <xsl:template match="major">
    Major: <xsl:value-of select="self::node()"/>, declared in <xsl:value-of select="@catalogYear"/>
    <br/>
    <xsl:if test="@catalogYear>2008">
      <font color="red">Must complete the Senior Project course.</font>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>