<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <link href="table.css" rel="stylesheet" type="text/css" />
        <script src="Javascript/jquery-1.10.2.js"></script>
        <script src="Javascript/Bookingtable.js"></script>
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

    <body>
        <%-- Modes=> Courts:1 Users:2 Booking:3 --%>
        <form id="initalise">
            <input type="hidden" name="mode" value="1">
            <input type="hidden" name="RdyState" value="1" id="RdyS1">
        </form>
        <%-- RdyState=> 1:DropList not filled 2: Rdy--%>
        

        <form id="getSlots">
            Choose the Building:
            <select id="BuildingName" name = "buildingpicker"></select>
            Choose the Court:
            <select id="CourtID" name = "courtpicker"></select><br>
            Choose a date to View timeslots: 
            <input type="text" id="datepicker" name="datepicker" />
        </form>
        <br></br>
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
            <form id="DayofTheWeek">
                DayofWeek:  <h2 id="Day"></h2>
                Date:  <h2 id="Date"></h2>
                Month: <h2 id="Month"></h2>
                Year: <h2 id="Year"></h2>
                <input type="button" id="Getdate" value="Start"></input>
            </form>
        </div>


    </body>
</html>