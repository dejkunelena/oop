<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 22.04.2018
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    </main>
</div>

</body>
</html>
