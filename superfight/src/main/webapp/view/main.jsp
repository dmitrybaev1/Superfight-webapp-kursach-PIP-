<!--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>-->
<!--<%@ page contentType="text/html;charset=UTF-8" language="java" %>-->
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
            #menu,#title,#aboutplace,#statsplace,#otstup{
                background-color: #f5f5f5;
            }
            #superfight{
                font-family: "Impact";
            }
            #abouttext,#statstext,#fighttext,#nicktext{
                font-family: "Arial Black";
            }
            #avatar{
                width:15%;
                height: 16%;
            }
            #fightvalue,#classvalue{
                color: #c9302c;
                font-family: "Arial Black";
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div id="title" class="row">
                <h1 id="superfight" class="text-center">Superfight</h1>
            </div>
            <div id="menu" class="row">
                <div class="col-md-12">
                    <div class="btn-group btn-group-justified" role="group">
                        <div class="btn-group">
                            <button type="button" id="about" class="btn btn-default">Об игре</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" id="stats" class="btn btn-default">Мой профиль</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" id="fight" class="btn btn-success">В бой!</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" id="exit" class="btn btn-danger">Выйти</button>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </div>
        <div class="container" id="aboutplace">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-11">
                    <h4 id="abouttext" class="text-left">
                        Пользователю предстоит сражаться против компьютера-бота (программы).
                        Герои обладают определенным кол-вом ХП и урона. Существует вероятность
                        нанести критический урон, или промазать, которая
                        зависит от выбранного героя. Каждый пользователь имеет шкалу опыта и
                        соответствующий уровень в своем профиле. Также вам будет отправлено письмо на
                        указанный почтовый ящик с результатами боя.
                    </h4>
                </div>
                <img src="../images/welcome_to_the_fight.jpg" class="img-rounded center-block" alt="Responsive image">
                <br>
            </div>
        </div>

        <div class="container hidden" id="statsplace">
            <div class="row">
                <div class="col-md-12 text-center">
                    <img id="avatar" src="D:\Изображения\del.jpg" alt="image" class="img-thumbnail">
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="btn-group" role="group" aria-label="...">
                        <button type="button" id="picture1" class="btn btn-default">1</button>
                        <button type="button" id="picture2" class="btn btn-default">2</button>
                        <button type="button" id="picture3" class="btn btn-default">3</button>
                        <button type="button" id="picture4" class="btn btn-default">4</button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h4 id="nicktext" class="text-center">
                        Имя
                    </h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h4 id="fighttext" class="text-center">
                        Боёв всего(выиграно/проиграно)
                    </h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h4 id="fightvalue" class="text-center">
                        0
                    </h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h4 id="classtext" class="text-center">
                        Класс
                    </h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h4 id="classvalue" class="text-center">
                        Новичок
                    </h4>
                </div>
            </div>
            <!--Герой 1-->
            <div class="row">
                <div class="col-md-12"><button type="button" id="hero1" class="btn btn-default btn-lg btn-block">Герой 1 <span id="glyph1" class="glyphicon glyphicon glyphicon-chevron-down"></span></button></div>
                <div id="hero1cont" class="container hidden">
                    <div class="row">
                        <div class="col-md-1"></div>
                        Hero 1
                    </div>
                </div>
            </div>
            <br>
            <!--Герой 2-->
            <div class="row">
                <div class="col-md-12"><button type="button" id="hero2" class="btn btn-default btn-lg btn-block">Герой 2 <span id="glyph2" class="glyphicon glyphicon glyphicon-chevron-down"></span></button></div>
                <div id="hero2cont" class="container hidden">
                    <div class="row">
                        <div class="col-md-1"></div>
                        Hero 2
                    </div>
                </div>
            </div>
            <br>
            <!--Герой 3-->
            <div class="row">
                <div class="col-md-12"><button type="button" id="hero3" class="btn btn-default btn-lg btn-block">Герой 3 <span id="glyph3" class="glyphicon glyphicon glyphicon-chevron-down"></span></button></div>
                <div id="hero3cont" class="container hidden">
                    <div class="row">
                        <div class="col-md-1"></div>
                        Hero 3
                    </div>
                </div>
            </div>
            <br>
            <!--Герой 4-->
            <div class="row">
                <div class="col-md-12"><button type="button" id="hero4" class="btn btn-default btn-lg btn-block">Герой 4 <span id="glyph4" class="glyphicon glyphicon glyphicon-chevron-down"></span></button></div>
                <div id="hero4cont" class="container hidden">
                    <div class="row">
                        <div class="col-md-1"></div>
                        Hero 4
                    </div>
                </div>
            </div>
            <br>
        </div>
        <script>
            $('#about').click(function () {
                $('#aboutplace').removeClass('hidden');
                $('#statsplace').addClass('hidden');
            });
            $('#stats').click(function () {
                $('#aboutplace').addClass('hidden');
                $('#statsplace').removeClass('hidden');
            });
        </script>
        <script>
            $('#picture1').click(function () {
                $('#avatar').attr("src","../images/bg_main.jpg")
            });
            $('#picture2').click(function () {
                $('#avatar').attr("src","../images/bg_test.jpg")
            });
            $('#picture3').click(function () {
                $('#avatar').attr("src","../images/choose.jpg")
            });
            $('#picture4').click(function () {
                $('#avatar').attr("src","../images/for_the_throne.jpg")
            });
        </script>
        <script>
            $('#hero1').click(function () {
               if($('#hero1cont').attr("class")=='container hidden'){
                   $('#hero1cont').removeClass('hidden');
                   $('#glyph1').removeClass('glyphicon glyphicon glyphicon-chevron-down').addClass('glyphicon glyphicon glyphicon-chevron-up');
               }
               else{
                   $('#hero1cont').addClass('hidden');
                   $('#glyph1').removeClass('glyphicon glyphicon glyphicon-chevron-up').addClass('glyphicon glyphicon glyphicon-chevron-down');
               }
            });
            $('#hero2').click(function () {
                if($('#hero2cont').attr("class")=='container hidden'){
                    $('#hero2cont').removeClass('hidden');
                    $('#glyph2').removeClass('glyphicon glyphicon glyphicon-chevron-down').addClass('glyphicon glyphicon glyphicon-chevron-up');
                }
                else{
                    $('#hero2cont').addClass('hidden');
                    $('#glyph2').removeClass('glyphicon glyphicon glyphicon-chevron-up').addClass('glyphicon glyphicon glyphicon-chevron-down');
                }
            });
            $('#hero3').click(function () {
                if($('#hero3cont').attr("class")=='container hidden'){
                    $('#hero3cont').removeClass('hidden');
                    $('#glyph3').removeClass('glyphicon glyphicon glyphicon-chevron-down').addClass('glyphicon glyphicon glyphicon-chevron-up');
                }
                else{
                    $('#hero3cont').addClass('hidden');
                    $('#glyph3').removeClass('glyphicon glyphicon glyphicon-chevron-up').addClass('glyphicon glyphicon glyphicon-chevron-down');
                }
            });
            $('#hero4').click(function () {
                if($('#hero4cont').attr("class")=='container hidden'){
                    $('#hero4cont').removeClass('hidden');
                    $('#glyph4').removeClass('glyphicon glyphicon glyphicon-chevron-down').addClass('glyphicon glyphicon glyphicon-chevron-up');
                }
                else{
                    $('#hero4cont').addClass('hidden');
                    $('#glyph4').removeClass('glyphicon glyphicon glyphicon-chevron-up').addClass('glyphicon glyphicon glyphicon-chevron-down');
                }
            });
        </script>
    </body>
</html>