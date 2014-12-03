package codes;
import java.sql.*;

   public class Update
   {
      // JDBC driver name and database URL
      static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      static final String DB_URL = "jdbc:mysql://localhost/feedback";

      //  Database credentials
      static final String USER = "root";
      static final String PASS = "hj143coo";
    
      public static String feedback="";
      
      public void setupdates(String query) 
      {
         Connection conn = null;
         Statement stmt = null;
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
            String sql=query;
            
            stmt.executeUpdate(sql);
            
            System.out.println("Inserted records into the table...");

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
                  conn.close();
            }
            catch(SQLException se)
            {
            }// do nothing
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
}