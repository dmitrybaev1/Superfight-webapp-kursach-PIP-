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
            #menu,#title,#aboutplace,#statsplace{
                background-color: #f5f5f5;
            }
            #superfight{
                font-family: "Impact";
            }
            #abouttext,#statstext{
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
                            <button type="button" id="stats" class="btn btn-default">Моя статистика</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" id="fight" class="btn btn-success">В бой!</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" id="exit" class="btn btn-danger">Выйти</button>
                        </div>
                    </div>
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
                <div class="col-md-2"></div>
                <div class="col-md-10">
                    <h4 id="statstext" class="text-left">
                        Уровень:
                        <br>

                    </h4>
                </div>
            </div>
            <!--Герой 1-->
            <div class="row">
                <button type="button" id="hero1" class="btn btn-default">Герой 1</button>
            </div>
            <div class="row"><!--СТАТИСТИКА ГЕРОЯ ДЛЯ ТЕКУЩЕГО ЮЗЕРА</div>
            <br>
            <!--Герой 2-->
            <div class="row">
                <button type="button" id="hero2" class="btn btn-default">Герой 2</button>
            </div>
            <div class="row"></div>
            <br>
            <!--Герой 3-->
            <div class="row">
                <button type="button" id="hero3" class="btn btn-default">Герой 3</button>
            </div>
            <br>
            <!--Герой 4-->
            <div class="row">
                <button type="button" id="hero4" class="btn btn-default">Герой 4</button>
            </div>
            <br>
            <!--Герой 5-->
            <div class="row">
                <button type="button" id="hero5" class="btn btn-default">Герой 5</button>
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
    </body>
</html>