package kpu.fs.alpha;

public class Main_Section {
    
    String CRNID;
    String SectionID;
    String Day;
    String Time;
    
    Main_Course course;
    Main_Location location;
    Main_Teacher teacher;
    Main_Semester semester;

    public String getDay() {
        return Day;
    }

    public void setDay(String Day) {
        this.Day = Day;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String Time) {
        this.Time = Time;
    }
    
    Main_Time timeSlot;

    public String getCRNID() {
        return CRNID;
    }
    public void setCRNID(String CRNID) {
        this.CRNID = CRNID;
    }
    public String getSectionID() {
        return SectionID;
    }
    public void setSectionID(String SectionID) {
        this.SectionID = SectionID;
    }
    public Main_Course getCourse() {
        return course;
    }
    public void setCourse(Main_Course course) {
        this.course = course;
    }
    public Main_Location getLocation() {
        return location;
    }
    public void setLocation(Main_Location location) {
        this.location = location;
    }
    public Main_Teacher getTeacher() {
        return teacher;
    }
    public void setTeacher(Main_Teacher teacher) {
        this.teacher = teacher;
    }
    public Main_Semester getSemester() {
        return semester;
    }
    public void setSemester(Main_Semester semester) {
        this.semester = semester;
    }
    public Main_Time getTimeSlot() {
        return timeSlot;
    }
    public void setTimeSlot(Main_Time timeSlot) {
        this.timeSlot = timeSlot;
    }
}
