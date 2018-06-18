<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link href="../css/bootstrap.css" rel="stylesheet">
        <link href="../css/bootstrap-theme.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="../js/bootstrap.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body{
                background-color: #9acfea;
            }
            #welcome,#login,#reg{
                background-color: #f5f5f5;
            }
            #superfight{
                font-family: "Impact";
            }
            #desc{
                font-family: "Arial Black";
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <img src="../images/bg_main.jpg" class="img-responsive" alt="Responsive image">
            </div>
            <div class="row">
                <div class="col-md-12" id="login">
                    <form name="f" method="post" action="/loginForm" class="form-inline">
                        <br>
                        <p class="text-center">
                            <input type="text" name="username" required class="form-control" id="InputLogin" placeholder="Логин"></input>
                            <input type="password" name="password" required class="form-control" id="InputPassword" placeholder="Пароль"></input>
                            <button type="submit" id="signin" class="btn btn-primary">Вход</button>
                            <!-- Триггер кнопка модали-->
                            <button type="button" name="submit" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                                Зарегистрироваться
                            </button>
                            <button type="button" id="facebook" class="btn btn-primary">
                                via Facebook
                            </button>

                        </p>
                    </form>
                    <form method="post" id="fb" action="/signin/facebook"></form>
                    <script>
                        $('#facebook').click(function () {
                            $('#fb').submit();
                        });
                    </script>
                </div>
            </div>
            <div class="row">
                <div id="welcome" class="col-md-12">
                    <h1 id="superfight" class="text-center">Superfight</h1>
                    <p class="text-center" id="desc">Добро пожаловать в Superfight! Зарегистрируйтесь и начните сокрушать врагов.</p>
                </div>
            </div>
        </div>
        <!-- Модальное окно -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="/reg" class="form-horizontal">
                    <!-- Заголовок модального окна -->
                    <div class="modal-header">
                        <button type="button" id="krestik" class="close" data-dismiss="modal">×</button>
                        <h4 class="modal-title" id="myModalLabel">Регистрация</h4>
                    </div>
                    <!-- Основная часть модального окна, содержащая форму для регистрации -->
                    <div class="modal-body">
                            <!-- Блок для ввода логина -->
                            <div id="formgroup-login-reg" class="form-group has-feedback">
                                <label for="login" class="control-label col-xs-3">Логин:</label>
                                <div class="col-xs-6">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input type="text" class="form-control" id="InputLoginReg" required="required" name="login" pattern="{6,20}">
                                    </div>
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </div>
                            <!-- Блок для ввода email -->
                            <div id="formgroup-email-reg" class="form-group has-feedback">
                                <label for="email" class="control-label col-xs-3">Email:</label>
                                <div class="col-xs-6">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <input type="email" id="InputEmailReg" class="form-control" required="required" name="mail">
                                    </div>
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </div>
                            <!-- Конец блока для ввода email-->
                            <!-- Блок для ввода password -->
                            <div id="formgroup-password-reg" class="form-group has-feedback">
                                <label for="password" class="control-label col-xs-3">Пароль:</label>
                                <div class="col-xs-6">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-asterisk"></i></span>
                                        <input type="password" id="InputPasswordReg" class="form-control" required="required" name="password" pattern="{8,20}">
                                    </div>
                                    <span class="glyphicon form-control-feedback"></span>
                                </div>
                            </div>
                            <!-- Конец блока для ввода password-->
                    </div>
                    <!-- Нижняя часть модального окна -->
                    <div class="modal-footer">
                        <button type="button" id="cancel" class="btn btn-default" data-dismiss="modal">Отмена</button>
                        <button id="save" type="submit" class="btn btn-primary">Регистрация</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            $(function() {
                //при нажатии на кнопку с id="save"
                $('#save').click(function() {
                    //переменная formValid
                    //перебрать все элементы управления input
                    $('input').each(function() {
                        //найти предков, которые имеют класс .form-group, для установления success/error
                        var formGroup = $(this).parents('.form-group');
                        //найти glyphicon, который предназначен для показа иконки успеха или ошибки
                        var glyphicon = formGroup.find('.form-control-feedback');
                        //для валидации данных используем HTML5 функцию checkValidity
                        if (this.checkValidity()) {
                            //добавить к formGroup класс .has-success, удалить has-error
                            formGroup.addClass('has-success').removeClass('has-error');
                            //добавить к glyphicon класс glyphicon-ok, удалить glyphicon-remove
                            glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-remove');
                        } else {
                            //добавить к formGroup класс .has-error, удалить .has-success
                            formGroup.addClass('has-error').removeClass('has-success');
                            //добавить к glyphicon класс glyphicon-remove, удалить glyphicon-ok
                            glyphicon.addClass('glyphicon-remove').removeClass('glyphicon-ok');
                            //отметить форму как невалидную
                        }
                    });
                });
                $('#cancel').click(function () {
                    //перебрать все элементы управления input
                    $('input').each(function () {
                        //найти предков, которые имеют класс .form-group, для установления success/error
                        var formGroup = $(this).parents('.form-group');
                        //найти glyphicon, который предназначен для показа иконки успеха или ошибки
                        var glyphicon = formGroup.find('.form-control-feedback');
                        //для валидации данных используем HTML5 функцию checkValidity
                        //добавить к formGroup класс .has-success, удалить has-error
                        formGroup.removeClass('has-success').removeClass('has-error');
                        //добавить к glyphicon класс glyphicon-ok, удалить glyphicon-remove
                        glyphicon.removeClass('glyphicon-ok').removeClass('glyphicon-remove');
                        //добавить к formGroup класс .has-error, удалить .has-success
                        formGroup.removeClass('has-error').removeClass('has-success');
                        //добавить к glyphicon класс glyphicon-remove, удалить glyphicon-ok
                        glyphicon.removeClass('glyphicon-remove').removeClass('glyphicon-ok');
                        //отметить форму как невалидную
                        $('#InputLoginReg').val("");
                        $('#InputEmailReg').val("");
                    });
                });
            });
        </script>
    </body>
</html>