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
    <link rel="stylesheet" href="./material.min.css">
    <script src="./material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .login-form {
            width: 330px;
            margin: 30px auto;
        }
        .login-form h2 {
            font-size: 30px;
            margin-bottom: 15px;
            text-align: center;
        }
        .login-form form {
            background: #f7f7f7;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            margin-bottom: 10px;
            padding: 30px;
        }
        .login-form .form-control, .login-form .btn {
            min-height: 38px;
        }
        .login-form input[type="email"] {
            border-radius: 2px 2px 0 0;
        }
        .login-form input[type="password"] {
            border-radius: 0 0 2px 2px;
            margin-top: -1px;
        }
        .login-form input.form-control:focus {
            position: relative;
            z-index: 2;
        }
        .login-form .btn {
            font-size: 15px;
            font-weight: bold;
            border-radius: 2px;
        }
    </style>
</head>
<body>
<div class="login-form">

    <form method="post">
        <h2>Войти</h2>
        <div class="form-group">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Логин" required="required" name="login">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Пароль" required="required" name="password">
            </div>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Войти</button>
        </div>
        <p class="text-center"><a href="/registration">Зарегистрироваться</a></p>
    </form>
    <p class="text-center"><a href="/childList">Перейти к списку</a></p>

</div>
</body>
</html>