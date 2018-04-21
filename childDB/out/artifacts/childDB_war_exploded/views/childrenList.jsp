<%@ page import="java.util.List" %>
<%@ page import="childDB.entities.Child" %>
<%@ page import="childDB.entities.Institution" %>
<%@ page import="childDB.dao.WorkingWithChildData" %>
<%@ page import="childDB.entities.Location" %>
<%@ page import="childDB.data.ChildData" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 09.04.2018
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Список детей</title>
    <style>
        .layer1 { /* Цвет фона слоя */
            padding: 5px; /* Поля вокруг текста */
            float: left; /* Обтекание по правому краю */
            width: 500px; /* Ширина слоя */
        }
        .layer2 { /* Цвет фона слоя */
            padding: 5px; /* Поля вокруг текста */
            width: 500px; /* Ширина слоя */
            float: left; /* Обтекание по правому краю */
        }
    </style>
</head>
<body>
<%
    if (request.getAttribute("adding") != null) {
        out.println("<p>" + request.getAttribute("adding") + "</p>");
    }
%>
<div class="layer1">
    <form method="post">
            <h2>Список детей :</h2>
        <div >
            <label>ID
                <input name="id">
            </label>
            <button type="submit" name="action" value="addNew">Добавить</button>
            <button type="submit" name="action" value="update">Изменить</button>
            <button type="submit" name="action" value="delete">Удалить</button>
        </div>
        <%
            List<Child> children = (List<Child>) request.getAttribute("children");
            if (children != null) {
                out.println("<ui>");
                for (Child s : children) {
                    out.println("<li>" + s.getID() + " " + s.getFirstName() + " "  + s.getLastName() + "</li>");
                }
                out.println("</ui>");
            } else out.println("<p>There are no children yet!</p>");
        %>
        </div>
    </form>
