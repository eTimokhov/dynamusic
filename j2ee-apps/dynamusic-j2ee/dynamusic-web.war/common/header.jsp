<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<!-------------------------------------------------------------
Dynamusic Site Mockup

Header

Page fragment displaying the site's header, common to all
pages.

------------------------------------------------------------->

<dsp:page>
    <img src="images/Dynamusic.jpg">
    <table width="700" cellpadding="8">
        <tr>
            <td width="100"></td>
            <td>
                <!-- Header -->
                <font face="Verdana,Geneva,Arial" size="+3" color="midnightblue">
                    <dsp:valueof param="pagename"/>
                </font>
                <br>
                <hr size="8">
            </td>
        </tr>
    </table>
</dsp:page>