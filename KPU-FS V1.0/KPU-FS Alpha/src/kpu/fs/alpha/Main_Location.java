package kpu.fs.alpha;

public class Main_Location {
    
    String Campus;
    String RoomNo;
    String ComputersAvalible;
    
    
    boolean[] TimesAvalible = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
            
    
    
    Main_Time TimeAvalible;

    public boolean[] getTimesAvalible() {
        return TimesAvalible;
    }

    public void setTimesAvalible(boolean[] TimesAvalible) {
        this.TimesAvalible = TimesAvalible;
    }

    
    
  
    public String getCampus() {
        return Campus;
    }
    public void setCampus(String Campus) {
        this.Campus = Campus;
    }
    public String getRoomNo() {
        return RoomNo;
    }
    public void setRoomNo(String RoomNo) {
        this.RoomNo = RoomNo;
    }
    public String getComputersAvalible() {
        return ComputersAvalible;
    }
    public void setComputersAvalible(String ComputersAvalible) {
        this.ComputersAvalible = ComputersAvalible;
    }
}
