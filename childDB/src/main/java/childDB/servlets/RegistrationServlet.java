package childDB.servlets;

import childDB.dao.WorkingWithChild;
import childDB.dao.WorkingWithChildData;
import childDB.dao.WorkingWithUsers;
import childDB.entities.Institution;
import childDB.entities.User;
import com.sun.javafx.scene.layout.region.Margins;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/registration.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String name = req.getParameter("instName");
        int type = Integer.parseInt(req.getParameter("type"));
        int locationID = Integer.parseInt(req.getParameter("location"));
        int parentID = Integer.parseInt(req.getParameter("parentId"));

        if (password.equals(req.getParameter("passwordVer"))){
            User user = new User();
            Institution institution = new Institution();
            user.setLogin(login);
            user.setPassword(password);
            user.setEmail(email);
            institution.setName(name);
            institution.setType(type);
            institution.setLocationId(locationID);
            institution.setParentId(parentID);
            if(WorkingWithUsers.registration(user,institution))
                req.getRequestDispatcher("/childrenList").forward(req, resp);

        }
    }

}
