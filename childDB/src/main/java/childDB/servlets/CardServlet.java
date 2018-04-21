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
import java.util.List;

public class CardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/childrenList.jsp");
        Model model = Model.getInstance();
        List<Child> children = model.getChildren();
        int id = ChildData.ID;
        req.setAttribute("num", "Sdf");
       // req.setAttribute("child", children.get(children.indexOf()));
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("addNew".equals(action)) {
            String contextPath = req.getContextPath();

            // ==> /ServletTutorial/showMe
            resp.sendRedirect(contextPath + "/registration");

        } else if ("show".equals(action)) {
            req.getRequestDispatcher("/login").forward(req, resp);
            // Invoke SecondServlet job here.
        }
    }
}
