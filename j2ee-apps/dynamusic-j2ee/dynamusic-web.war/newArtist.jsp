<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/dynamusic/ArtistFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<dsp:page>

    <!-------------------------------------------------------------
    Dynamusic Site Mockup

    NEW ARTIST

    Add description of an artist and her/his list of albums.

    ------------------------------------------------------------->


    <HTML>
    <HEAD>
        <TITLE>Dynamusic Artist</TITLE>
    </HEAD>
    <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="New Artist"/>
    </dsp:include>
    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <dsp:include page="common/sidebar.jsp">
                </dsp:include>
            </td>
            <!-- Page Body -->
            <td valign="top">
                <font face="Verdana,Geneva,Arial" size="-1">

                    <!-- *** Start page content *** -->
                    <dsp:form action="<%= request.getRequestURI() %>">
                        <dsp:droplet name="ErrorMessageForEach">
                            <dsp:oparam name="output">
                                <dsp:valueof param="message"/><br>
                            </dsp:oparam>
                        </dsp:droplet>
                        <table cellpadding="10">
                            <tr>
                                <td valign="middle">
                                    Artist Name:
                                </td>
                                <td valign="middle">
                                    <!-- DATA(1) Artist name -->
                                    <dsp:input bean="ArtistFormHandler.value.name" type="text" required="true"/> &nbsp;
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle">
                                    Image Path:
                                </td>
                                <td valign="middle">
                                    <!-- DATA(2) Image path -->
                                    <dsp:input bean="ArtistFormHandler.value.photoURL" type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    Description:
                                </td>
                                <td valign="top">
                                    <!-- Data(3) Artist description -->
                                    <dsp:textarea bean="ArtistFormHandler.value.description" cols="60" rows="10"
                                                  wrap="SOFT" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <dsp:input bean="ArtistFormHandler.createSuccessURL" type="hidden" value="artists.jsp"/>
                                    <dsp:input bean="ArtistFormHandler.create" type="submit" value="Create artist entry"/>
                                </td>
                            </tr>


                            </tr>
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

