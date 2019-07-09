<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/dynamusic/SongSearchFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:page>
    <!-------------------------------------------------------------
    Dynamusic Site DAF Site Mockup

    SEARCH RESULTS

    Display results of a user search, as links to song, artist,
    and album pages.

    ------------------------------------------------------------->


    <HTML>
    <HEAD>
        <TITLE>Dynamusic Search Results</TITLE>
    </HEAD>
    <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Search"/>
    </dsp:include>
    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <dsp:include page="common/sidebar.jsp"/>
            </td>
            <!-- Page Body -->
            <td valign="top">
                <font face="Verdana,Geneva,Arial" size="-1">

                    <!-- *** Start page content *** -->

                    <p>The following songs match your criteria, <font color="red">Man</font>:
                    <p>
                    <ul>
                        <dsp:droplet name="ForEach">
                            <dsp:param name="array" bean="SongSearchFormHandler.searchResults"/>
                            <dsp:oparam name="output">
                                <li>
                                    <dsp:a href="song.jsp">
                                        <dsp:param name="itemId" param="element.id"/>
                                        <dsp:valueof param="element.title"/>
                                    </dsp:a>
                                     by
                                    <dsp:a href="artistDetails.jsp">
                                        <dsp:param name="itemId" param="element.artist.id"/>
                                        <dsp:valueof param="element.artist.name"/>
                                    </dsp:a>
                                </li>
                            </dsp:oparam>
                            <dsp:oparam name="empty">
                                No songs...
                            </dsp:oparam>
                        </dsp:droplet>
                    </ul>


                    <!-- *** End real content *** -->

                </font>
            </td>
        </tr>
    </table>
    </BODY>
    </HTML>
</dsp:page>
