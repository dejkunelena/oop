<%@ page import="childDB.entities.Location" %>
<%@ page import="childDB.data.ChildData" %>
<%@ page import="childDB.dao.WorkingWithChildData" %>
<%@ page import="childDB.entities.Institution" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 08.04.2018
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Регистрация</title>
</head>
<body>
    <div>
        <h1>Регистрация:</h1>
    </div>
    <%
        if (request.getAttribute("login") != null) {
            out.println("<p>Login '" + request.getAttribute("login") + "' is enter!</p>");
        }
    %>
    <form method="post">
        <label>Логин :
            <input type="text" name="login"/><br/><br/>
        </label>
        <label>Пароль :
            <input type="password" name="password" /><br/><br/>
        </label>
        <label>Проверка пароля :
            <input type="password" name="passwordVer" /><br/><br/>
        </label>
        <label>Почта :
            <input type="text" name="email"/><br/><br/>
        </label>
        <label>Наименование учебного заведения :
            <input type="text" name="instName"/><br/><br/>
        </label>
        <label>Тип УВЗ :
            <select name="type">
                <%
                    ArrayList<String> types = ChildData.instTypes;
                    for(int i = 0; i < types.size(); i++){
                        out.print("<option value='" + i + "'>" +
                                types.get(i) + "</option>");
                    }
                %>
            </select><br/><br/>
        </label>
        <label>Город :
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
        <label>Вышестоящее УВЗ :
            <select name="parentId">
                <%
                    for(Institution institution :  WorkingWithChildData.getInstitutions()){
                        out.print("<option value='" + institution.getId() + "'>" +
                                institution.getName() + "</option>");
                    }
                %>
            </select><br/><br/>
        </label>
        <button type="submit">Зарегистрироваться</button>
    </form>
</body>
</html>
