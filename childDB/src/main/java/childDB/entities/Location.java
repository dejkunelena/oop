package childDB.entities;

public class Location {
    private int ID;
    private String Region;
    private String Area;
    private String City;
    private boolean isCity;

    public Location(int ID, String region, String area, String city, boolean isCity) {
        this.ID = ID;
        Region = region;
        Area = area;
        City = city;
        this.isCity = isCity;
    }

    public Location() {
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getRegion() {
        return Region;
    }

    public void setRegion(String region) {
        Region = region;
    }

    public String getArea() {
        return Area;
    }

    public void setArea(String area) {
        Area = area;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    public boolean isCity() {
        return isCity;
    }

    public void setCity(boolean city) {
        isCity = city;
    }
}
