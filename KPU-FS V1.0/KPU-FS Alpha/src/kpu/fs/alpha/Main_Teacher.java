package kpu.fs.alpha;

import java.util.ArrayList;

public class Main_Teacher {
    
    String KPUID;
    String FirstName;

    
    String LastName;
    
    ArrayList<String> TeachableCourses = new ArrayList<>();
    ArrayList<Main_Schedule> TeachersSchedules = new ArrayList<>();
    
    //Schedule OBJECT ARRAYLIST for TEACHING COURSES
    // ^ SCHEDULE OBJECT WILL HAVE 4 SECTIONS
    
    public String getKPUID() {
        return KPUID;
    }
    public void setKPUID(String KPUID) {
        this.KPUID = KPUID;
    }
    public String getFirstName() {
        return FirstName;
    }
    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }
    public String getLastName() {
        return LastName;
    }
    public void setLastName(String LastName) {
        this.LastName = LastName;
    }
    public ArrayList<String> getTeachableCourses() {
        return TeachableCourses;
    }
    public void setTeachableCourses(ArrayList<String> TeachableCourses) {
        this.TeachableCourses = TeachableCourses;
    }
    public ArrayList<Main_Schedule> getTeachersSchedules() {
        return TeachersSchedules;
    }
    public void setTeachersSchedules(ArrayList<Main_Schedule> TeachersSchedules) {
        this.TeachersSchedules = TeachersSchedules;
    }
}
