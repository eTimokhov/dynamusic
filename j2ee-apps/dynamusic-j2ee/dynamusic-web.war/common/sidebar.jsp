<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<!-------------------------------------------------------------
Dynamusic Site Mockup

Sidebar

Page fragment displaying the sidebar, common to all pages.

------------------------------------------------------------->
<dsp:page>
    <font face="Verdana,Geneva,Arial" size="-1" color="steelblue">
        <b>
            <a href="home.jsp">Home</a><br>
            &nbsp;<br>
            <a href="artists.jsp">Artists</a> <br>
            <a href="venues.jsp">Venues</a> <br>
            <a href="search.jsp">Search</a> <br>
            &nbsp;<br>
            <dsp:droplet name="Switch">
                <dsp:param name="value" bean="Profile.transient"/>
                <dsp:oparam name="true">
                    <a href="login.jsp">Sign in</a><br>
                </dsp:oparam>
                <dsp:oparam name="false">
                    <a href="updateProfile.jsp">Profile</a><br>
                    <a href="logout.jsp">Log out</a><br>
                </dsp:oparam>
            </dsp:droplet>
            &nbsp;<br>
        </b>
    </font>
</dsp:page>
 

