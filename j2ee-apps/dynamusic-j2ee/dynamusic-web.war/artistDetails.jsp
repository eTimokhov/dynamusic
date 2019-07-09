<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/dynamusic/ArtistLookupDroplet"/>
<dsp:importbean bean="/atg/dynamo/droplet/RQLQueryForEach"/>
<dsp:page>

    <!-------------------------------------------------------------
    Dynamusic Site Mockup

    ARTIST DETAILS

    Description of an artist and list of albums.

    ------------------------------------------------------------->

    <HTML>
    <HEAD>
        <TITLE>Dynamusic Artist</TITLE>
    </HEAD>
    <BODY>
    <dsp:droplet name="ArtistLookupDroplet">
        <dsp:param name="id" param="itemId"/>
        <dsp:oparam name="output">
            <dsp:include page="common/header.jsp">
                <dsp:param name="pagename" param="element.name"/>
            </dsp:include>
            <table width="700" cellpadding="8">
                <tr>
                    <!-- Sidebar -->
                    <td width="100" bgcolor="ghostwhite" valign="top">
                        <dsp:include page="common/sidebar.jsp"></dsp:include>
                        <br>
                        <font face="Verdana,Geneva,Arial" size="-1" color="steelblue">
                            <dsp:a href="editArtist.jsp">
                                <dsp:param name="artistId" param="itemId"/>
                                Edit Artist Info
                            </dsp:a></font>
                    </td>

                    <!-- Page Body -->

                    <td VALIGN=TOP><!-- *** Start page content *** -->
                        <table CELLPADDING=10>
                            <tr>
                                <td VALIGN=TOP><img SRC="<dsp:valueof param="element.photoURL" /> " NOSAVE></td>
                                <td><font face="Geneva,Arial"><font size=-2>
                                    <dsp:valueof param="element.description"/>
                                </font></font></td>
                            </tr>
                        </table>

                        <ul>
                            <dsp:droplet name="RQLQueryForEach">
                                <dsp:param name="repository" bean="dynamusic/SongsRepository"/>
                                <dsp:param name="itemDescriptor" value="album"/>
                                <dsp:param name="queryRQL" value="artist = :itemId"/>
                                <dsp:oparam name="output">
                                    <dsp:setvalue param="album" paramvalue="element"/>
                                    <li><font face="Verdana,Geneva,Arial"><font size=-1><dsp:a href="albumDetails.jsp">
                                        <dsp:param name="itemId" param="album.id"/>
                                        <dsp:valueof param="album.title"/>
                                    </dsp:a></font></font></li>
                                </dsp:oparam>
                                <dsp:oparam name="empty">
                                    <p>No albums found.</p>
                                </dsp:oparam>
                            </dsp:droplet>
                        </ul>
                        <!-- *** End real content *** -->
                    </td>
                </tr>
            </table>
        </dsp:oparam>
        <dsp:oparam name="empty">
            <p>Artist not found.</p>
        </dsp:oparam>
    </dsp:droplet>

    </BODY>
    </HTML>
</dsp:page>