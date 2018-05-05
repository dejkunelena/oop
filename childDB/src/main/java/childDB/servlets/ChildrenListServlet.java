package childDB.servlets;

import childDB.dao.WorkingWithChild;
import childDB.dao.WorkingWithChildData;
import childDB.data.ChildData;
import childDB.entities.Child;
import childDB.entities.Institution;
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
        ChildData.ID = -1;
        ChildData.instId = model.getUser().getInstId();
        int instId = ChildData.instId;
        if(req.getQueryString() != null)
        {
            if(req.getParameter("id") != null)
                ChildData.ID = Integer.parseInt(req.getParameter("id"));
            if(req.getParameter("db") != null)
                instId = Integer.parseInt(req.getParameter("db"));
        };
        ChildData.instId = instId;
        List<Child> children = WorkingWithChild.getAllChild(ChildData.instId);
        if(instId == -1){
            ArrayList<Institution> institutions = WorkingWithChildData.getInstitutions();
            ArrayList<Institution> newInst = new ArrayList<>();
            for(int i = 0; i < institutions.size(); i++){
                if( institutions.get(i).getParentId() == model.getUser().getInstId()){
                    newInst.add(institutions.get(i));
                }
            }
            for( int i =0; i < newInst.size(); i++){
                children.addAll(WorkingWithChild.getAllChild(newInst.get(i).getId()));
            }
            children.addAll(WorkingWithChild.getAllChild(model.getUser().getInstId()));
        }
        else if (instId == -2 || instId == -3){
            children = new ArrayList<>();
            ArrayList<Institution> institutions = WorkingWithChildData.getInstitutions();
            ArrayList<Institution> newInst = new ArrayList<>();
            for(int i = 0; i < institutions.size(); i++){
                if( institutions.get(i).getParentId() == model.getUser().getInstId()){
                    newInst.add(institutions.get(i));
                }
            }
            String table = "archive";
            if(instId == -3)
                table = "deleted";
            for( int i =0; i < newInst.size(); i++){
                String query = "SELECT * FROM " + table + " WHERE inst_id='" + newInst.get(i).getId() + "';";
                children.addAll(WorkingWithChild.getChildFromQuery(query));
            }
            String query = "SELECT * FROM " + table + " WHERE inst_id='" + model.getUser().getInstId() + "';";
            children.addAll(WorkingWithChild.getChildFromQuery(query));

        }
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
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String action = req.getParameter("action");
        if("save".equals(action)){
            if(ChildData.ID != -1) {
                req.setAttribute("adding", WorkingWithChild.updateChild(getChildInfo(req), ChildData.ID));
                ChildData.ID = -1;
            }
            else {
                req.setAttribute("adding", WorkingWithChild.addChild(getChildInfo(req), "children"));
            }
            doGet(req, resp);
        }
        else if("update".equals(action)){
            ChildData.ID = Integer.parseInt(req.getParameter("id"));
            doGet(req, resp);
        }
        else if("add".equals(action)){
            String contextPath = req.getContextPath();
            resp.sendRedirect(contextPath + "/childrenList");
        }
        else if("delete".equals(action)){
            if(ChildData.ID != -1){
                int id = 0;
                ArrayList<Child> children = WorkingWithChild.getAllChild(1);
                for( int i = 0; i < children.size(); i++ ){
                    if(children.get(i).getID() == ChildData.ID){
                        id = i;
                    }
                }
                req.setAttribute("adding",WorkingWithChild.addChild(children.get(id),"deleted"));
                WorkingWithChild.deleteChild(ChildData.ID);
                ChildData.ID = -1;
                doGet(req, resp);
            }
        }
        else if("archive".equals(action)){
            if(ChildData.ID != -1){
                int id = 0;
                ArrayList<Child> children = WorkingWithChild.getAllChild(1);
                for( int i = 0; i < children.size(); i++ ){
                    if(children.get(i).getID() == ChildData.ID){
                        id = i;
                    }
                }
                req.setAttribute("adding",WorkingWithChild.addChildInArchive(children.get(id),Integer.parseInt(req.getParameter("archiveList"))
                ));
                WorkingWithChild.deleteChild(ChildData.ID);
                ChildData.ID = -1;
                doGet(req, resp);
            }
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
        if(req.getParameter("address") != null)
            child.setAddress(req.getParameter("address"));
        else
            child.setAddress("");
        child.setCity(Integer.parseInt(req.getParameter("location")));
        String[] diagnoses = req.getParameterValues("diagnoses");
        ArrayList<Integer> d = new ArrayList<Integer>();
        for(String s : diagnoses){
            d.add(Integer.parseInt(s));
        }
        child.setDiagnoses(d);
        if(req.getParameter("class") != null)
            child.setClassOrCource(Integer.parseInt(req.getParameter("class")));
        else
            child.setClassOrCource(0);
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

       if(req.getParameter("edit") != null)
           child.setNotes(req.getParameter("edit"));
       else
           child.setNotes("");
        child.setCity(Integer.parseInt(req.getParameter("location")));
        return child;
    }


}