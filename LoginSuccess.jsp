<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="Connection.UserBean"
         import="java.util.*"
         %>

<html>
    <head>
        <meta http-equiv="Content-Type" 
              content="text/html; charset=windows-1256">
        <title>NUSPORTSYS - Welcome</title>
        <link href="table.css" rel="stylesheet" type="text/css" />
        <script src="Javascript/jquery-1.10.2.js"></script>
        <script src="Javascript/BookingPage.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css" /> 
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
        <script>

            $(function() {
                $("#datepicker").datepicker({
                    showWeek: true,
                    firstDay: 1
                });
            });
        </script>
        
    </head>
    <%-- Modes=> Courts:1 Users:2 Booking:3 --%>
        <form id="initalise">
            <input type="hidden" name="mode" value="3">
            <input type="hidden" name="RdyState" value="1" id="RdyS1">
        </form>
        <%-- RdyState=> 1:DropList not filled 2: Rdy--%>
        
    <body topmargin="0" leftmargin="0" position:absolute min-width="600px" max-width="600px" table-layout:fixed>
        <table bgcolor="#ff6600" border="0" cellpadding="0" cellspacing="0" >
            <col width="400">
            <tr>
                <td rowspan="2" bgcolor="#FF6600"><a href="http://www.nus.edu.sg/" target="_blank"><img src="https://aces01.nus.edu.sg/uasonline/images/nus.gif" width="139" height="78" border="0"></a>
                </td>
                <td><center><img src="sportsbooking.bmp" height ='80' ></center></td>

    </tr>
</table>
<table width="890px" border="0">
    <tr align="right"><td>
      <!--      <font size="2">Welcome,
           <!--%UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));%>
            <!--%=currentUser.getName().toUpperCase()%>
            (<!--%=currentUser.getDomain()%>)</font> 
            <font size="1"><br> !-->
            <% // get client locale
                java.util.Locale locale = request.getLocale();

                // get Dateformat for client's locale
                java.text.DateFormat dateFormat =
                        java.text.DateFormat.getDateTimeInstance(
                        java.text.DateFormat.LONG,
                        java.text.DateFormat.LONG, locale);
            %>
            <%=dateFormat.format(new java.util.Date())%>
            </font>
        </td>
    </tr>
</table>

<table style="float:left"width="20%" height="30%" border="0">
    <tr><td></td></tr>
    <tr><td><img src="bullet.bmp" width="7"> <font size="2"color="blue"><u>Book Facilities</font></u></td></tr>
<tr><td><img src="bullet.bmp" width="7"> <font size="2"color="blue"><u>Check Schedule</font></u></td></tr>
<tr><td><img src="bullet.bmp" width="7"> <font size="2"color="blue"><u>Manage Booking</font></u></td></tr>
<tr><td><img src="bullet.bmp" width="7"> <font size="2"color="blue"><u>Rules And Regulations</font></u></td></tr>
<tr><td><img src="bullet.bmp" width="7"> <font size="2"color="blue"><u>Logout</font></u></td></tr>
</table>
<table border="0"  ><tr><td><font color="#191970" face="Arial" size="4">Profile</font></td></tr></table>
<br><table height="60" border="0">
    <tr><td><font size="3"><b>Name:</b></font></td><td><font size="3"> <!--%=currentUser.getName()%!--></font></td>
        <td><font size="3"><b>NRIC:</b></font></td><td><font size="3"><!--%=currentUser.getNric()%!--></font></td></tr>
    <tr><td><font size="3"><b>Domain:</b></font></td><td><font size="3"><!--%=currentUser.getDomain()%!--></font></td>
        <td><font size="3"><b>Quota:</b></font></td><td><font size="3"><!--%=currentUser.getQuota()%!--></font></td></tr>   
