/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import Connection.Tools;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

@WebServlet("/GetEle")
public class QueryElement extends HttpServlet {
    private static final int Courts   = 1;
    private static final int Users    = 2;
    private static final int Booking  = 3;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        ArrayList List = new ArrayList(); int id=0; int court=0; String sport="";
        int mode = Integer.parseInt(request.getParameter("mode"));
        int state = Integer.parseInt(request.getParameter("RdyState"));
        if(state==2){ id = Integer.parseInt((request.getParameter("Building")));}
        if(state==3){id = Integer.parseInt((request.getParameter("Building")));court = Integer.parseInt((request.getParameter("CourtNo")));sport = request.getParameter("Facility");}
        System.out.println(state);
        Tools temp = new Tools();
        switch(mode){
            case 1:break;
            //case 2:break;
            case 3:
                if(state==1){List = temp.fillDropList(1,0,"nothing");break;} 
                if(state==2){List = temp.fillDropList(2, id,"nothing");break;}
                if(state==3){List = temp.fillDropList(3, id,sport);break;}
        }
        
        
        //send Json to Jsp------------------------------------------------------
        String json = new Gson().toJson(List );
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
