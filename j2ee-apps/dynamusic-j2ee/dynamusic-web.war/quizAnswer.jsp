<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/dynamusic/QuizFormHandler"/>
<dsp:page>
    <HTML>
    <HEAD>
        <TITLE>Quiz Answer</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Quiz Answer"/>
    </dsp:include>
    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <dsp:include page="common/sidebar.jsp"/>
            </td>
            <!-- Page Body -->
            <td valign="top">
                <dsp:droplet name="Switch">
                    <dsp:param name="value" bean="QuizFormHandler.correctAnswer"/>
                    <dsp:oparam name="false">
                        <p>You're wrong. Correct answer: <dsp:valueof bean="QuizFormHandler.answer"/></p>
                    </dsp:oparam>
                    <dsp:oparam name="true">
                        <p>You're right!</p>
                    </dsp:oparam>
                </dsp:droplet>
            </td>
        </tr>
        <!-- *** End real content *** -->
    </table>
    </BODY>
    </HTML>
</dsp:page>
