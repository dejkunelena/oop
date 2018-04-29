package childDB.servlets;

import childDB.dao.WorkingWithChild;
import childDB.dao.WorkingWithUsers;
import childDB.entities.Child;
import childDB.entities.User;
import childDB.model.Model;
import com.sun.xml.internal.ws.api.pipe.FiberContextSwitchInterceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoginServlet extends HttpServlet {
    private static final String HOST = "jdbc:mysql://localhost:3306/user";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    private Connection connection;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/login.jsp");
      //  User user = new User();
       // user.setPassword("root");
        //user.setLogin("root");
        //Model model = Model.getInstance();
        //model.setUser(user);
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        Model model = Model.getInstance();
        User user = new User();
        user.setPassword(password);
        user.setLogin(login);
        user = WorkingWithUsers.tryToAuthentication(user);
       if(user== null)
           req.setAttribute("message", "Неверный логин или пароль");
       else{
           String contextPath = req.getContextPath();
           model.setUser(user);
           resp.sendRedirect(contextPath + "/childrenList");
       }
           //resp.sendRedirect(req.getContextPath() + "/childrenList");
           //req.getRequestDispatcher("/childrenList").forward(req, resp);

       // Connection connection;
        //try {
          //  Class.forName("com.mysql.jdbc.Driver");
        //} catch (ClassNotFoundException e) {
          ///  e.printStackTrace();
            //req.setAttribute("message", "ne load OK");
        //}
        //try(Connection connection1 = DriverManager.getConnection(HOST,USERNAME,PASSWORD); Statement statement = connection1.createStatement()) {
          //  statement.execute("INSERT INTO users(user.users.name, user.users.password) VALUES ('user1','password1')");
            //req.setAttribute("message", "OK");

        //} catch (SQLException e) {
          //  req.setAttribute("message", e.getMessage());

            //e.printStackTrace();
        //}
       // req.getRequestDispatcher("/childrenList").forward(req, resp);
       // if(login.equals(user.getLogin()) && password.equals(user.getPassword())){
         //   //req.setAttribute("message", "OK");
           // RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/childrenList.jsp");
            //requestDispatcher.forward(req, resp);
        //}
        //else { req.setAttribute("message", "Неверный логин или пароль");}
        //doGet(req, resp);
    }
}
