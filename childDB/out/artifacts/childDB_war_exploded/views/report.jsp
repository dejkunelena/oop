<%@ page import="childDB.entities.Child" %>
<%@ page import="java.util.List" %>
<%@ page import="childDB.data.ChildData" %>
<%@ page import="childDB.dao.WorkingWithChildData" %>
<%@ page import="childDB.entities.Location" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="childDB.model.Model" %>
<%@ page import="childDB.entities.User" %>
<%@ page import="childDB.entities.Institution" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 22.04.2018
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Отчеты</title>
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
        .div-style {
            width: 40px;
        }
        .td_style {
         text-align: left;
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
        %>
        <button class="mdl-button mdl-js-button mdl-button--primary"><a href="#zatemnenie">Параметры</a>
        </button>
        <div align="center">
            <table class="mdl-data-table mdl-js-data-table">
                <thead>
                <tr align="left">
                    <th></th>
                    <th class="mdl-data-table__cell--non-numeric">Фамилия</th>
                    <th >Имя</th>
                    <th class="mdl-data-table__cell--non-numeric">Отчество</th>
                </tr>
                </thead>
                <tbody>
                <%  List<Child> children = (List<Child>) request.getAttribute("children");
                    if (children != null) {
                        for (int i = 0; i < children.size(); i++) {
                            out.println("<tr align=\"left\"><td class=\"mdl-data-table__cell--non-numeric\">" +
                                    "<a href='/childrenList?id=" + children.get(i).getID() + "&db=" + ChildData.instId + "'/>" + i +"</td>");
                            out.print("<td class='td_style'>" + children.get(i).getLastName() + "</td>");
                            out.print("<td>" + children.get(i).getFirstName() + "</td>");
                            out.print("<td>" + children.get(i).getMiddleName() + "</td></tr>");
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
        <div id="zatemnenie">
            <div id="okno">
                <%
                    Model model = Model.getInstance();
                    User user = model.getUser();
                    ArrayList<Institution> institutions = WorkingWithChildData.getInstitutions();
                    ArrayList<Institution> newInstList = new ArrayList<>();
                    for (Institution inst: institutions ) {
                        if(inst.getId() == user.getInstId() || inst.getParentId() == user.getInstId())
                            newInstList.add(inst);
                    }
                    if(request.getAttribute("child")!=null)
                        out.print(request.getAttribute("child"));



                %>
                <form method="get">
                    <h3>Параметры выбора</h3>
                    <table class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp" width="600px" align="center">
                        <thead>
                        <tr>
                            <th></th>
                            <th class="mdl-data-table__cell--non-numeric">Параметр</th>
                            <th>Значение</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="instCB">
                                    <input name="instCB" type="checkbox" id="instCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Учебное заведение</td>
                            <td>
                                <select name="inst" id="select10" class="label-style">
                                    <option value="0">Все</option>
                                    <%
                                        for(int i = 0; i < newInstList.size(); i++){
                                            out.print("<option value='" + newInstList.get(i).getId() + "'>" + newInstList.get(i).getName() + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="disabilityCB">
                                    <input name="disabilityCB" type="checkbox" id="disabilityCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Инвалидность</td>
                            <td><select name="disability" id="select7" class="label-style">
                                <%
                                    for(int i = 0; i < ChildData.disability.size(); i++){
                                        out.print("<option value='" + i + "'>" + ChildData.disability.get(i) + "</option>");
                                    }
                                %>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="helpInTheCenterCB">
                                    <input name="helpInTheCenterCB" type="checkbox" id="helpInTheCenterCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Помощь в ЦКРОиР</td>
                            <td>
                                <select name="formOfHelpInCenter" id="select6" class="label-style" >
                                    <%
                                        for(int i = 0; i < ChildData.formOfHelpInCenter.size(); i++){
                                            out.print("<option value='" + i + "'>" + ChildData.formOfHelpInCenter.get(i) + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="helpInSchoolCB">
                                    <input name="helpInSchoolCB" type="checkbox" id="helpInSchoolCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Помощь в других учреждениях</td>
                            <td>
                                <select name="formOfHelpInSchool" id="select5" class="label-style" >
                                    <%
                                        for(int i = 0; i < ChildData.formOfHelpInSchool.size(); i++){
                                            out.print("<option value='" + i + "'>" + ChildData.formOfHelpInSchool.get(i) + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="needsHelpCB">
                                    <input name="needsHelpCB" type="checkbox" id="needsHelpCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Нуждается в помощи</td>
                            <td><label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-2">
                                <input name="isNeedsHelp" type="checkbox" id="checkbox-2" class="mdl-checkbox__input">
                                <span class="mdl-checkbox__label"></span>
                            </label></td>
                        </tr>

                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="isManCB">
                                    <input name="isManCB" type="checkbox" id="isManCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Пол</td>
                            <td><label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-1">
                                <input name="isMan" type="radio" id="option-1" class="mdl-radio__button" name="options" value="1" checked>
                                <span class="mdl-radio__label">Мужской</span>
                            </label>
                                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-2">
                                    <input name="isMan" type="radio" id="option-2" class="mdl-radio__button" name="options" value="2">
                                    <span class="mdl-radio__label">Женский</span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="locationCB">
                                    <input name="locationCB" type="checkbox" id="locationCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>

                            <td class="mdl-data-table__cell--non-numeric">Город</td>
                            <td><select name="location" id="select4" class="label-style" >
                                <%
                                    ArrayList<Location> locations = WorkingWithChildData.getLocations();
                                    for(int i = 0; i < locations.size(); i++){
                                        out.print("<option value='" + locations.get(i).getID() + "'>" +
                                                locations.get(i).getCity() + "</option>");
                                    }
                                %>
                            </select></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="formOfCustodyCB">
                                    <input name="formOfCustodyCB" type="checkbox" id="formOfCustodyCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Форма опеки</td>
                            <td> <select name="formOfCustody" id="select3" class="label-style">
                                <%
                                    for(int i = 0; i < ChildData.formOfCustody.size(); i++){
                                        out.print("<option value='" + i + "'>" + ChildData.formOfCustody.get(i) + "</option>");
                                    }
                                %>
                            </select></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="isFullFamilyCB">
                                    <input name="isFullFamilyCB" type="checkbox" id="isFullFamilyCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Полная семья</td>
                            <td>
                                <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-1">
                                    <input name="isFullFamily" type="checkbox" id="switch-1" class="mdl-switch__input">
                                    <span class="mdl-switch__label"></span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="isLargeFamilyCB">
                                    <input name="isLargeFamilyCB" type="checkbox" id="isLargeFamilyCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Многодетная</td>
                            <td> <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-2">
                                <input name="IsLargeFamily" type="checkbox" id="switch-2" class="mdl-switch__input">
                                <span class="mdl-switch__label"></span>
                            </label></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="isLowIncomeCB">
                                    <input name="isLowIncomeCB" type="checkbox" id="isLowIncomeCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Малообеспеченная</td>
                            <td align="right"><label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-3">
                                <input name="IsLowIncomeFamily" type="checkbox" id="switch-3" class="mdl-switch__input">
                                <span class="mdl-switch__label"></span>
                            </label></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="motherCB">
                                    <input name="motherCB" type="checkbox" id="motherCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Мать</td>
                            <td>
                                <select name="mother"  multiple="multiply" size="4" class="label-style">
                                    <%
                                        for(int i = 0; i < ChildData.parentInfo.size(); i++){
                                            out.print("<option value='" + i + "'>" + ChildData.parentInfo.get(i) + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="fatherCB">
                                    <input name="fatherCB" type="checkbox" id="fatherCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Отец</td>
                            <td>
                                <select name="father" id="select2" multiple="multiply" size="4" class="label-style">
                                        <%
                                for(int i = 0; i < ChildData.parentInfo.size(); i++){
                                    out.print("<option value='" + i + "'>" + ChildData.parentInfo.get(i) + "</option>");
                                }
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="diagnosesCB">
                                    <input name="diagnosesCB" type="checkbox" id="diagnosesCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Диагнозы</td>
                            <td>
                                <select name="diagnoses" id="select8" multiple="multiply" size="2" class="label-style">
                                    <%
                                        List<Integer> diagnoses = new ArrayList<>();
                                        for(int i = 0; i < ChildData.diagnoses.size(); i++){
                                            out.print("<option value='" + i + "'>" + ChildData.diagnoses.get(i) + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="classCB">
                                    <input name="classCB" type="checkbox" id="classCB" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Класс</td>
                            <td>
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label div-style">
                                    <input name="class" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
                                    <label class="mdl-textfield__label" for="sample4"></label>
                                    <span class="mdl-textfield__error">Это не число</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="dateOfInput">
                                    <input name="dateOfInput" type="checkbox" id="dateOfInput" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Поставлен на учет</td>
                            <td>
                                <label for="firstDate">с </label>
                                <input name="firstDate" id="firstDate" type="date" value='2018-04-29'/>
                                <label for="secondDate">по </label>
                                <input name="secondDate" id="secondDate" type="date" value='2018-04-29'/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="age">
                                    <input name="age" type="checkbox" id="age" class="mdl-checkbox__input">
                                    <span class="mdl-checkbox__label"></span>
                                </label>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">Возраст</td>
                            <td>
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label div-style">
                                    <input name="age1" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="age1">
                                    <label class="mdl-textfield__label" for="age1">с</label>
                                    <span class="mdl-textfield__error">Это не число</span>
                                </div>
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label div-style" >
                                    <input name="age2" class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="age2">
                                    <label class="mdl-textfield__label" for="age2">по</label>
                                    <span class="mdl-textfield__error">Это не число</span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div>
                        <button type="submit" name="action" value="show" class="mdl-button mdl-js-button mdl-button--primary">Перейти к статистике</button>
                    </div>
                </form>
            </div>
        </div>



    </main>
</div>

</body>
</html>
