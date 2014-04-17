/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * SELECT F.CourtID,F.CourtNo,F.Sports,B.Name FROM `facility` F,`building` B WHERE F.BuildingID = B.BuildingID 
 */
@WebServlet("/startEnd")
public class GetstartandEnd extends HttpServlet {

    static Connection currentCon = null;
    static ResultSet rs = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String> List = new ArrayList<String>();
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
        String dateString;
       
        for(int i=0; i<7;i++){
        dateString = df.format(c.getTime()); //The first Sunday (range 1)
        List.add(dateString);
        c.add(Calendar.DATE, 1); 
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
