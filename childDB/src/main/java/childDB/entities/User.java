package childDB.entities;

public class User {
    private int ID;
    private String Login;
    private String Password;
    private String Email;
    private int InstId;

    public User() {
    }

    public User(int ID, String login, String password, String email, int instId) {
        this.ID = ID;
        Login = login;
        Password = password;
        Email = email;
        InstId = instId;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getLogin() {
        return Login;
    }

    public void setLogin(String login) {
        Login = login;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public int getInstId() {
        return InstId;
    }

    public void setInstId(int instId) {
        InstId = instId;
    }
}
