package childDB.servlets;

import childDB.data.ChildData;
import childDB.entities.Child;
import childDB.model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddChildServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/childrenList.jsp");
        if(ChildData.ID == -1){
            req.setAttribute("num", "Sdf");
        }
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("addNew".equals(action)) {
            String contextPath = req.getContextPath();
            int id =  Integer.parseInt(req.getParameter("id"));
            ChildData.ID = id;
            doGet(req, resp);
            //resp.sendRedirect(contextPath + "/childrenList");

        } else if ("show".equals(action)) {
            req.getRequestDispatcher("/login").forward(req, resp);
            // Invoke SecondServlet job here.
        }
        //String firstName = req.getParameter("firstName");
        //S/tring lastName = req.getParameter("lastName");
        //String middleName = req.getParameter("middleName");
        //Child child = new Child();
        //child.setFirstName(firstName);
        //child.setLastName(lastName);
        //c/hild.setMiddleName(middleName);
        //Model model =  Model.getInstance();
        //model.add(child);
        //req.setAttribute("child", firstName);
        //doGet(req, resp);
    }
}
