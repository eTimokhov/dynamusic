<!-------------------------------------------------------------
Dynamusic Site DAF Site Mockup

HOME

Central page for the site; landing point following login,
providing starting point for site's pages.

Version 4 - adds slot to advertise concerts for viewed
artists.

------------------------------------------------------------->
<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/dynamusic/FeaturedSongs"/>
<dsp:page>
    <HTML>
    <HEAD>
        <TITLE>Dynamusic Home</TITLE>
    </HEAD>
    <BODY>
    <!-- Header -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Home Page"/>
    </dsp:include>
    <!-- (end header banner) -->


    <table width="700" cellpadding="8">
        <tr>

            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <dsp:include page="common/sidebar.jsp"/>
            </td>
            <!-- (end sidebar) -->

            <!-- Page Body -->
            <td valign="top">
                <font face="Verdana,Geneva,Arial" size="-1">

                    <!-- *** Start page content *** -->

                    <table width="560">
                        <tr>
                            <td>
                                <dsp:droplet name="Switch">
                                    <dsp:param name="value" bean="Profile.transient"/>
                                    <dsp:oparam name="false">
                                        <p>Welcome, <dsp:valueof bean="Profile.firstName"/>!</p>
                                    </dsp:oparam>
                                    <dsp:oparam name="true">
                                        <dsp:droplet name="ForEach">
                                            <dsp:param name="array" bean="FeaturedSongs.songs"/>
                                            <dsp:oparam name="outputStart">
                                                <p>This week's featured songs are:</p>
                                            </dsp:oparam>
                                            <ul>
                                                <dsp:oparam name="output">
                                                    <li><dsp:valueof param="element"/></li>
                                                </dsp:oparam>
                                            </ul>
                                        </dsp:droplet>
                                    </dsp:oparam>
                                </dsp:droplet>
                            </td>
                            <td width="160" align="center">
                                Featured Album:<br>
                                <a href="albumDetails.html"><img src="images/BookOfSecrets.jpg"><br>
                                    <b>The Book of Secrets</b> - Loreena McKennitt
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td height="80">&nbsp;</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td valign="top">
                                Playing at a venue near you... <p>
                                <ul>
                                    <li> 22 May 2004 - <a href="concertDetails.html">Eric Clapton at the House of
                                        Blues</a>
                                    <li> 9 June 2004 - <a href="concertDetails.html">Loreena McKennitt at Sanders
                                        Theater</a>
                                    <li> 14 June 2004 - <a href="concertDetails.html">Shania Twain at the Fleet
                                        Center</a>
                                </ul>
                            </td>
                        </tr>
                    </table>

                    <!-- *** End real content *** -->

                </font>
            </td>
        </tr>
    </table>
    </BODY>
    </HTML>
</dsp:page>