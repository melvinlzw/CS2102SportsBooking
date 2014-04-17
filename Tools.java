package Connection;

import Connection.CourtsRow;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Tools {

    static Connection currentCon = null;
    static ResultSet rs = null;

    public static ArrayList fillDropList(int step,int id,String sport) {
        Statement stmt = null;
        String searchQuery = "";
        switch(step){
            case 1:searchQuery = "select name from Building";break;
            case 2:searchQuery = "select distinct Sports from Facility where BuildingID ="+id;break;
            case 3:searchQuery = "select courtno from facility where BuildingID='"+id+"' and Sports ='"+sport+"'";break;
        }
        System.out.println(searchQuery);
        ArrayList List = new ArrayList();
        int i = 0;
        try {
            //connecting to the DB
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {
                List.add(rs.getString(1));
            }
            currentCon.close();

        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }
        
        return List;
    }
    
    public static ArrayList getCourtInfo(String Building, String Filter){
        Statement stmt = null;
        String searchQuery = "SELECT F.CourtID,F.CourtNo,F.Sports,B.Name "
                + "FROM `facility` F,`building` B "
                + "WHERE F.BuildingID = B.BuildingID  AND B.Name = '"+ Building +"'";
        if(!Filter.equals("Choose Sports Filter")){
            searchQuery += "And F.Sports='"+ Filter +"'";
        }
        
        
        ArrayList<CourtsRow> List = new ArrayList<CourtsRow>();
        int i = 0;
        try {
            //connecting to the DB
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {
                CourtsRow newElement = new CourtsRow();
                newElement.setCourtID(rs.getString(1));
                newElement.setCourtNo(rs.getString(2));
                newElement.setSports(rs.getString(3));
                newElement.setBuildingName(rs.getString(4));
                List.add(newElement);
            }
            currentCon.close();

        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }
        return List;
    }
}
