<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
    <dsp:importbean bean="/dynamusic/SongSearchFormHandler"/>
    <!-------------------------------------------------------------
    Dynamusic Site Mockup

    SEARCH

    User can search for a song, using a fragment of its title.

    ------------------------------------------------------------->


    <HTML>
    <HEAD>
        <TITLE>Dynamusic Home</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Search"/>
    </dsp:include>
    </table>
    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <!-- (replace contents of this table cell by
                      dynamically including common/sidebar.html) -->
                <dsp:include page="common/sidebar.jsp"></dsp:include>
            </td>
            <!-- Page Body -->

            <td valign="top">
                <font face="Verdana,Geneva,Arial" size="-1">

                    <!-- *** Start page content *** -->

                    <i> Please enter the name (or first few characters) of the song you're looking for: </i>
                    <p>&nbsp;<br>

                        <form action="searchResults.html">
                            <table>
                                <tr>
                                    <td>
                                        <input type="text" size="40"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        &nbsp;
                    <p><input type="submit" value="search"/>
            </td>
        </tr>
        </form>


        <!-- *** End real content *** -->

        </font>
        </td>
        </tr>
    </table>
    </BODY>
    </HTML>
</dsp:page>
