package childDB.dao;

import childDB.entities.Institution;
import childDB.entities.User;

import java.sql.*;
import java.util.ArrayList;

public class WorkingWithUsers {
    private static final String HOST = "jdbc:mysql://localhost:3306/child_database";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    public static User tryToAuthentication(User user) {
        String query = "SELECT * FROM users WHERE username='" + user.getLogin() + "';";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD); Statement statement = connection.createStatement()) {

           ResultSet resultSet = statement.executeQuery(query);
           while (resultSet.next()) {
              if (user.getPassword().equals(resultSet.getString(3))) {
                    user.setID(resultSet.getInt(1));
                    user.setEmail(resultSet.getString(5));
                    user.setInstId(resultSet.getInt(4));
                    return user;
                }
           }
           return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean registration(User user, Institution institution){
        String query = "INSERT INTO users(username, password, inst_id, email) VALUES ('" + user.getLogin() + "','" +
                user.getPassword() + "'," + user.getInstId() + ",'" + user.getEmail() + "')";
        String queryToInst = "INSERT INTO institutions(name,user_id,parent_id,location_id,type) VALUES ('" +
                institution.getName() + "'," + institution.getUserId() + "," + institution.getParentId() +
                "," + institution.getLocationId() + "," + institution.getType() + ");";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
        try (Connection connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD); Statement statement = connection.createStatement()) {
            statement.executeUpdate(query);
            statement.executeUpdate(queryToInst);
            int userId = 0, instId = 0;
            String queryToKnowUserId = "SELECT MAX(id) FROM child_database.users";
            ResultSet set = statement.executeQuery(queryToKnowUserId);
            while (set.next()) {
                userId = set.getInt(1);
            }
            String queryToKnowInstId = "SELECT MAX(id) FROM institutions";
            set = statement.executeQuery(queryToKnowInstId);
            while (set.next()) {
                instId = set.getInt(1);
            }
            String updateInstWithUsersId = "UPDATE institutions SET user_id='" + userId + "' WHERE id='" + instId + "';";
            statement.executeUpdate(updateInstWithUsersId);
            String updateUsersWithInstId = "UPDATE users SET inst_id='" + instId + "' WHERE id='" + userId + "';";
            statement.executeUpdate(updateUsersWithInstId);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void updateUser(){

    }
}
