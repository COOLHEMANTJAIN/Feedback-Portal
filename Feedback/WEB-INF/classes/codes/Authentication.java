package codes;
import java.sql.*;

 public class Authentication
 {
   // JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/feedback";

   //  Database credentials
   static final String USER = "root";
   static final String PASS = "hj143coo";
   
   public  int flag=0;
   public void authenticator(String user1,String pass1) 
   {
      Connection conn = null;
      Statement stmt = null;
      String correctpass="degdthgjsdgasyudgasyfgafghjgdafgayshdfgafasuyfgyfgajfba";//initialdefaultvalue
      try
      {
         //STEP 2: Register JDBC driver
         Class.forName("com.mysql.jdbc.Driver");

         //STEP 3: Open a connection
         System.out.println("Connecting to database...");
         conn = DriverManager.getConnection(DB_URL,USER,PASS);

         //STEP 4: Execute a query
         System.out.println("Creating statement...");
         stmt = conn.createStatement();
         String sql;
         sql = "SELECT password FROM studentdetails where sid ='"+user1+"'";
         System.out.println(sql);
         ResultSet rs = stmt.executeQuery(sql);

         while(rs.next())
         {
            correctpass = rs.getString("password");
            System.out.println(correctpass);
         }
         System.out.println(correctpass);
         //STEP 6: Clean-up environment
         rs.close();
         stmt.close();
         conn.close();
         if(correctpass.equals(pass1))
         {	  
            flag=1;
            //System.out.println("hr");
         }
         else
         {   
       	   flag=0;
         }    
      }
      catch(SQLException se)
      {
         //Handle errors for JDBC
         se.printStackTrace();
      }
      catch(Exception e)
      {
         //Handle errors for Class.forName
         e.printStackTrace();
      }
      finally
      {
         //finally block used to close resources
         try
         {
            if(stmt!=null)
               stmt.close();
         }
         catch(SQLException se2)
         {
         
         }// nothing we can do
         try
         {
            if(conn!=null)
               conn.close();
         }
         catch(SQLException se)
         {
            se.printStackTrace();
         }//end finally try
      }//end try
      System.out.println("Goodbye!");
   }//end main
}//end