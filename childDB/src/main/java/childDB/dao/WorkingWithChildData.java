package childDB.dao;

import childDB.entities.Institution;
import childDB.entities.Location;
import childDB.entities.User;

import java.sql.*;
import java.util.ArrayList;

public class WorkingWithChildData {
    private static final String HOST = "jdbc:mysql://localhost:3306/child_database";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    public static ArrayList<Location> getLocations(){
        ArrayList<Location> locations = new ArrayList<>();
        String query = "SELECT * FROM locations;";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD); Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Location location = new Location();
                location.setID(resultSet.getInt((1)));
                location.setCity(resultSet.getString(2));
                location.setRegion(resultSet.getString(3));
                location.setArea(resultSet.getString(4));
                location.setCity(resultSet.getBoolean(5));
                locations.add(location);
            }
            return locations;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Location getLocationFromQuery(String query){
        Location location = new Location();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD); Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                location = new Location();
                location.setID(resultSet.getInt((1)));
                location.setCity(resultSet.getString(2));
                location.setRegion(resultSet.getString(3));
                location.setArea(resultSet.getString(4));
                location.setCity(resultSet.getBoolean(5));
            }
            return location;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Institution getInstitutionFromID(int id){
        Institution institution = new Institution();
        String query = "SELECT * FROM institutions WHERE id=" + id +";";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD); Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                institution = new Institution();
                institution.setId(resultSet.getInt((1)));
                institution.setName(resultSet.getString(2));
                institution.setUserId(resultSet.getInt(3));
                institution.setParentId(resultSet.getInt((4)));
                institution.setLocationId(resultSet.getInt(5));
                institution.setType(resultSet.getInt(6));
            }
            return institution;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }


    public static ArrayList<Institution> getInstitutions() {
        ArrayList<Institution> institutions = new ArrayList<>();
        String query = "SELECT * FROM institutions;";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD); Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Institution institution = new Institution();
                institution.setId(resultSet.getInt((1)));
                institution.setName(resultSet.getString(2));
                institution.setUserId(resultSet.getInt(3));
                institution.setParentId(resultSet.getInt((4)));
                institution.setLocationId(resultSet.getInt(5));
                institution.setType(resultSet.getInt(6));
                institutions.add(institution);
            }
            return institutions;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<>();
        String query = "SELECT * FROM users;";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD); Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);
            User user;
            while (resultSet.next()) {
                user = new User();
                user.setID(resultSet.getInt(1));
                user.setLogin(resultSet.getString(2));
                user.setPassword(resultSet.getString(3));
                user.setEmail(resultSet.getString(5));
                user.setInstId(resultSet.getInt(4));
                users.add(user);
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
