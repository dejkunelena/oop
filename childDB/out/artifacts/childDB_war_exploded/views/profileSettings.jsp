<%@ page import="childDB.entities.User" %>
<%@ page import="javax.naming.InsufficientResourcesException" %>
<%@ page import="childDB.entities.Institution" %>
<%@ page import="org.omg.PortableInterceptor.INACTIVE" %>
<%@ page import="javax.print.attribute.IntegerSyntax" %>
<%@ page import="childDB.data.ChildData" %>
<%@ page import="childDB.dao.WorkingWithChildData" %>
<%@ page import="childDB.dao.WorkingWithChild" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 29.04.2018
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Настройки профиля</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <link rel="stylesheet" href="./material.min.css">
    <link rel="stylesheet" href="https://ssl.gstatic.com/docs/script/css/add-ons1.css">
    <script src="./material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
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
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">Настройки профиля</span>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation. We hide it in small screens. -->
            <nav class="mdl-navigation mdl-layout--large-screen-only">
                <a class="mdl-navigation__link" href="/childrenList">Главная</a>
                <a class="mdl-navigation__link" href="/statistic">Статистика</a>
                <a class="mdl-navigation__link" href="/report">Отчеты</a>
                <!-- Right aligned menu below button -->
                <button id="demo-menu-lower-right"
                        class="mdl-button mdl-js-button mdl-button--icon">
                    <i class="material-icons">more_vert</i>
                </button>

                <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                    for="demo-menu-lower-right">
                    <li class="mdl-menu__item">Настройки</li>
                    <li class="mdl-menu__item">Выйти</li>
                </ul>
            </nav>
        </div>

    </header>
    <main class="mdl-layout__content">
        <div class="registration-form">
            <%
                User user = null;
                Institution institution = null;
                if(request.getAttribute("user") != null && request.getAttribute("inst") != null) {
                    user = (User) request.getAttribute("user");
                    institution = (Institution) request.getAttribute("inst");
                }
            %>
            <form action="/examples/actions/confirmation.php" method="post">
                <h2>Настройки</h2>
                <div class="form-group">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Логин" required="required"
                               <%
                                 if(user != null){
                                     out.print("value=" + user.getLogin());
                                 }
                               %>
                        >
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Пароль" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Подтвердить пароль" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Почта" required="required"
                            <%
                                 if(user != null){
                                     out.print("value=" + user.getEmail());
                                 }
                               %>>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Учебное заведение" required="required"
                            <%
                                 if(user != null){
                                     out.print("value=" + institution.getName());
                                 }
                               %>>
                    </div>

                    <div class="block form-group">
                        <label for="select1">Тип УВЗ</label>
                        <select id="select1">
                            <%
                                for(int i = 0; i < ChildData.instTypes.size();i++){
                                    if(institution != null && institution.getId() == i)
                                        out.print("<option selected value=" + i +">" + ChildData.instTypes.get(i) + "</option>");
                                    else
                                        out.print("<option value=" + i + ">" + ChildData.instTypes.get(i) + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="block form-group">
                        <label for="selectу">Город</label>
                        <select id="selectу">
                            <%
                                for(int i = 0; i < WorkingWithChildData.getLocations().size(); i++){
                                    if(institution != null && institution.getLocationId() == WorkingWithChildData.getLocations().get(i).getID())
                                        out.print("<option selected value=" + i + ">" + WorkingWithChildData.getLocations().get(i) + "</option>");
                                    else
                                        out.print("<option value=" + i + ">" + WorkingWithChildData.getLocations().get(i) + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="block form-group">
                        <label for="select2">Вышестоящее УВЗ</label>
                        <select id="select2">
                            <%
                                for(int i = 0; i < WorkingWithChildData.getInstitutions().size(); i++){
                                    if(institution != null && institution.getParentId() == WorkingWithChildData.getInstitutions().get(i).getParentId())
                                        out.print("<option selected value=" + i + ">" + WorkingWithChildData.getInstitutions().get(i) + "</option>");
                                    else
                                        out.print("<option value=" + i + ">" + WorkingWithChildData.getInstitutions().get(i) + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <button id="show-dialog"  type="submit" class="btn btn-primary btn-block">Сохранить</button>
                    <dialog class="mdl-dialog">
                        <h4 class="mdl-dialog__title">Подтвердите изменения паролем</h4>
                        <div class="mdl-dialog__content">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Пароль" required="required" name="verPassword">
                            </div>
                        </div>
                        <div class="mdl-dialog__actions">
                            <button type="submit" class="mdl-button" name="action" value="save">Продолжить</button>
                            <button type="button" class="mdl-button close">Назад</button>
                        </div>
                    </dialog>
                    <script>
                        var dialog = document.querySelector('dialog');
                        var showDialogButton = document.querySelector('#show-dialog');
                        if (! dialog.showModal) {
                            dialogPolyfill.registerDialog(dialog);
                        }
                        showDialogButton.addEventListener('click', function() {
                            dialog.showModal();
                        });
                        dialog.querySelector('.close').addEventListener('click', function() {
                            dialog.close();
                        });
                    </script>
                </div>
                <p class="text-center"><a href="/childrenList">Назад</a></p>
            </form>
        </div>
    </main>
</div>


</body>
</html>
