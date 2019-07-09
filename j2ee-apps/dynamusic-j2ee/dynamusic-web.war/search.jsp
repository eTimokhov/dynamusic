<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/dynamusic/SongSearchFormHandler"/>
<dsp:page>
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
                    <i> Please enter the name (or first few characters) of the song you're looking for: </i>
                    <br>

                    <dsp:form action="<%=request.getRequestURI()%>" method="post">
                        <table>
                            <tr>
                                <td>
                                    <dsp:input bean="SongSearchFormHandler.keywordInput" type="text" size="40"/>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <dsp:input bean="SongSearchFormHandler.successURL" type="hidden"
                                               value="searchResults.jsp"/>&nbsp;
                                    <p><dsp:input bean="SongSearchFormHandler.search" type="submit" value="search"/></p>
                                </td>
                            </tr>
                        </table>
                    </dsp:form>
                </font>
            </td>
        </tr>


        <!-- *** End real content *** -->

        </td>
        </tr>
    </table>
    </BODY>
    </HTML>
</dsp:page>
