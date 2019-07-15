<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<dsp:importbean bean="/dynamusic/QuizFormHandler"/>
<dsp:page>
    <HTML>
    <HEAD>
        <TITLE>Quiz</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Quiz"/>
    </dsp:include>
    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <dsp:include page="common/sidebar.jsp"/>
            </td>
            <!-- Page Body -->
            <td valign="top">
                <dsp:form action="<%=request.getRequestURI()%>" method="post">
                    <dsp:droplet name="ErrorMessageForEach">
                        <dsp:oparam name="output">
                            <dsp:valueof param="message"/><br>
                        </dsp:oparam>
                    </dsp:droplet>
                    <table>
                        <tr>
                            <td>
                                Question:<br>
                                <dsp:valueof bean="QuizFormHandler.question"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Answer:<br>
                                <dsp:input bean="QuizFormHandler.userAnswer" type="text" size="40" required="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <dsp:input bean="QuizFormHandler.validateSuccessURL" type="hidden" value="quizAnswer.jsp"/>&nbsp;
                                <dsp:input bean="QuizFormHandler.cancel" type="submit" value="Cancel"/>
                                <dsp:input bean="QuizFormHandler.validate" type="submit" value="Sumbit"/>
                            </td>
                        </tr>
                    </table>
                </dsp:form>
            </td>
        </tr>


        <!-- *** End real content *** -->
    </table>
    </BODY>
    </HTML>
</dsp:page>
