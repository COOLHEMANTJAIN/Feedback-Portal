package codes;
import java.sql.*;

  public class Mysql3{
   // JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/project";

   //  Database credentials
   static final String USER = "root";
   static final String PASS = "hj143coo";
 
   public static String feedback="";
   
   public void mai(String query,String find) {
   Connection conn = null;
   Statement stmt = null;
   //String correctpass="degdthgjsdgasyudgasyfgafghjgdafgayshdfgafasuyfgyfgajfba";
   try{
      //STEP 2: Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      //STEP 3: Open a connection
      System.out.println("Connecting to database...");
      conn = DriverManager.getConnection(DB_URL,USER,PASS);

      //STEP 4: Execute a query
      System.out.println("Creating statement...");
      stmt = conn.createStatement();
      String sql=query;
      //sql = "SELECT feedbackname FROM feedbackinfo where student='"+user1+"'";
      ResultSet rs = stmt.executeQuery(sql);
	//conn.commit();

      //STEP 5: Extract data from result setfhf
      int i=0;
	//if(!rs.next())
    	  //c="jdbfhjckjsdhjdfhfbhdsfhabdhjvdbvhjdsbhjvbsdhfbshkdfsdfksdhkvsdhvbhvbhsd";
    	  i=0;
      while(rs.next()){
         //Retrieve by column name
         //int id  = rs.getInt("id");
         //int age = rs.getInt("age");
         feedback = rs.getString(find);
         
         System.out.println(feedback);
         break;
         //String last = rs.getString("last");

         //Display values
         //System.out.print("ID: " + id);
         //System.out.print(", Age: " + age);
         //System.out.print(", First: " + first);
         //System.out.println(", Last: " + last);
      }
      //System.out.println(correctpass);*/
      //STEP 6: Clean-up environment
      rs.close();
      stmt.close();
      conn.close();
      
      
      
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            stmt.close();
      }catch(SQLException se2){
      }// nothing we can do
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
   System.out.println("Goodbye!");
}//end main
}//end FirstExample
