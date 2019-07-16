<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:page>
    <HTML>
    <HEAD>
        <TITLE>Playlists</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Playlists"/>
    </dsp:include>
    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <dsp:include page="common/sidebar.jsp"/>
            </td>
            <!-- Page Body -->
            <td valign="top">
                <h3>Your playlists:</h3>
                <ul>
                    <dsp:droplet name="ForEach">
                        <dsp:param name="array" bean="Profile.playlists"/>
                        <dsp:oparam name="output">
                            <li><dsp:a href="playlistDetails.jsp">
                                <dsp:param name="itemId" param="element.id"/>
                                <dsp:valueof param="element.name"/>
                            </dsp:a></li>
                        </dsp:oparam>
                        <dsp:oparam name="empty">
                            <p>You don't have any playlists yet</p>
                        </dsp:oparam>
                    </dsp:droplet>
                </ul>
                <p><dsp:a href="newPlaylist.jsp">Create new playlist</dsp:a></p>
            </td>
        </tr>


        <!-- *** End real content *** -->
    </table>
    </BODY>
    </HTML>
</dsp:page>