</div>
<div class="layer2">
        <div>
            <h2>Добавить карточку :</h2>
        </div>
        <form acttion="childrenList" method="post">
            <%
                Child child = (Child) request.getAttribute("child");
            %>
            <label>Имя :
                <input type="text" name="firstName" value="
                <%
                    if(child != null)
                        out.print(child.getFirstName());
                %>
                 "/><br/><br/>
            </label>
            <label>Фамилия :
                <input type="text" name="lastName" value="
                <%
                    if(child != null)
                        out.print(child.getLastName());
                %>
                 "/><br/><br/>
            </label>
            <label>Отчество :
                <input type="text" name="middleName" value="
                <%
                    if(child != null)
                        out.print(child.getMiddleName());
                %>
                 "/><br/><br/>
            </label>
            <label>Пол :
                <select name="isMan">
                    <option value="0">Мужской</option>
                    <option value="1"
                            <%

                        if(child != null)
                            if(child.isMan() == false)
                                out.print("selected");
                            %>
                    >Женский</option>
                </select>
            </label><br/><br/>
            <label>Дата рождения :
                <input type="date" name="date" value="
                <%
                    if(child != null)
                        out.print(child.getBirthday());
                %>
                 "/><br/>
            </label><br/><br/>
            <label>Учебное учреждение :
                <select name="inst">
                    <%
                        for(Institution institution :  WorkingWithChildData.getInstitutions()){
                            if(child != null) {
                                if (child.getInstID() == institution.getId())
                                    out.print("<option selected value='" + institution.getId() + "'>" +
                                            institution.getName() + "</option>");
                            } else {
                                out.print("<option value='" + institution.getId() + "'>" +
                                        institution.getName() + "</option>");
                            }
                        }
                    %>
                </select>
            </label><br/><br/>
            <label>Адрес :
                <input type="text" name="address" value="
                <%
                    if(child != null)
                        out.print(child.getAddress());
                %>
                 "/><br/>
            </label><br/><br/>
            <label>Город/ПГТ :
                <select name="location">
                    <%
                        for(Location location :  WorkingWithChildData.getLocations()){
                            out.print("<option value='" + location.getID() + "'>" +
                                    location.getCity() + "</option>");
                        }
                    %>
                </select>
                <br/><br/>
            </label>
            <label>Диагнозы :
                <select name="diagnoses" multiple="multiple" size="3">
                    <%
                        List<Integer> diagnoses = new ArrayList<>();
                        if(child != null) diagnoses = child.getDiagnoses();
                        for(int i = 0; i < ChildData.diagnoses.size(); i++){
                            if(diagnoses.contains(i))
                                out.print("<option selected value='" + i + "'>" + ChildData.diagnoses.get(i) + "</option>");
                            else
                                out.print("<option value='" + i + "'>" + ChildData.diagnoses.get(i) + "</option>");
                        }
                    %>
                </select>
                <br/><br/>
            </label>
            <label>Класс или курс :
                <input type="text" name="class" value="
                <%
                    if(child != null)
                        out.print(child.getAddress());
                %>"/><br/>
                 </label><br/><br/>
            <label>Инвалидность :
                <select name="disability">
                    <%
                        int index = 0 ;
                        if(child != null) index = child.getDisability();
                        for(int i = 0; i < ChildData.disability.size(); i++){
                            if(index == i)
                                out.print("<option selected value='" + i + "'>" + ChildData.disability.get(i) + "</option>");
                            else
                                out.print("<option value='" + i + "'>" + ChildData.disability.get(i) + "</option>");
                        }
                    %>
                </select>
            </label><br/><br/>
            <label>Нуждается ли во вспомогательных средствах передвижения :
                <%
                    if(child != null)
                        if (child.isNeedsHelp() == true)
                            out.print("<input type=\"checkbox\" checked=\"checked\"  name=\"isNeedHelp\" value=\"1\"/><br/>");
                    else
                            out.print("<input type=\"checkbox\"  name=\"isNeedHelp\" value=\"1\"/><br/>");
                %>
            </label><br/><br/>
            <label>Помощь в ЦКРОиР :
                <select name="formOfHelpInCenter">
                    <%
                        int formInCenter = 0;
                        if(child != null)
                            formInCenter = child.getTypeOfHelpInCenter();
                        for(int i = 0; i < ChildData.formOfHelpInCenter.size(); i++){
                            if(i == formInCenter)
                                out.print("<option selected value='" + i + "'>" + ChildData.formOfHelpInCenter.get(i) + "</option>");
                            else
                                out.print("<option value='" + i + "'>" + ChildData.formOfHelpInCenter.get(i) + "</option>");
                        }
                    %>
                </select>
                <br/><br/>
            </label>
            <label>Помощь в др учреждениях :
                <select name="formOfHelpInSchool">
                    <%
                        int formInSchool = 0;
                        if(child != null)
                            formInSchool = child.getTypeOfHelpInSchool();
                        for(int i = 0; i < ChildData.formOfHelpInSchool.size(); i++){
                            if(i == formInSchool)
                                out.print("<option selected value='" + i + "'>" + ChildData.formOfHelpInSchool.get(i) + "</option>");
                            else
                                out.print("<option value='" + i + "'>" + ChildData.formOfHelpInSchool.get(i) + "</option>");
                        }
                    %>
                </select>
                <br/><br/>
            </label>
            <label>Форма опеки :
                <select name="formOfCustody">
                    <%
                        int formOfCustody = 0;
                        if(child != null)
                            formOfCustody = child.getFormOfCustody();
                        for(int i = 0; i < ChildData.formOfCustody.size(); i++){
                            if(i == formOfCustody)
                                out.print("<option selected value='" + i + "'>" + ChildData.formOfCustody.get(i) + "</option>");
                            else
                                out.print("<option value='" + i + "'>" + ChildData.formOfCustody.get(i) + "</option>");
                        }
                    %>
                </select>
            </label><br/><br/>
            <label>Семья</label></br>
            <label>Полная :
                <input type="checkbox" name="isFullFamily" value="0"/>
            </label><br/><br/>
            <label>Многодетная :
                <input type="checkbox" name="IsLargeFamily" value="0"/>
            </label><br/><br/>
            <label>Малообеспеченная :
                <input type="checkbox" name="IsLowIncomeFamily" value="0"/>
            </label><br/><br/>
            <label>Мать :
                <select name="mother" multiple="multiple" size="3">
                    <%
                        for(int i = 0; i < ChildData.parentInfo.size(); i++){
                            out.print("<option value='" + i + "'>" + ChildData.parentInfo.get(i) + "</option>");
                        }
                    %>
                </select>
            </label>
            <label>Отец :
                <select name="father" multiple="multiple" size="3">
                    <%
                        for(int i = 0; i < ChildData.parentInfo.size(); i++){
                            out.print("<option value='" + i + "'>" + ChildData.parentInfo.get(i) + "</option>");
                        }
                    %>
                </select>
            </label>

            <button type="submit"  name="action" value="save">Сохранить</button>
        </form>



</div>
</body>
</html>
