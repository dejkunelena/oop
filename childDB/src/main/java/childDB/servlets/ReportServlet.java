package childDB.servlets;

import childDB.dao.WorkingWithChild;
import childDB.dao.WorkingWithChildData;
import childDB.data.ChildData;
import childDB.entities.Child;
import childDB.entities.Institution;
import childDB.entities.User;
import childDB.model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ReportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/report.jsp");
        Model model = Model.getInstance();
        if(req.getQueryString() !=null) {
            String query = createQuery(req);
            req.setAttribute("child", query);
            req.setAttribute("children", WorkingWithChild.getChildFromQuery(query));
        }
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    public static String createQuery(HttpServletRequest req){
        String query = "SELECT * FROM children WHERE ";
        Model model = Model.getInstance();
        User user = model.getUser();
        ArrayList<Institution> institutions = WorkingWithChildData.getInstitutions();
        ArrayList<Institution> newInstList = new ArrayList<>();
        for (Institution inst: institutions ) {
            if(inst.getId() == user.getInstId() || inst.getParentId() == user.getInstId())
                newInstList.add(inst);
        }
        if(req.getParameter("inst").equals("0")) {
            query += "(";
            for(int i = 0; i < newInstList.size(); i++)
                if(i == newInstList.size() - 1)
                    query += "inst_id='" + newInstList.get(i).getId() + "') AND ";
                else
                    query += "inst_id='" + newInstList.get(i).getId() + "' or ";
        }
        else
            query += "inst_id='" + req.getParameter("inst") + "' AND ";

        if(req.getParameter("diagnosesCB") != null){
            String[] diagnoses = req.getParameterValues("diagnoses");
            query += "diagnoses='";
            for (String s: diagnoses) {
                query += s + " ";
            }
            query += "' AND ";
        }

        if(req.getParameter("disabilityCB") != null){
            query += "disability='" + req.getParameter("disability") + "' AND ";
        }

        if(req.getParameter("helpInTheCenterCB") != null){
            query += "type_of_help_in_center='" + req.getParameter("formOfHelpInCenter") + "' AND ";
        }

        if(req.getParameter("helpInSchoolCB") != null){
            query += "type_of_help_in_school='" + req.getParameter("formOfHelpInSchool") + "' AND ";
        }

        if(req.getParameter("needsHelpCB") != null){
            if(req.getParameter("isNeedsHelp") == null)
                query += "is_needs_help='1' AND ";
            else
                query += "is_needs_help='0' AND ";
        }
        if(req.getParameter("classCB") != null){
            query +="class='" + req.getParameter("class") + "' AND ";
        }
        if(req.getParameter("isManCB") != null){
            if(req.getParameter("isMan") == "2")
                query += "is_man='1' AND ";
            else query += "is_man='0' AND ";
        }
        if(req.getParameter("locationCB") != null){
            query += "location='" + req.getParameter("location") + "' AND ";
        }
        if(req.getParameter("formOfCustodyCB")!=null){
            query += "form_of_custody='" + req.getParameter("formOfCustody") + "' AND ";
        }
        if(req.getParameter("isFullFamilyCB") != null){
            if(req.getParameter("isFullFamily") != null){
                query += "is_complete_family='0' AND ";}

            else query += "is_complete_family='1' AND ";
        }


        if(req.getParameter("isLargeFamilyCB") != null) {
            if (req.getParameter("IsLargeFamily") != null) {
                query += "is_large_family='0' AND ";
            } else query += "is_large_family='1' AND ";
        }

        if(req.getParameter("isLowIncomeCB") != null){
            if(req.getParameter("isLowIncomeCB") != null){
                query += "is_low_income_family='0' AND ";}

            else query += "is_low_income_family='1' AND ";
        }
        if(req.getParameter("motherCB") != null){
            String[] mother = req.getParameterValues("mother");
            query += "mother='";
            for (String s: mother) {
                query += s + " ";
            }
            query += "' AND ";
        }

        if(req.getParameter("fatherCB") != null){
            String[] father = req.getParameterValues("father");
            query += "father='";
            for (String s: father) {
                query += s + " ";
            }
            query += "' AND ";
        }
        if(req.getParameter("dateOfInput") != null){
            Date date1 = java.sql.Date.valueOf(req.getParameter("firstDate"));
            Date date2 = java.sql.Date.valueOf(req.getParameter("secondDate"));
            query += "(accounting_date BETWEEN '" + date1 + "' AND '" + date2 + "') AND ";
        }
        if(req.getParameter("age") != null){
            int age1 = Integer.parseInt(req.getParameter("age1"));
            int age2 = Integer.parseInt(req.getParameter("age2"));
            Calendar instance = Calendar.getInstance();
            instance.setTime(new Date());
            instance.add(Calendar.YEAR, -age2);
            Date date1 = instance.getTime();
            instance.setTime(new Date());
            instance.add(Calendar.YEAR, -age1);
            Date date2 = instance.getTime();
            SimpleDateFormat formatForDateNow = new SimpleDateFormat("yyyy-MM-dd");

            query += "(birthday BETWEEN '" + formatForDateNow.format(date1) + "' AND '" + formatForDateNow.format(date2) + "') AND ";

        }
        query = query.substring(0, query.length() - 4);
        query += ";";
        return query;
    }
}
