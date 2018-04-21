<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 08.04.2018
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Вход</title>
</head>
<body>
<%
    if (request.getAttribute("message") != null) {
        out.println("<p>" + request.getAttribute("message") + "</p>");
    }
%>
<div>
    <div>
        <h2>Вход</h2>
    </div>
    <form method="post">
        <label>Логин :
            <input type="text" name="login"/><br/>
        </label>
        <label>Пароль :
            <input type="password" name="password"/><br/>
        </label>
        <button type="submit">Войти</button>
    </form>
    <div>
        <button name="btn" onclick="location.href='/registration'">Регистрация</button>
    </div>

</div>


</body>
</html>
