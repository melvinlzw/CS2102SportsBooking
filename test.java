/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

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

@WebServlet("/test")
public class test extends HttpServlet {
    static Connection currentCon = null;
    static ResultSet rs = null;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        ArrayList<returnDate> List = new ArrayList<returnDate>();
        Statement stmt = null;
        String searchQuery = "";
System.out.println("IN!!!");
searchQuery = "select date from bookings";
       

        try {
            //connecting to the DB
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
          rs.next();
          Date ans = rs.getDate("Date");
          System.out.println(ans);
          Calendar cal = Calendar.getInstance();
          cal.setTime(ans);
            System.out.println(cal.get(Calendar.WEEK_OF_YEAR));
            List.add(new returnDate(ans.getDay(),cal.get(Calendar.DATE),cal.get(Calendar.MONTH),cal.get(Calendar.YEAR),0,0,"",""));
            
            Calendar c = Calendar.getInstance();

// Set the calendar to monday of the current week
c.setWeekDate(2013,41,1);

// Print dates of the current week starting on Monday
DateFormat df = new SimpleDateFormat("EEE dd/MM/yyyy");
for (int i = 0; i < 7; i++) {
    System.out.println(df.format(c.getTime()));
    c.add(Calendar.DATE, 1);
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
