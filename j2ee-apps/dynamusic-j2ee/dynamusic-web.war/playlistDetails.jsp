<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/dynamusic/PlaylistLookupDroplet"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/ProfileAdapterRepository"/>
<dsp:page>
    <HTML>
    <HEAD>
        <TITLE>Playlist details</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Playlist details"/>
    </dsp:include>
    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <dsp:include page="common/sidebar.jsp"/>
            </td>
            <!-- Page Body -->
            <td valign="top">
                <dsp:droplet name="PlaylistLookupDroplet">
                    <dsp:param name="id" param="itemId"/>
                    <dsp:oparam name="empty">
                        <p>Playlist not found.</p>
                    </dsp:oparam>
                    <dsp:oparam name="output">
                        <h3><dsp:valueof param="element.name"/></h3>
                        <i>Songs:</i>
                        <ul>
                            <dsp:droplet name="ForEach">
                                <dsp:param name="array" param="element.songs"/>
                                <dsp:oparam name="output">
                                    <li>
                                        <dsp:a href="song.jsp">
                                            <dsp:param name="itemId" param="element.id"/>
                                            <dsp:valueof param="element.title"/>
                                        </dsp:a>
                                        by <dsp:valueof param="element.artist.name"/>
                                    </li>
                                </dsp:oparam>
                                <dsp:oparam name="empty">
                                    <p>This playlist is empty.</p>
                                </dsp:oparam>
                            </dsp:droplet>
                        </ul>
                    </dsp:oparam>
                </dsp:droplet>
            </td>
        </tr>


        <!-- *** End real content *** -->
    </table>
    </BODY>
    </HTML>
</dsp:page>
