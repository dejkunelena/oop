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
    <head>
        <meta charset="utf-8">
        <title>Регистрация</title>
        <link rel="stylesheet" href="./material.min.css">
        <link rel="stylesheet" href="https://ssl.gstatic.com/docs/script/css/add-ons1.css">
        <script src="./material.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style type="text/css">
            .label-style {
                margin:10px;
                height: 35px;
            }
            .registration-form {
                width: 550px;
                margin: 30px auto;
            }
            .registration-form h2 {
                font-size: 30px;
                margin-bottom: 15px;
                text-align: center;
            }
            .registration-form form {
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                margin-bottom: 10px;
                padding: 30px;
            }
            .registration-form .form-control, .registration-form .btn {
                min-height: 38px;
            }
            .registration-form input[type="email"] {
                border-radius: 2px 2px 0 0;
            }
            .registration-form input[type="password"] {
                border-radius: 0 0 2px 2px;
                margin-top: -1px;
            }
            .registration-form input.form-control:focus {
                position: relative;
                z-index: 2;
            }
            .registration-form .btn {
                font-size: 15px;
                font-weight: bold;
                border-radius: 2px;
            }
        </style>
    </head>
<body>
<div class="registration-form">
    <%
        if (request.getAttribute("login") != null) {
            out.println("<p>Login '" + request.getAttribute("login") + "' is enter!</p>");
        }
    %>
    <form method="post">
        <h2>Регистрация</h2>
        <div class="form-group">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Логин" required="required" name="login">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Пароль" required="required" name="password">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Подтвердить пароль" required="required" name="passwordVer">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Почта" required="required" name="email">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Учебное заведение" required="required" name="instName">
            </div>

            <div class="block form-group">
                <label for="select">Тип УВЗ</label>
                <select name="type" class="label-style">
                    <%
                        ArrayList<String> types = ChildData.instTypes;
                        for(int i = 0; i < types.size(); i++){
                            out.print("<option value='" + i + "'>" +
                                    types.get(i) + "</option>");
                        }
                    %>
                </select>
            </div>
            <div class="block form-group">
                <label for="select">Город</label>
                <select name="location" class="label-style">
                    <%
                        for(Location location :  WorkingWithChildData.getLocations()){
                            out.print("<option value='" + location.getID() + "'>" +
                                    location.getCity() + "</option>");
                        }
                    %>
                </select>
            </div>
            <div class="block form-group">
                <label for="select">Вышестоящее УВЗ</label>
                <select id="select" name="parentId" class="label-style">
                    <%
                        for(Institution institution :  WorkingWithChildData.getInstitutions()){
                            out.print("<option value='" + institution.getId() + "'>" +
                                    institution.getName() + "</option>");
                        }
                    %>
                </select>
            </div>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Зарегистрироваться</button>
        </div>
        <p class="text-center"><a href="/login">Назад</a></p>
    </form>

</div>
</body>
</html>
