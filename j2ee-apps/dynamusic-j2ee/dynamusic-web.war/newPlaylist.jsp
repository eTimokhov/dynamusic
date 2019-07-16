<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/dynamusic/PlaylistFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<dsp:page>
    <HTML>
    <HEAD>
        <TITLE>New playlist</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="New playlist"/>
    </dsp:include>
    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <dsp:include page="common/sidebar.jsp"/>
            </td>
            <!-- Page Body -->
            <td valign="top">
                <dsp:form action="<%= request.getRequestURI() %>">
                    <dsp:droplet name="ErrorMessageForEach">
                        <dsp:oparam name="output">
                            <dsp:valueof param="message"/><br>
                        </dsp:oparam>
                    </dsp:droplet>
                    Name:<br>
                    <dsp:input bean="PlaylistFormHandler.value.name" required="true"/><br><br>
                    Description:<br>
                    <dsp:textarea bean="PlaylistFormHandler.value.description"/><br><br>
                    <dsp:input bean="PlaylistFormHandler.value.publish" type="checkbox">Publish</dsp:input><br><br>

                    <dsp:input bean="PlaylistFormHandler.createSuccessURL" type="hidden" value="playlists.jsp"/>
                    <dsp:input bean="PlaylistFormHandler.userId" type="hidden" beanvalue="Profile.id"/>
                    <dsp:input bean="PlaylistFormHandler.create" type="submit" value="Create"/>
                </dsp:form>
            </td>
        </tr>


        <!-- *** End real content *** -->
    </table>
    </BODY>
    </HTML>
</dsp:page>
