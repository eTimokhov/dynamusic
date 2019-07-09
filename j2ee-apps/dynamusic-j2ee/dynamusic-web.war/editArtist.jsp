<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/dynamusic/ArtistFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<dsp:page>

    <!-------------------------------------------------------------
    Dynamusic Site DAF Site Mockup

    EDIT ARTIST

    Modify description of an artist and her/his list of albums.

    ------------------------------------------------------------->


    <HTML>
    <HEAD>
        <TITLE>Dynamusic Artist</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Edit Artist"/>
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
                    <dsp:setvalue bean="ArtistFormHandler.repositoryId" paramvalue="artistId"/>
                    <dsp:form action="<%= request.getRequestURI() %>">
                        <dsp:droplet name="ErrorMessageForEach">
                            <dsp:oparam name="output">
                                <dsp:valueof param="message"/><br>
                            </dsp:oparam>
                        </dsp:droplet>
                        <table cellpadding="10">
                            <tr>
                                <td valign="middle" align="right">
                                    Artist Name
                                </td>
                                <td valign="middle">
                                    <font face="Courier New" size="-1">
                                        <dsp:input bean="ArtistFormHandler.value.name" type="text" size="30"
                                                   required="true"/>
                                    </font>
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle" align="right">
                                    Photo URL
                                </td>
                                <td valign="middle">
                                    <font face="Courier New" size="-1">
                                        <dsp:input bean="ArtistFormHandler.value.photoURL" type="text" size="30"/>
                                    </font>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" align="right">
                                    Description
                                </td>
                                <td valign="top">
                                    <dsp:textarea bean="ArtistFormHandler.value.description" cols="60" rows="10"
                                                  wrap="SOFT"/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <dsp:input bean="ArtistFormHandler.repositoryId" type="hidden" paramvalue="artistId"
                                               name="artistId"/>
                                    <dsp:input bean="ArtistFormHandler.updateSuccessURL" type="hidden"
                                               value="artists.jsp"/>
                                    <dsp:input bean="ArtistFormHandler.deleteSuccessURL" type="hidden"
                                               value="artists.jsp"/>
                                    <dsp:input bean="ArtistFormHandler.update" type="submit" value="Save changes"/>
                                    <dsp:input bean="ArtistFormHandler.delete" type="submit"
                                               value="Delete this artist"/>
                                </td>
                        </table>
                    </dsp:form>

                    <!-- *** End real content *** -->

                </font>
            </td>
        </tr>
    </table>
    </BODY>
    </HTML>

</dsp:page>


