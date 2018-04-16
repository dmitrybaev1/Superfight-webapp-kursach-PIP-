<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        .container{
            background-color: #f5f5f5;
        }
        .otstup{
            height: 300px;
        }
        .heroes{
            width:140px;
            height: 140px;
        }
        .fullhp{
            background: green;
            color: white;
        }
        .mediumhp{
            background: orange;
            color: white;
        }
        .lowhp{
            background: red;
            color: white;
        }
        #title{
            border: 5px double black;
            font-family: "Impact";
        }
        .name{
            font-family: "Arial Black";
        }
        #log{
            height: 250px;
            width: 500px;
            overflow: auto;
            background-color: white;
            border: 2px solid black;
        }
        #result{
            font-family: "Impact";
        }
        .huge-otstup{
            height: 400px;
        }
    </style>
</head>
<body>
    <div id="main-container" class="container">
        <div class="otstup row text-center">
            <div class="col-md-2"></div>
            <div class="col-md-8"><h1 id="title">FIGHT!</h1></div>
            <div class="col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-md-1"></div>
            <div id="herocolor" class="fullhp col-md-4 text-center">
                <p id="herohp">Жизнь:150/150</p>
                <img id="heroimage" src="../images/hulk.jpg" class="heroes img-thumbnail">
                <br>
                <p id="heroname" class="name">Халк</p>
            </div>
            <div class="col-md-2 text-center">
                <br>
                <br>
                <br>
                <button id="hit" class="btn btn-primary">Нанести удар!</button>
            </div>
            <div id="enemycolor" class="fullhp col-md-4 text-center">
                <p id="enemyhp">Жизнь:200/200</p>
                <img id="enemyimage" src="../images/spiderman.jpg" class="heroes img-thumbnail">
                <br>
                <p id="enemyname" class="name">Человек-паук</p>
            </div>
            <div class="col-md-1"></div>
        </div>
        <div class="row">
            <br>
            <br>
            <div id="log" class="center-block">
                <!--LOG-->
            </div>
        </div>
        <div class="otstup row"></div>
    </div>
    <div id="result-container" class="container hidden">
        <div class="huge-otstup"></div>
        <div class="row text-center">
            <h1 id="result"></h1>
            <br>
            <h3 id="xp"></h3>
            <br>
            <button class="btn btn-danger">Выйти</button>
        </div>
        <div class="huge-otstup"></div>
    </div>
    <script>

        yourhp=${hp};
        enemyhp=${hpEnemy};
        enemyfullhp=${hpEnemy};
        yourfullhp=${hp};
        heroname = '${name}';
        enemyname = '${nameEnemy}';
        pathhero = '${pathToHero}';
        pathenemy = '${pathToEnemy}';
        log = "-Начало боя!<br>---------------------";
        countyou=0;
        countenemy=0;
        $('#log').html(log);
        window.onload = function () {
            $('#heroname').text(heroname);
            $('#enemyname').text(enemyname);
            $('#heroimage').attr("src",pathhero);
            $('#enemyimage').attr("src",pathenemy);
            $('#enemyhp').text("Жизнь:" + enemyhp + "/"+enemyfullhp);
            $('#herohp').text("Жизнь:" + yourhp + "/"+yourfullhp);
        }
        function won() {
            $('#main-container').addClass('hidden');
            $('#result-container').removeClass('hidden');
            $('#result').text("ПОБЕДА!");
            $('#xp').text("Еще одной победой больше!");
        }
        function lost() {
            $('#main-container').addClass('hidden');
            $('#result-container').removeClass('hidden');
            $('#result').text("ПОРАЖЕНИЕ!");
            $('#xp').text("Повезет в следующий раз!");
        }
        function enemyAtack() {
            countenemy++;
            log += "<br>" + "-Ход " + countenemy + "(Противник): Противник наносит 30 урона!";
            yourhp -= 30;
            if(yourhp<=0) {
                yourhp = 0;
                lost();
            }
            $('#log').html(log);
            $("#log").scrollTop($("#log")[0].scrollHeight);
            $('#herohp').text("Жизнь:" + yourhp + "/" +yourfullhp);
            if (yourhp <= (yourfullhp / 1.5)&&yourhp > (yourfullhp / 3)) {
                $('#herocolor').removeClass('fullhp').addClass('mediumhp');
            }
            if (yourhp <= yourfullhp / 3) {
                $('#herocolor').removeClass('mediumhp').addClass('lowhp');
            }
            $('#hit').removeClass('disabled');
        }
        $('#hit').click(function () {
            if(!$('#hit').hasClass('disabled')) {
                $('#hit').addClass('disabled');
                countyou++;
                log += "<br/>" + "-Ход " + countyou + "(Вы): Вы наносите 20 урона!";
                enemyhp -= 20;
                if(enemyhp<=0) {
                    enemyhp = 0;
                    won();
                }
                $('#log').html(log);
                $("#log").scrollTop($("#log").scrollHeight);
                $('#enemyhp').text("Жизнь:" + enemyhp + "/"+enemyfullhp);
                if (enemyhp <= (enemyfullhp / 1.5)&&enemyhp > (enemyfullhp / 3)) {
                    $('#enemycolor').removeClass('fullhp').addClass('mediumhp');
                }
                if (enemyhp <= enemyfullhp / 3) {
                    $('#enemycolor').removeClass('mediumhp').addClass('lowhp');
                }
                setTimeout(enemyAtack, 1000);
            }
        });

    </script>
</body>
</html>
