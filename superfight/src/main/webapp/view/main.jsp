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
            #menu,#title,#aboutplace,#statsplace,#otstup{
                background-color: #f5f5f5;
            }
            #superfight{
                font-family: "Impact";
            }
            #abouttext,#classtext,#fighttext,#nicktext,.herostats{
                font-family: "Arial Black";
            }
            #avatar{
                width:140px;
                height: 140px;
                margin-right: 14px;
            }
            #fightvalue,#classvalue{
                color: #c9302c;
                font-family: "Arial Black";
            }
            #avatar-margin{

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
                            <button type="submit" id="exit" class="btn btn-danger">Выйти</button>
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
                <div class="col-md-7 text-right" id="avatar-margin">
                    <img id="avatar" src="../images/bg_main.jpg" alt="image" class="img-thumbnail">
                </div>
                <div class="col-md-5 text-right">
                    <button class="btn btn-danger" data-toggle="modal" data-target="#myModal">Удалить профиль</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h4 id="nicktext" class="text-center">
                        ${user}
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
                        ${count}(${countwin}/${countlose})
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
                <div class="col-md-12"><button type="button" id="hero1" class="btn btn-default btn-lg btn-block">Супермен <span id="glyph1" class="glyphicon glyphicon glyphicon-chevron-down"></span></button></div>
                <div id="hero1cont" class="container hidden">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <p id="supermanbattles" class="herostats">Боёв всего(выиграно/проиграно):</p>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <p id="supermanlvl" class="herostats">Уровень героя:</p>
                    </div>
                </div>
            </div>
            <br>
            <!--Герой 2-->
            <div class="row">
                <div class="col-md-12"><button type="button" id="hero2" class="btn btn-default btn-lg btn-block">Бэтмен <span id="glyph2" class="glyphicon glyphicon glyphicon-chevron-down"></span></button></div>
                <div id="hero2cont" class="container hidden">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <p id="batmanbattles" class="herostats">Боёв всего(выиграно/проиграно):</p>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <p id="batmanlvl" class="herostats">Уровень героя:</p>
                    </div>
                </div>
            </div>
            <br>
            <!--Герой 3-->
            <div class="row">
                <div class="col-md-12"><button type="button" id="hero3" class="btn btn-default btn-lg btn-block">Человек-паук <span id="glyph3" class="glyphicon glyphicon glyphicon-chevron-down"></span></button></div>
                <div id="hero3cont" class="container hidden">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <p id="spidermanbattles" class="herostats">Боёв всего(выиграно/проиграно):</p>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <p id="spidermanlvl" class="herostats">Уровень героя:</p>
                    </div>
                </div>
            </div>
            <br>
            <!--Герой 4-->
            <div class="row">
                <div class="col-md-12"><button type="button" id="hero4" class="btn btn-default btn-lg btn-block">Халк <span id="glyph4" class="glyphicon glyphicon glyphicon-chevron-down"></span></button></div>
                <div id="hero4cont" class="container hidden">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <p id="hulkbattles" class="herostats">Боёв всего(выиграно/проиграно):</p>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <p id="hulklvl" class="herostats">Уровень героя:</p>
                    </div>
                </div>
            </div>
            <br>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="post" action="/remove" class="form-horizontal">
                        <!-- Заголовок модального окна -->
                        <div class="modal-header">
                            <button type="button" id="krestik" class="close" data-dismiss="modal">×</button>
                            <h4 class="modal-title" id="myModalLabel">Вы уверены?</h4>
                        </div>
                        <!-- Основная часть модального окна, содержащая форму для регистрации -->
                        <div class="modal-body">
                            <button id="save" type="submit" class="btn btn-primary">Да</button>
                            <button type="button" id="cancel" class="btn btn-default" data-dismiss="modal">Нет</button>
                        </div>
                        <!-- Нижняя часть модального окна -->
                        <div class="modal-footer">

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <form method="post" id="quit" action="/logout" class="hidden"></form>
        <form method="post" id="in-fight" action="/choose" class="hidden"></form>
        <script>
            $('#exit').click(function () {
               $('#quit').submit();
            });
            $('#fight').click(function () {
                $('#in-fight').submit();
            });
        </script>
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
        <script>
            window.onload = function (e) {
                //SUPERMAN

                var battleswin = "${supermanwins}";
                var battleslose = "${supermanloses}";
                var battles = Number(battleswin)+Number(battleslose);
                var lvl = "${supermanlvl}";
                $('#supermanbattles').text("Боёв всего(выиграно/проиграно):"+battles+"("+battleswin+"/"+battleslose+")");
                $('#supermanlvl').text("Уровень героя:"+lvl);

                //BATMAN

                var battleswin = "${batmanwins}";
                var battleslose = "${batmanloses}";
                var battles = Number(battleswin)+Number(battleslose);
                var lvl = "${batmanlvl}";
                $('#batmanbattles').text("Боёв всего(выиграно/проиграно):"+battles+"("+battleswin+"/"+battleslose+")");
                $('#batmanlvl').text("Уровень героя:"+lvl);

                //SPIDERMAN

                var battleswin = "${spidermanwins}";
                var battleslose = "${spidermanloses}";
                var battles = Number(battleswin)+Number(battleslose);
                var lvl = "${spidermanlvl}";
                $('#spidermanbattles').text("Боёв всего(выиграно/проиграно):"+battles+"("+battleswin+"/"+battleslose+")");
                $('#spidermanlvl').text("Уровень героя:"+lvl);

                //HULK

                var battleswin = "${hulkwins}";
                var battleslose = "${hulkloses}";
                var battles = Number(battleswin)+Number(battleslose);
                var lvl = "${hulklvl}";
                $('#hulkbattles').text("Боёв всего(выиграно/проиграно):"+battles+"("+battleswin+"/"+battleslose+")");
                $('#hulklvl').text("Уровень героя:"+lvl);
            }


        </script>
    </body>
</html>