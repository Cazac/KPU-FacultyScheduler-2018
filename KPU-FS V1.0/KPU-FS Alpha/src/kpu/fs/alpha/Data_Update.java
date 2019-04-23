package kpu.fs.alpha;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class Data_Update 
{

    //Connection Method
    static public ResultSet ConncetToDatabase(String DatabaseQuery) 
    {
        String DatabaseID = "jdbc:mysql://kpu-fs.cd4sls0dpuge.us-east-2.rds.amazonaws.com";
        String DatabasePort = ":3309";
        //String DatabaseName = "/KPUClassScheduler"; 
        String DatabaseName = "/KPUFSDatabase"; 
        String DatabaseUser = "MasterLoginID";
        String DatabasePass = "Thisisapassword";
        
        try
        {
            //Create a SQL Connection, Connect the Statement and Create a Query
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = DriverManager.getConnection(DatabaseID + DatabasePort + DatabaseName, DatabaseUser, DatabasePass);
            Statement stmt = connect.createStatement();
            
            ResultSet result = stmt.executeQuery(DatabaseQuery);
            return result;
        }
        catch(ClassNotFoundException | SQLException e)
        {
            JOptionPane.showMessageDialog(null, e);
            ResultSet result = null;
            return result;
        }
    }
    
    static public void InsertDatabase(String DatabaseInsert) 
    {
        String DatabaseID = "jdbc:mysql://kpu-fs.cd4sls0dpuge.us-east-2.rds.amazonaws.com";
        String DatabasePort = ":3309";
        //String DatabaseName = "/KPUClassScheduler";
        String DatabaseName = "/KPUFSDatabase"; 
        String DatabaseUser = "MasterLoginID";
        String DatabasePass = "Thisisapassword";
        
        try
        {
            //Create a SQL Connection, Connect the Statement and Create a Query
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = DriverManager.getConnection(DatabaseID + DatabasePort + DatabaseName, DatabaseUser, DatabasePass);
            Statement stmt = connect.createStatement();
            
            stmt.executeUpdate(DatabaseInsert);
        }
        catch(ClassNotFoundException | SQLException e)
        {
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    //Create an Arraylist for datasets
    ArrayList<Main_Course> courseListBase = new ArrayList<>();
    ArrayList<Main_Course> courseListSort = new ArrayList<>();
    
    ArrayList<Main_Course> teacherListBase = new ArrayList<>();
    ArrayList<Main_Course> teacherListSort = new ArrayList<>();
    
    ArrayList<Main_Course> semesterListBase = new ArrayList<>();
    ArrayList<Main_Course> semesterListSort = new ArrayList<>();
    
    ArrayList<Main_Course> locationListBase = new ArrayList<>();
    ArrayList<Main_Course> locationListSort = new ArrayList<>();
    
    public void updateCourseDataBase() 
    {    
        try
        {
            //Database SQL query and execution 
            String Query = "SELECT * FROM Course";
            ResultSet result = ConncetToDatabase(Query);

            //Loop for taking data from SQL to object
            while (result.next()) 
            {
                //Create object
                Main_Course course = new Main_Course();

                //Add data to object
                course.setCourseID(result.getString(1));
                course.setCourseName(result.getString(2));
                course.setYearToBeTaken(result.getString(3));
                course.setProgram(result.getString(4));
                course.setComputersNeeded(result.getString(5));

                //Add object to List
                courseListBase.add(course);
            }
        }
        catch(SQLException e) { JOptionPane.showMessageDialog(null, e); }
    }
    
    public ArrayList<Main_Course> getDataListBase() {
        return courseListBase;
    }
   
    public void updateDataListSort() {
        ///
    }
    
    public ArrayList<Main_Course> getDataListSort() {
         return courseListSort;
    }
    
}