</table>
<br><br>
<table border="0" ><tr><td><font color="#191970" face="Arial" size="4">Make New Booking</font></td></tr></table>
<table  height="100" border="0">
    <form id="getSlots">
        <input type="hidden" name="mode" value="3">
        <input type="hidden" name="RdyState" value="1" id="RdyS2">
        
        <tr><td>Location (Building):</td>
            <td><select id="BuildingName" name="Building">
                    <option value="0">wtf</option>
                    <option value="1">Sports & Recreation Centre</option>
                    <option value="2">University Town</option>
                    <option value="3">Bukit Timah Campus</option>        
                </select>
            Facility:
            <select id="FacilityID" name="Facility">
                <option value="1">Choose Sports</option>
                </select>
            Court Num:
            <select id="CourtNo" name="CourtNo">
                <option value="0">Choose Court</option>
                </select>
            
            </td></tr>
            </td></tr>
        <tr><td>Date (dd/mm/yy):</td>
            <td><input type="text" id="datepicker" name="datepicker" />
                Start Time:
                <select id="Starttime" name="Starttime">
                <option value="0">09.00</option>
                <option value="0">10.00</option>
                <option value="0">11.00</option>
                <option value="0">12.00</option>
                <option value="0">13.00</option>
                <option value="0">14.00</option>
                <option value="0">15.00</option>
                <option value="0">16.00</option>
                <option value="0">17.00</option>
                <option value="0">18.00</option>
                <option value="0">19.00</option>
                </select>
                End Time:
                <select id="Endtime" name="Endtime">
                <option value="0">10.00</option>
                <option value="0">11.00</option>
                <option value="0">12.00</option>
                <option value="0">13.00</option>
                <option value="0">14.00</option>
                <option value="0">15.00</option>
                <option value="0">16.00</option>
                <option value="0">17.00</option>
                <option value="0">18.00</option>
                <option value="0">19.00</option>
                <option value="0">20.00</option>
                
                </select>
            </td>
        </tr>
        

    </form>
