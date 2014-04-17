/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import static Connection.test.currentCon;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * SELECT F.CourtID,F.CourtNo,F.Sports,B.Name FROM `facility` F,`building` B WHERE F.BuildingID = B.BuildingID 
 */
@WebServlet("/test2")
public class test2 extends HttpServlet {

    static Connection currentCon = null;
    static ResultSet rs = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<returnDate> List = new ArrayList<returnDate>();
        Statement stmt = null;
        String searchQuery = "";
        System.out.println(request.getParameter("datepicker"));
        //-Process the date from Post-----------------------------
        String requestDate = request.getParameter("datepicker");
        String[] requestDateElement = requestDate.split("/"); //Splits the Date into date, month, year
        Calendar requestCal = Calendar.getInstance();
        requestCal.clear();
        requestCal.set(Integer.parseInt(requestDateElement[2]), Integer.parseInt(requestDateElement[0]) - 1, Integer.parseInt(requestDateElement[1]));

        //-Calulate the starting Sunday and ending Saturday of the week------------------------
        Calendar c = Calendar.getInstance();
        c.setWeekDate(Integer.parseInt(requestDateElement[2]), requestCal.get(Calendar.WEEK_OF_YEAR), 1); //(yearofWeek,WeekinYear,dayofWeek)
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String r1 = df.format(c.getTime()); //The first Sunday (range 1)
        c.add(Calendar.DATE, 6); //Add 6 days to the sunday
        String r2 = df.format(c.getTime()); //The last Saturday (range 2)
        
        //-Varibles to compute timeslot and number of hours------------------
        int startTime = 0, endTime = 0, slot = 0, numHrs = 0;
        Date ans = null;
        //-------------------------------------------------------------------
        String sport = request.getParameter("Facility");
        int courtno = Integer.parseInt((request.getParameter("CourtNo")));
        int BuildingID = Integer.parseInt((request.getParameter("Building")));
        
        searchQuery = "select * from bookings where date between '"+r1+"' and '"+r2+"' and courtID in (Select f.courtID from `facility` f WHERE f.BuildingID='"+BuildingID+"' and f.sports='"+sport+"' and f.courtNo = '"+courtno+"')" ;
         System.out.println(searchQuery);

        try {
            //connecting to the DB--------------------------
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            //----------------------------------------------
            while(rs.next()){ //While resultset still has tuples
            
            ans = rs.getDate("Date"); startTime = rs.getInt("StartTime"); endTime = rs.getInt("EndTime");
            System.out.println(ans + " " + startTime + " " + endTime);
            //----------------------------------------------------------------------------------------------
            
            slot = (startTime-900)/100;  numHrs = (endTime - startTime)/100;
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(ans);
            System.out.println(cal.get(Calendar.WEEK_OF_YEAR));
            
            
            List.add(new returnDate(ans.getDay(), cal.get(Calendar.DATE), cal.get(Calendar.MONTH), cal.get(Calendar.YEAR),slot,numHrs,r1,r2));
            }


            currentCon.close();

        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }








        //send Json to Jsp------------------------------------------------------
        String json = new Gson().toJson(List);
        System.out.println(json);
        write(response, json);
    }

    private void write(HttpServletResponse response, String json) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
