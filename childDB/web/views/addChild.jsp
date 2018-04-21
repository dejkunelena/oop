<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 10.04.2018
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить карточку</title>
</head>
<body>
<div>
    <div>
        <h2>Добавить карточку :</h2>
    </div>
    <form method="post">
        <label>Имя :
            <input type="text" name="firstName"/><br/>
        </label>
        <label>Фамилия :
            <input type="text" name="lastName"/><br/>
        </label>
        <label>Отчество :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Муж/жен :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Дата рождения :
            <input type="date" name="middleName"/><br/>
        </label>
        <label>Учебное учреждение :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Адрес :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Город/ПГТ :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Диагнозы :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Класс или курс :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Инвалидность :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Нуждается ли во вспомогательных средствах передвижения :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Помощь в ЦКРОиР :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Помощь в др учреждениях :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Форма опеки :
            <input type="text" name="middleName"/><br/>
        </label>
        <label>Полная семья :
            <input type="text" name="middleName"/><br/>
        </label>
        <button type="submit">Сохранить</button>
    </form>
    <div>
        <button name="btn" onclick="location.href='/childrenList'">Назад</button>
    </div>
    <%
        if (request.getAttribute("child") != null) {
            out.println("<p>Карточка '" + request.getAttribute("child") + "' успешно добавлен(-а)!</p>");
        }
    %>


</div>

</body>
</html>
