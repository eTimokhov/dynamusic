<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/dynamusic/PlaylistFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/RQLQueryForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/RQLQueryRange"/>
<dsp:importbean bean="/atg/userprofiling/ProfileAdapterRepository"/>
<dsp:page>

    <%-- Required input param: itemId (id of the song to display --%>

    <!-------------------------------------------------------------
    Dynamusic Site Mockup

    SONG

    Description of an individual song.

    ------------------------------------------------------------->


    <HTML>
    <HEAD>
        <TITLE>Dynamusic Song</TITLE>
    </HEAD>
    <BODY>
    <dsp:droplet name="/dynamusic/SongLookupDroplet">
        <dsp:param name="id" param="itemId"/>
        <dsp:oparam name="output">

            <!-- (replace this entire table by dynamically including
            common/header.html) -->
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
                    <td valign="top">
                        <font face="Verdana,Geneva,Arial" size="-1">

                            <!-- *** Start page content *** -->

                            <table cellpadding="10">
                                <tr>
                                    <td valign="top" align="right"> Song:</td>
                                    <td valign="top">
                                        <font face="Courier New"><b> <dsp:valueof param="element.title"/> </b></font>
                                        &nbsp
                                        <font size=-2 face="Courier New"><a
                                                href="<dsp:valueof param="element.downloadURL"/>">Download</a></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right"> Artist:</td>
                                    <td valign="top">
                                        <font face="Courier New"><b>
                                            <dsp:a href="artistDetails.jsp">
                                                <dsp:param name="itemId" param="element.artist.id"/>
                                                <dsp:valueof param="element.artist.name"/>
                                            </dsp:a> </b></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right"> Album(s):</td>
                                    <td valign="top">
                                        <font face="Courier New"><b>
                                            <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
                                                <dsp:param name="queryRQL" value="songList INCLUDES :element"/>
                                                <dsp:param name="repository" value="/dynamusic/SongsRepository"/>
                                                <dsp:param name="itemDescriptor" value="album"/>
                                                <dsp:oparam name="output">
                                                    <dsp:a href="albumDetails.jsp">
                                                        <dsp:param name="itemId" param="element.id"/>
                                                        <dsp:valueof param="element.title"/>
                                                    </dsp:a>
                                                </dsp:oparam>
                                                <dsp:oparam name="empty">
                                                    No albums found for this song.
                                                </dsp:oparam>
                                            </dsp:droplet>
                                        </b></font>
                                    </td>
                                </tr>
                                <tr>
                                    <dsp:droplet name="Switch">
                                        <dsp:param name="value" bean="Profile.transient"/>
                                        <dsp:oparam name="false">
                                            <td valign="top" align="right"> Add this song to your playlist:</td>
                                            <td valign="top">
                                                <dsp:form action="<%= request.getRequestURI() %>">
                                                    <dsp:select bean="PlaylistFormHandler.repositoryId">
                                                        <dsp:droplet name="ForEach">
                                                            <dsp:param name="array" bean="Profile.playlists"/>
                                                            <dsp:oparam name="output">
                                                                <option value="<dsp:valueof param="element.id"/>">
                                                                    <dsp:valueof param="element.name"/>
                                                                </option>
                                                            </dsp:oparam>
                                                        </dsp:droplet>
                                                    </dsp:select>
                                                    <dsp:input bean="PlaylistFormHandler.songId" type="hidden"
                                                               paramvalue="element.id"/>
                                                    <dsp:input bean="PlaylistFormHandler.userId" type="hidden"
                                                               beanvalue="Profile.id"/>
                                                    <dsp:input bean="PlaylistFormHandler.addSongSuccessURL"
                                                               type="hidden" value="playlists.jsp"/>
                                                    <dsp:input bean="PlaylistFormHandler.addSong" type="submit"
                                                               value="Add song"/>
                                                </dsp:form>
                                            </td>
                                        </dsp:oparam>
                                    </dsp:droplet>
                                </tr>
                                <tr>
                                    <td valign="top" align="right">Users that have this song in their playlists:</td>
                                    <td valign="top">
                                        <dsp:setvalue param="currentUserId" beanvalue="Profile.id"/>
                                        <dsp:droplet name="RQLQueryRange">
                                            <dsp:param name="repository" bean="ProfileAdapterRepository"/>
                                            <dsp:param name="itemDescriptor" value="user"/>
                                            <dsp:param name="howMany" value="3"/>
                                            <dsp:param name="queryRQL"
                                                       value="(id != :currentUserId)
                                                          AND (shareProfile = true)
                                                          AND (playlists INCLUDES ITEM (publish = true AND songs INCLUDES ITEM (id = :itemId)))"/>
                                            <dsp:oparam name="output">
                                                <dsp:a href="userDetails.jsp">
                                                    <dsp:param name="itemId" param="element.id"/>
                                                    <dsp:valueof param="element.firstName"/>
                                                    <dsp:valueof param="element.lastName"/>
                                                </dsp:a><br>
                                            </dsp:oparam>
                                            <dsp:oparam name="empty">
                                                No users found.
                                            </dsp:oparam>
                                        </dsp:droplet>
                                    </td>
                                </tr>
                            </table>

                            &nbsp;<p>
                            <font face="Geneva,Arial" size="-1">
                                <i>
                                    <dsp:valueof param="element.description"/>
                                </i>
                            </font>
                            <!-- *** End real content *** -->
                        </font>
                    </td>

                </tr>
            </table>
        </dsp:oparam>
    </dsp:droplet>
    </BODY>
    </HTML>
</dsp:page>
