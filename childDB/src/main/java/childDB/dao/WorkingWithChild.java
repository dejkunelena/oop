package childDB.dao;

import childDB.entities.Child;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;

public class WorkingWithChild {
    private static final String HOST = "jdbc:mysql://localhost:3306/child_database";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    public static String addChild(Child child, String table){
        String diagnoses = "";
        for(int s : child.getDiagnoses()){
            diagnoses += s + " ";
        }
        String mother = "";
        for(int s : child.getMother()){
            mother += s + " ";
        }
        String father = "";
        for(int s : child.getFather()) {
            father += s + " ";
        }
        int man = 0;
        if(child.isMan() == false) man = 1;

        int isNeedHelp = 0;
        if(child.isNeedsHelp() == false) isNeedHelp = 1;

        int isLargeFamily = 0;
        if(child.isLargeFamily() == false) isLargeFamily = 1;

        int isLowIncomeFamily = 0;
        if(child.isLowIncomeFamily() == false) isLowIncomeFamily = 1;

        int isCompleteFamily = 0;
        if(child.isCompleteFamily() == false) isCompleteFamily = 1;

        String query = "INSERT INTO " + table + " (first_name, last_name, middle_name, is_man," +
               " birthday, inst_id, address, diagnoses, class, disability, " +
               "is_needs_help, type_of_help_in_center, type_of_help_in_school, " +
               "form_of_custody, is_complete_family, mother, father, is_large_family, " +
               "is_low_income_family, notes, location)" +
                "VALUES ('" + child.getFirstName() + "','" + child.getLastName() + "','" + child.getMiddleName() +
                "','" + man + "','" + child.getBirthday() + "','" + child.getInstID() + "','" +
                child.getAddress() + "','" + diagnoses + "','" + child.getClassOrCource() + "','" +
                child.getDisability() + "','" + isNeedHelp + "','" + child.getTypeOfHelpInCenter() +
                "','" + child.getTypeOfHelpInSchool() + "','" + child.getFormOfCustody() + "','" +
                isCompleteFamily + "','" + mother + "','" + father + "','" + isLargeFamily + "','" +
                isLowIncomeFamily + "','" + child.getNotes() + "','" + child.getCity() +"');";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return "tyt";
        }
        try (Connection connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD); Statement statement = connection.createStatement()) {
            statement.executeUpdate(query);

            return "ok";
        } catch (SQLException e) {
            e.printStackTrace();
            return e.getMessage();
        }
    }

    public static String updateChild(Child child, int id){
        String diagnoses = "";
        for(int s : child.getDiagnoses()){
            diagnoses += s + " ";
        }
        String mother = "";
        for(int s : child.getMother()){
            mother += s + " ";
        }
        String father = "";
        for(int s : child.getFather()) {
            father += s + " ";
        }
        int man = 0;
        if(child.isMan() == false) man = 1;

        int isNeedHelp = 0;
        if(child.isNeedsHelp() == false) isNeedHelp = 1;

        int isLargeFamily = 0;
        if(child.isLargeFamily() == false) isLargeFamily = 1;

        int isLowIncomeFamily = 0;
        if(child.isLowIncomeFamily() == false) isLowIncomeFamily = 1;

        int isCompleteFamily = 0;
        if(child.isCompleteFamily() == false) isCompleteFamily = 1;

        String query = "UPDATE children SET first_name='" + child.getFirstName() + "', last_name='" +
                child.getLastName() +"', middle_name='" + child.getMiddleName() + "', is_man='" +
                man + "',birthday='" + child.getBirthday() + "', inst_id='" +child.getInstID() + "', address='" +
                child.getAddress() + "', diagnoses='" + diagnoses + "', class='" + child.getClassOrCource() +
                "', disability='" + child.getDisability() + "', is_needs_help='" + isNeedHelp +
                "', type_of_help_in_center='" + child.getTypeOfHelpInCenter() + "', type_of_help_in_school='" +
                child.getTypeOfHelpInSchool() + "', form_of_custody='" + child.getFormOfCustody() +
                "', is_complete_family='" + isCompleteFamily + "', mother='" + mother + "', father='" + father +"', is_large_family='" +
                isLargeFamily + "', is_low_income_family='" +isLowIncomeFamily + "', location='" + child.getCity()+
                "', notes='" + child.getNotes() + "' WHERE id='" + id + "';";

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return "tyt";
        }
        try (Connection connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD); Statement statement = connection.createStatement()) {
            statement.executeUpdate(query);

            return "ok";
        } catch (SQLException e) {
            e.printStackTrace();
            return e.getMessage();
        }
    }

    public static String deleteChild(int id){
        String query = "DELETE FROM children WHERE id='" + id + "';";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return "tyt";
        }
        try (Connection connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD); Statement statement = connection.createStatement()) {
            statement.executeUpdate(query);

            return "ok";
        } catch (SQLException e) {
            e.printStackTrace();
            return e.getMessage();
        }
    }

    public static ArrayList<Child> getAllChild(int instID){
        String query = "SELECT * FROM children WHERE inst_id='" + instID + "';";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
        try (Connection connection = DriverManager.getConnection(HOST, USERNAME, PASSWORD); Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);
            ArrayList<Child> children = new ArrayList<>();
            while(resultSet.next()){
                Child child = new Child();
                child.setID(resultSet.getInt(1));
                child.setFirstName(resultSet.getString(2));
                child.setLastName(resultSet.getString(3));
                child.setMiddleName(resultSet.getString(4));
                child.setMan(resultSet.getBoolean(5));
                child.setBirthday(resultSet.getDate(6));
                child.setInstID(resultSet.getInt(7));
                child.setAddress(resultSet.getString(8));
                String diagnos = resultSet.getString(9);
                String[] d = diagnos.split(" ");
                ArrayList<Integer> diagnoses = new ArrayList<>();
                for(String s : d){
                    diagnoses.add(Integer.parseInt(s));
                }
                child.setDiagnoses(diagnoses);
                child.setClassOrCource(resultSet.getInt(10));
                child.setDisability(resultSet.getInt(11));
                child.setNeedsHelp(resultSet.getBoolean(12));
                child.setTypeOfHelpInCenter(resultSet.getInt(13));
                child.setTypeOfHelpInSchool(resultSet.getInt(14));
                child.setFormOfCustody(resultSet.getInt(15));
                child.setCompleteFamily(resultSet.getBoolean(16));
                String motherInfo = resultSet.getString(17);
                String[] m = motherInfo.split(" ");
                ArrayList<Integer> mother = new ArrayList<>();
                for(String s : m){
                    mother.add(Integer.parseInt(s));
                }
                child.setMother(mother);
                String fatherInfo = resultSet.getString(18);
                String[] f = motherInfo.split(" ");
                ArrayList<Integer> father = new ArrayList<>();
                for(String s : f){
                    father.add(Integer.parseInt(s));
                }
                child.setFather(father);
                child.setLargeFamily(resultSet.getBoolean(19));
                child.setLowIncomeFamily(resultSet.getBoolean(20));
                child.setCity(resultSet.getInt(25));
                child.setNotes(resultSet.getString(24));
                children.add(child);
            }
            return children;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