</table>
        <div id="TableViewer">
            <table class="TableDays" border="1" cellpadding="0" cellspacing="0">
                <tr>
                    <th class="Days" >Sunday<div id="D0"></div></th>
                    <th class="Days" >Monday<div id="D1"></div></th>
                    <th class="Days" >Tuesday<div id="D2"></div></th>
                    <th class="Days" >Wednesday<div id="D3"></div></th>
                    <th class="Days" >Thursday<div id="D4"></div></th>
                    <th class="Days" >Friday<div id="D5"></div></th>
                    <th class="Days" >Saturday<div id="D6"></div></th>
                </tr>
            </table>
            <table class="TableTime"  border="1" cellspacing="0" cellpadding="0">
                <tr><th class="Time" >09.00 - 10.00</th></tr>
                <tr><th class="Time" >10.00 - 11.00</th></tr>
                <tr><th class="Time" >11.00 - 12.00</th></tr>
                <tr><th class="Time" >12.00 - 13.00</th></tr>
                <tr><th class="Time" >13.00 - 14.00</th></tr>
                <tr><th class="Time" >14.00 - 15.00</th></tr>
                <tr><th class="Time" >15.00 - 16.00</th></tr>
                <tr><th class="Time" >16.00 - 17.00</th></tr>
                <tr><th class="Time" >17.00 - 18.00</th></tr>
                <tr><th class="Time" >19.00 - 20.00</th></tr>
            </table>
            <table id="statustable" class="statstable" border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <th id="A00" class="Available">Available</th>
                    <th id="A10" class="Available">Available</th>
                    <th id="A20" class="Available">Available</th>
                    <th id="A30" class="Available">Available</th>
                    <th id="A40" class="Available">Available</th>
                    <th id="A50" class="Available">Available</th>
                    <th id="A60" class="Available">Available</th>
                </tr>
                <tr>
                    <th id="A01" class="Available">Available</th>
                    <th id="A11" class="Available">Available</th>
                    <th id="A21" class="Available">Available</th>
                    <th id="A31" class="Available">Available</th>
                    <th id="A41" class="Available">Available</th>
                    <th id="A51" class="Available">Available</th>
                    <th id="A61" class="Available">Available</th>
                </tr>
                <tr>
                    <th id="A02" class="Available">Available</th>
                    <th id="A12" class="Available">Available</th>
                    <th id="A22" class="Available">Available</th>
                    <th id="A32" class="Available">Available</th>
                    <th id="A42" class="Available">Available</th>
                    <th id="A52" class="Available">Available</th>
                    <th id="A62" class="Available">Available</th>
                </tr>
                <tr>
                    <th id="A03" class="Available">Available</th>
                    <th id="A13" class="Available">Available</th>
                    <th id="A23" class="Available">Available</th>
                    <th id="A33" class="Available">Available</th>
                    <th id="A43" class="Available">Available</th>
                    <th id="A53" class="Available">Available</th>
                    <th id="A63" class="Available">Available</th>
                </tr>
                <tr>
                    <th id="A04" class="Available">Available</th>
                    <th id="A14" class="Available">Available</th>
                    <th id="A24" class="Available">Available</th>
                    <th id="A34" class="Available">Available</th>
                    <th id="A44" class="Available">Available</th>
                    <th id="A54" class="Available">Available</th>
                    <th id="A64" class="Available">Available</th>
                </tr>
                <tr>
                    <th id="A05" class="Available">Available</th>
                    <th id="A15" class="Available">Available</th>
                    <th id="A25" class="Available">Available</th>
                    <th id="A35" class="Available">Available</th>
                    <th id="A45" class="Available">Available</th>
                    <th id="A55" class="Available">Available</th>
                    <th id="A65" class="Available">Available</th>
                </tr>
                <tr>
                    <th id="A06" class="Available">Available</th>
                    <th id="A16" class="Available">Available</th>
                    <th id="A26" class="Available">Available</th>
                    <th id="A36" class="Available">Available</th>
                    <th id="A46" class="Available">Available</th>
                    <th id="A56" class="Available">Available</th>
                    <th id="A66" class="Available">Available</th>
                </tr>
                <tr>
                    <th id="A07" class="Available">Available</th>
                    <th id="A17" class="Available">Available</th>
                    <th id="A27" class="Available">Available</th>
                    <th id="A37" class="Available">Available</th>
                    <th id="A47" class="Available">Available</th>
                    <th id="A57" class="Available">Available</th>
                    <th id="A67" class="Available">Available</th>
                </tr>
                <tr>
                    <th id="A08" class="Available">Available</th>
                    <th id="A18" class="Available">Available</th>
                    <th id="A28" class="Available">Available</th>
                    <th id="A38" class="Available">Available</th>
                    <th id="A48" class="Available">Available</th>
                    <th id="A58" class="Available">Available</th>
                    <th id="A68" class="Available">Available</th>
                </tr>
                <tr>
                    <th id="A09" class="Available">Available</th>
                    <th id="A19" class="Available">Available</th>
                    <th id="A29" class="Available">Available</th>
                    <th id="A39" class="Available">Available</th>
                    <th id="A49" class="Available">Available</th>
                    <th id="A59" class="Available">Available</th>
                    <th id="A69" class="Available">Available</th>
                </tr>


            </table>
        </div>








<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>








<table top="300px" border="0" height="150" cellspacing="0" cellpadding="0">
    <tr>
        <td colspan="6" class="copyright"><font size="2">Copyright 2013 Group 31 CS2102. All Rights Reserved.<br>
            <a href="http://www.nus.edu.sg/privacy"><font size="2">Privacy</a> | 
            <a href="http://www.nus.edu.sg/copyright.htm">Copyright</a>| 
            <a href="http://www.nus.edu.sg/non-discrimination">Non-discrimination</font>
            </a></td>
    </tr>
</table>

</body>
</html>