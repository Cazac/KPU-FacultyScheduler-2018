/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kpu.fs.alpha;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Zac Laptop
 */
public class KPUFStest2 {
    
    public static void main(String[] args) 
    {
            javax.swing.SwingUtilities.invokeLater(new Runnable() 
            {
                public void run() {
                {
                    ArrayList<Main_Course> courseList = new ArrayList<>();
                    
                    try
                    {
                        String Query = "SELECT * FROM Course";
                        ResultSet result = Data_Update.ConncetToDatabase(Query);
                       
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
                            courseList.add(course);
                        }
                    }
                    catch(SQLException e)
                    {
                        JOptionPane.showMessageDialog(null, e);
                    }
                    
                    int counter = 0;
                    while (courseList.size() > counter) 
                    {      
                        
                        Main_Course course = new Main_Course();
                        course = courseList.get(counter);
                        
                        System.out.println(course.getCourseID());
                        
                        counter++;
                    }

                }
            }
        });
    }
}
        
