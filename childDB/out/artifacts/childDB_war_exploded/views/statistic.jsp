<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="childDB.data.ChildData" %>
<%@ page import="childDB.entities.Location" %>
<%@ page import="childDB.dao.WorkingWithChildData" %>
<%@ page import="childDB.model.Model" %>
<%@ page import="childDB.entities.User" %>
<%@ page import="childDB.entities.Institution" %>
<%@ page import="childDB.entities.Child" %>
<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 22.04.2018
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Статистика</title>
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
         #zatemnenie {
             background: rgba(102, 102, 102, 0.5);
             width: 100%;
             height: 100%;
             position: absolute;
             top: 0;
             left: 0;
             display: none;
         }
        #okno {
            width: 700px;
            height: 700px;
            text-align: center;
            padding: 15px;
            color: #0000cc;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            margin: auto;
            background: #fff;
        }
        #zatemnenie:target {display: block;}
        .close {
            display: inline-block;
            border: 1px solid #0000cc;
            color: #0000cc;
            padding: 0 12px;
            margin: 10px;
            text-decoration: none;
            background: #f2f2f2;
            font-size: 14pt;
            cursor:pointer;
        }
        .close:hover {background: #e6e6ff;}
    </style>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">Статистика</span>
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
        <%    if(request.getAttribute("child")!=null)
                        out.print(request.getAttribute("child"));
                ArrayList<String[]> data;
              if(request.getAttribute("data") != null){
                  data = (ArrayList<String[]>) request.getAttribute("data");
              }
        %>
        <form method="post">
        <label>Период</label>
                <label for="firstDate">с </label>
                <input name="firstDate" id="firstDate" type="date" value='2018-04-29'/>
                <label for="secondDate">по </label>
                <input name="secondDate" id="secondDate" type="date" value='2018-04-29'/>
             <button class="mdl-button mdl-js-button mdl-button--primary" name="action" value="add">Далее
            </button>
        </form>
    </main>
</div>

</body>
</html>
