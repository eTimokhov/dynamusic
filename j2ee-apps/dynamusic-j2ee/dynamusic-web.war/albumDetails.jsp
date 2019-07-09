<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/dynamusic/AlbumLookupDroplet"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:page>
    <!-------------------------------------------------------------
    Dynamusic Site Mockup

    ALBUM DETAILS

    Description of an album and list of songs.

    ------------------------------------------------------------->


    <HTML>
    <HEAD>
        <TITLE>Dynamusic Album</TITLE>
    </HEAD>
    <BODY>
    <dsp:droplet name="AlbumLookupDroplet">
        <dsp:param name="id" param="itemId"/>
        <dsp:oparam name="output">
            <dsp:include page="common/header.jsp">
                <dsp:param name="pagename" param="element.title"/>
            </dsp:include>
            <table width="700" cellpadding="8">
                <tr>
                    <!-- Sidebar -->
                    <td width="100" bgcolor="ghostwhite" valign="top">
                        <dsp:include page="common/sidebar.jsp"></dsp:include>
                    </td>
                    <!-- Page Body -->

                    <td VALIGN=TOP>
                        <!-- *** Start page content *** -->
                        <table CELLPADDING=10>
                            <tr>
                                <td VALIGN=TOP><img SRC="<dsp:valueof param="element.coverURL"/>" NOSAVE height=119
                                                    width=120></td>
                                <td VALIGN=TOP><font face="Geneva,Arial"><font size=-1>
                                    <dsp:valueof param="element.description"/>
                                </font></font></td>
                            </tr>
                        </table>

                        <ul>
                            <dsp:droplet name="ForEach">
                                <dsp:param name="array" param="element.songList"/>
                                <dsp:oparam name="output">
                                    <li>
                                        <font face="Verdana,Geneva,Arial"><font size=-1><dsp:a href="song.jsp">
                                            <dsp:param name="itemId" param="element.id"/>
                                            <dsp:valueof param="element.title"/>
                                        </dsp:a>&nbsp;</font></font></li>
                                </dsp:oparam>
                            </dsp:droplet>
                        </ul>
                        <!-- *** End real content *** --></td>
                </tr>
            </table>
        </dsp:oparam>
        <dsp:oparam name="empty">
            <p>Album not found.</p>
        </dsp:oparam>
    </dsp:droplet>
    </BODY>
    </HTML>
</dsp:page>