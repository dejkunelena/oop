package childDB.servlets;

import childDB.dao.WorkingWithChild;
import childDB.dao.WorkingWithChildData;
import childDB.data.ChildData;
import childDB.entities.Child;
import childDB.model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class ChildrenListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/childrenList.jsp");
        Model model = Model.getInstance();
        List<Child> children = WorkingWithChild.getAllChild(1);
        req.setAttribute("children", children);
        if(ChildData.ID != -1){
            for(Child ch : children){
                if(ch.getID() == ChildData.ID)
                    req.setAttribute("child", ch);
            }
        }
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if("save".equals(action)){
            if(ChildData.ID != -1) {
                req.setAttribute("adding", WorkingWithChild.updateChild(getChildInfo(req), ChildData.ID));
                ChildData.ID = -1;
            }
            else
                req.setAttribute("adding", WorkingWithChild.addChild(getChildInfo(req)));
            doGet(req, resp);
        }else if("update".equals(action)){
            ChildData.ID = Integer.parseInt(req.getParameter("id"));
            doGet(req, resp);
        } else if("delete".equals(action)){
            ChildData.ID = Integer.parseInt(req.getParameter("id"));
            req.setAttribute("adding",WorkingWithChild.deleteChild(ChildData.ID));
            ChildData.ID = -1;
            doGet(req, resp);
        }

        else if ("addNew".equals(action)) {
            ChildData.ID = -1;
            doGet(req, resp);
        }
        //doGet(req, resp);
    }

    public Child getChildInfo(HttpServletRequest req){
        Child child = new Child();
        child.setFirstName(req.getParameter("firstName"));
        child.setLastName(req.getParameter("lastName"));
        child.setMiddleName(req.getParameter("middleName"));
        if(req.getParameter("isMan").equals("0")) {
            child.setMan(true);
        } else child.setMan(false);
        child.setBirthday(Date.valueOf(req.getParameter("date")));
        child.setInstID(Integer.parseInt(req.getParameter("inst")));
        child.setAddress(req.getParameter("address"));
        child.setCity(Integer.parseInt(req.getParameter("location")));
        String[] diagnoses = req.getParameterValues("diagnoses");
        ArrayList<Integer> d = new ArrayList<Integer>();
        for(String s : diagnoses){
            d.add(Integer.parseInt(s));
        }
        child.setDiagnoses(d);
        child.setClassOrCource(Integer.parseInt(req.getParameter("class")));
        child.setDisability(Integer.parseInt(req.getParameter("disability")));
        String result = req.getParameter("isNeedHelp");
        if(req.getParameter("isNeedHelp") == null){
            child.setNeedsHelp(false);
        } else child.setNeedsHelp(true);
        child.setTypeOfHelpInCenter(Integer.parseInt(req.getParameter("formOfHelpInCenter")));
        child.setTypeOfHelpInSchool(Integer.parseInt(req.getParameter("formOfHelpInSchool")));
        child.setFormOfCustody(Integer.parseInt(req.getParameter("formOfCustody")));
        String isFullFamily = req.getParameter("isFullFamily");
        if(isFullFamily == null){
            child.setCompleteFamily(false);
        } else child.setCompleteFamily(true);
        String isLargeFamily = req.getParameter("IsLargeFamily");
        if(isLargeFamily == null){
            child.setLargeFamily(false);
        } else child.setLargeFamily(true);
        String isLowIncomeFamily = req.getParameter("IsLowIncomeFamily");
        if(isLowIncomeFamily == null){
            child.setLowIncomeFamily(false);
        } else child.setLowIncomeFamily(true);
        String[] mother = req.getParameterValues("mother");
        ArrayList<Integer> moth = new ArrayList<>();
        for(String s : mother){
            moth.add(Integer.parseInt(s));
        }
        child.setMother(moth);
        String[] father = req.getParameterValues("father");
        ArrayList<Integer> fath = new ArrayList<>();
        for(String s : father){
            fath.add(Integer.parseInt(s));
        }
        child.setFather(fath);
        return child;
    }


}