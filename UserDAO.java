package Connection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDAO
{
static Connection currentCon = null;
static ResultSet rs = null;
public static UserBean login(UserBean bean)
{
Statement stmt = null;
String username = bean.getUsername();
String password = bean.getPassword();
String searchQuery = "select * from account where username='" + username + "' AND binary password='" + password + "'";

try
{
//connecting to the DB
currentCon = ConnectionManager.getConnection();
stmt=currentCon.createStatement();
rs = stmt.executeQuery(searchQuery);
boolean userExists = rs.next();

if (!userExists)
{
System.out.println("Username/Password entered is Incorrect or User does not Exists.");
bean.setValid(false);
}
else if (userExists)
{
bean.setValid(true);
String nric = null;
int quota = 0;
String domain = null;
String searchDomain = "select domain from account where username = '" +username + "'";
rs = stmt.executeQuery(searchDomain);
while (rs.next()) {
    domain = rs.getString(1);
}
bean.setDomain(domain);
String name = null;
String searchName = "select name from users where matric='" + username + "'";
rs = stmt.executeQuery(searchName);
while (rs.next()) {
    name = rs.getString(1);
}
bean.setName(name);
String searchNric = "select Nric from users where matric='" + username + "'";
rs=stmt.executeQuery(searchNric);
while(rs.next()) {
    nric=rs.getString(1);
}
bean.setNric(nric);
String searchQuota = "select quota from account where username='" + username +"'";
rs = stmt.executeQuery(searchQuota);
while (rs.next()) {
    quota = (Integer)rs.getObject(1);
}
bean.setQuota(quota);
}

}
catch (Exception ex)
{
System.out.println("Log In failed: An Exception has occurred! " + ex);
}
return bean;
}
}