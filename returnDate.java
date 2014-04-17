package Connection;


public class returnDate {
    int day;
    int month;
    int year;
    int date;
    int slot;
    int numhrs;
    String range1, range2;

    public returnDate(int d,int date, int m, int y, int s, int h, String r1, String r2){
        this.setDay(d);
        this.setMonth(m+1);
        this.setYear(y);
        this.setDate(date);
        this.setSlot(s);
        this.setNumhrs(h);
        this.setRange1(r1);
        this.setRange2(r2);
    }

    public String getRange1() {
        return range1;
    }

    public String getRange2() {
        return range2;
    }

    public void setRange1(String range1) {
        this.range1 = range1;
    }

    public void setRange2(String range2) {
        this.range2 = range2;
    }
    
    
    public void setSlot(int slot) {
        this.slot = slot;
    }

    public void setNumhrs(int numhrs) {
        this.numhrs = numhrs;
    }

    public int getSlot() {
        return slot;
    }

    public int getNumhrs() {
        return numhrs;
    }

    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getDay() {
        return day;
    }

    public int getMonth() {
        return month;
    }

    public int getYear() {
        return year;
    }
    
}
