<%@ page import="java.util.List" %>
<%@ page import="childDB.entities.Child" %>
<%@ page import="childDB.entities.Institution" %>
<%@ page import="childDB.dao.WorkingWithChildData" %>
<%@ page import="childDB.entities.Location" %>
<%@ page import="childDB.data.ChildData" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="childDB.model.Model" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 09.04.2018
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Список детей</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <style type="text/css">
        .div-style {
            margin: 35px;
        }
        .label-style {
            margin:10px;
            height: 35px;
        }
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
        .demo-card-wide.mdl-card {
            width: 512px;
            padding: 35px;
        }
        .demo-card-wide > .mdl-card__title {
            color: #fff;
            height: 176px;
        }
        .demo-card-wide > .mdl-card__menu {
            color: #fff;
        }
        .td-style {
            border: 1px gray;
        }
    </style>
</head>

<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">Список детей</span>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation. We hide it in small screens. -->
            <nav class="mdl-navigation mdl-layout--large-screen-only">
                <a class="mdl-navigation__link" href="/childrenList">Главная</a>
                <a class="mdl-navigation__link" href="/statistic">Статистика</a>
                <a class="mdl-navigation__link" href="/report">Отчет</a>
                <!-- Right aligned menu below button -->
                <button id="demo-menu-lower-right"
                        class="mdl-button mdl-js-button mdl-button--icon">
                    <i class="material-icons">more_vert</i>
                </button>

                <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                    for="demo-menu-lower-right">
                    <li class="mdl-menu__item"><a href="/profileSettings"/>Настройки</li>
                    <li class="mdl-menu__item"><a href="/login">Выйти</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="mdl-layout__drawer">
        <span class="mdl-layout-title">Управление</span>
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="/childrenList?db=<% Model mod = Model.getInstance(); out.print(mod.getUser().getInstId());%>">Моя БД</a>
            <a class="mdl-navigation__link" href="/childrenList?db=-1">Все доступные</a>
            </hr>
            <%
                List<Institution> institutions = (List<Institution>) WorkingWithChildData.getInstitutions();
                for(int i = 0; i < institutions.size(); i++){
                    Model model = Model.getInstance();
                    if( institutions.get(i).getParentId() == model.getUser().getInstId())
                        out.println("<a class=\"mdl-navigation__link\" href='/childrenList?db=" + institutions.get(i).getId() + "'>" + institutions.get(i).getName() + "</a>");
                }
                out.println("<a class=\"mdl-navigation__link\" href='/childrenList?db=-2' >" + "Архив" + "</a>");
                out.println("<a class=\"mdl-navigation__link\" href='/childrenList?db=-3' >" + "Корзина" + "</a>");
            %>
        </nav>
    </div>
   <!-- <a href='/childrenList?db=<% out.print(ChildData.instId); %>'/>-->
    <main class="mdl-layout__content">
        <div class="page-content">
            <table border="0">
                <tr>
                    <td valign="top" class="td-style"><style>
                        .demo-list-item {
                            align-content: flex-start;
                            width: 300px;
                        }
                    </style>

                        <%
                            List<Child> children = (List<Child>) request.getAttribute("children");
                            if (children != null) {
                                out.println("<ul class=\"demo-list-item mdl-list\">");
                                for (Child s : children) {
                                    out.println("<li class=\"mdl-list__item\"><a class=\"mdl-navigation__link\" href='/childrenList?id="
                                            + s.getID() + "&db=" + ChildData.instId + "'>" + s.getFirstName() + " "  + s.getLastName() + "</a></li>");
                                }
                                out.println("</ul>");
                            } else out.println("<p>There are no children yet!</p>");
                        %>
                    </td>
                    <td valign="top">
                        <form  method="post">
                            <%
                                Child child = (Child) request.getAttribute("child");
                            %>
                            <div class="div-style">
                                <%
                                    if(request.getAttribute("adding") !=  null) out.print(request.getAttribute("adding"));
                                %>
                                <label>Личные данные</label>
                                <button style="margin-right: 10px;" class="mdl-button mdl-js-button mdl-button--primary" name="action" value="add">Добавить
                                </button>

                            </div>
                            <div class="demo-card-wide mdl-card mdl-shadow--2dp">
                                <div class="form-group">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="firstName" class="mdl-textfield__input" type="text" id="sample31"
                                               <%
                                                    if(child!=null)
                                                        out.print("value=" + child.getFirstName());
                                               %>
                                        >
                                        <label class="mdl-textfield__label" for="sample31">Имя</label>
                                    </div>
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="lastName" class="mdl-textfield__input" type="text" id="sample32"
                                            <%
                                                    if(child!=null)
                                                        out.print("value=" + child.getLastName());
                                            %>
                                        >
                                        <label class="mdl-textfield__label" for="sample32">Фамилия</label>
                                    </div>
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input name="middleName" class="mdl-textfield__input" type="text" id="sample33"
                                            <%
                                                    if(child!=null)
                                                        out.print("value=" + child.getMiddleName());
                                            %>
                                        >
                                        <label class="mdl-textfield__label" for="sample33">Отчество</label>
                                    </div>
                                    <div>
                                        <label>Пол</label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-1">
                                            <input name="isMan" type="radio" id="option-1" class="mdl-radio__button" name="options" value="1" checked>
                                            <span class="mdl-radio__label">Мужской</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-2">
                                            <input name="isMan" type="radio" id="option-2" class="mdl-radio__button" name="options" value="2"
                                                <%
                                                    if(child!=null)
                                                        if(!child.isMan())
                                                            out.print("checked");
                                               %>>
                                            <span class="mdl-radio__label">Женский</span>
                                        </label>
                                    </div>
                                    <label for="date">Дата рождения: </label>
                                    <input type="date" id="date" name="date" max="2018-05-03" min="1970-01-01"
                                            <%
                                                if(child!=null) {
                                                    SimpleDateFormat formatForDateNow = new SimpleDateFormat("yyyy-MM-dd");
                                                    out.print("value='" + formatForDateNow.format(child.getBirthday()) + "'");
                                                }
                                                else{
                                                    out.print("value='2018-04-29'");
                                                }
                                            %>/>
                                </div>
                            </div>
                            <div class="div-style">
                                <label>Обучение</label>
                            </div>
                            <div class="demo-card-wide mdl-card mdl-shadow--2dp">
                                <div class="form-group">
                                    <div class="block form-group">
                                        <label for="select">Учебное учреждение</label>
                                        <select name="inst" id="select" class="label-style">
                                            <%
                                                for(Institution institution :  WorkingWithChildData.getInstitutions()){
                                                    if(child != null) {
                                                        if (child.getInstID() == institution.getId())
                                                            out.print("<option selected value='" + institution.getId() + "'>" +
                                                                    institution.getName() + "</option>");
                                                        else {
                                                            out.print("<option value='" + institution.getId() + "'>" +
                                                                    institution.getName() + "</option>");
                                                        }
                                                    } else {
                                                        out.print("<option value='" + institution.getId() + "'>" +
                                                                institution.getName() + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="block form-group">
                                        <label for="select8">Диагнозы</label>
                                        <select name="diagnoses" id="select8" multiple="multiply" size="4" class="label-style">
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
                                    </div>
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">

                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input name="class" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4"
                                                    <%
                                                    if(child!=null)
                                                        out.print("value=" + child.getClassOrCource());
                                                    else out.print("value='0'");
                                                %>>
                                                <label class="mdl-textfield__label" for="sample4">Класс или курс</label>
                                                <span class="mdl-textfield__error">Это не число</span>
                                            </div>
                                    </div>
                                    <div class="block form-group">
                                        <label for="select7">Инвалидность</label>
                                        <select name="disability" id="select7" class="label-style">
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
                                    </div>
                                    <div class="div-style">
                                        <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-2">
                                            <input type="checkbox" id="checkbox-2" class="mdl-checkbox__input"
                                                <%
                                                    if(child!=null)
                                                        if(child.isNeedsHelp())
                                                            out.print("checked");
                                                %>>
                                            <span class="mdl-checkbox__label">Нуждается во вспомогательных средствах передвижения</span>
                                        </label>
                                    </div>
                                    <div class="block form-group">
                                        <label for="select6">Помощь в ЦКРОиР</label>
                                        <select name="formOfHelpInCenter" id="select6" class="label-style" >
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
                                    </div>
                                    <div class="block form-group">
                                        <label for="select5">Помощь в других учреждениях</label>
                                        <select name="formOfHelpInSchool" id="select5" class="label-style" >
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
                                    </div>

                                </div>
                            </div>
                            <div class="div-style">
                                <label>Сведения о семье</label>
                            </div>
                            <div class="demo-card-wide mdl-card mdl-shadow--2dp">
                                <div>
                                    <label for="select4">Город</label>
                                    <select name="location" id="select4" class="label-style" >
                                        <%
                                            int loc = 0;
                                            if(child != null)
                                            {
                                                loc = child.getCity();
                                            }
                                            ArrayList<Location> locations = WorkingWithChildData.getLocations();
                                            for(int i = 0; i < locations.size(); i++){
                                                if(loc == i) {
                                                    out.print("<option selected value='" + locations.get(i).getID() + "'>" +
                                                            locations.get(i).getCity() + "</option>");
                                                }
                                                else {
                                                    out.print("<option value='" + locations.get(i).getID() + "'>" +
                                                            locations.get(i).getCity() + "</option>");
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input name="address" class="mdl-textfield__input" type="text" id="sample3"
                                        <%
                                                    if(child!=null)
                                                         out.print("value=" + child.getAddress());
                                        %>>
                                    <label class="mdl-textfield__label" for="sample3">Адрес</label>
                                </div>
                                <div>
                                    <label for="select3" >Форма опеки</label>
                                    <select name="formOfCustody" id="select3" class="label-style">
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
                                </div>
                                <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-1">
                                    <input name="isFullFamily" type="checkbox" id="switch-1" class="mdl-switch__input"
                                        <%
                                                    if(child!=null)
                                                        if(child.isCompleteFamily())
                                                            out.print("checked");
                                        %>>
                                    <span class="mdl-switch__label">Полная семья</span>
                                </label>
                                <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-2">
                                    <input name="IsLargeFamily" type="checkbox" id="switch-2" class="mdl-switch__input"
                                        <%
                                                    if(child!=null)
                                                        if(child.isLargeFamily())
                                                            out.print("checked");
                                        %>>
                                    <span class="mdl-switch__label">Многодетная</span>
                                </label>
                                <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-3">
                                    <input name="IsLowIncomeFamily" type="checkbox" id="switch-3" class="mdl-switch__input"
                                        <%
                                                    if(child!=null)
                                                        if(child.isLowIncomeFamily())
                                                            out.print("checked");
                                        %>>
                                    <span class="mdl-switch__label">Малообеспеченная</span>
                                </label>
                                <div class="block form-group" >
                                    <label for="select2">Мать</label>
                                    <select name="mother" id="select2" multiple="multiply" size="4" class="label-style">
                                        <%
                                            List<Integer> mother = new ArrayList<>();
                                            if(child != null)
                                                mother = child.getMother();

                                            for(int i = 0; i < ChildData.parentInfo.size(); i++){
                                                if(mother.contains(i))
                                                    out.print("<option value='" + i + "' selected>" + ChildData.parentInfo.get(i) + "</option>");
                                                else
                                                    out.print("<option value='" + i + "'>" + ChildData.parentInfo.get(i) + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="block form-group">
                                    <label for="select1">Отец</label>
                                    <select name="father" id="select1" multiple="multiply" size="4" class="label-style">
                                        <%
                                            List<Integer> father = new ArrayList<>();
                                            if(child != null)
                                                father = child.getFather();

                                            for(int i = 0; i < ChildData.parentInfo.size(); i++){
                                                if(father.contains(i))
                                                    out.print("<option value='" + i + "' selected>" + ChildData.parentInfo.get(i) + "</option>");
                                                else
                                                    out.print("<option value='" + i + "'>" + ChildData.parentInfo.get(i) + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <input name="address" class="mdl-textfield__input" type="text" id="sample5" multiple="multiple" size="3"
                                            <%
                                                if(child != null)
                                                    out.print("value=" + child.getNotes());
                                            %>>
                                            <label class="mdl-textfield__label" for="sample5">Примечания</label>
                                        </div>


                            </div>
<div class="div-style">
    <div>
        <label for="archive" >Причина</label>
        <select name="archiveList" id="archive" class="label-style">
            <%
                for(int i = 0; i < ChildData.archiveList.size(); i++){
                        out.print("<option value='" + i + "'>" + ChildData.archiveList.get(i) + "</option>");
                }
            %>
        </select>
    </div>
    <button class="mdl-button mdl-js-button mdl-button--primary" name="action" type="submit" value="archive"
            <%
                Model model = Model.getInstance();
                if(ChildData.instId != model.getUser().getInstId())
                    out.print("disabled");
            %>>В архив</button>
    <button class="mdl-button mdl-js-button mdl-button--accent" id="show-dialog" type="button"
            <%
                if(ChildData.instId != model.getUser().getInstId())
                    out.print("disabled");
            %>>Удалить</button>
    <dialog class="mdl-dialog">
        <div class="mdl-dialog__content">
            <h6>Вы действительно хотите удалить эту карточку?</h6>
        </div>
        <div class="mdl-dialog__actions">
            <button type="submit" class="mdl-button" name="action" value="delete">Продолжить</button>
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
        dialog.querySelector('.OK').addEventListener('click', function(){
            dialog.closest();
        });
    </script>
    <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" type="submit" name="action" value="save"
    <%
        if(ChildData.instId != model.getUser().getInstId())
            out.print("disabled");
    %>>Сохранить</button></div>
</form>







</td>
</tr>
</table>
        </div>
    </main>
</div>
</body>
</html>
