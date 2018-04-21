package childDB.entities;

public class Institution {
    private int Id;
    private int ParentId;
    private int UserId;
    private int LocationId;
    private String Name;
    private int Type;


    public Institution() {
    }

    public Institution(int id, int parentId, int userId, int locationId, String name, int type) {
        Id = id;
        ParentId = parentId;
        UserId = userId;
        LocationId = locationId;
        Name = name;
        Type = type;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getParentId() {
        return ParentId;
    }

    public void setParentId(int parrentId) {
        ParentId = parrentId;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public int getLocationId() {
        return LocationId;
    }

    public void setLocationId(int locationId) {
        LocationId = locationId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public int getType() {
        return Type;
    }

    public void setType(int type) {
        Type = type;
    }
}
