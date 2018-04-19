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
            height: 200px;
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
        .name,.side{
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
            height: 300px;
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
            <div class="side col-md-4 text-center"><h3 class="side">Вы</h3></div>
            <div class="col-md-2"></div>
            <div class="side col-md-4 text-center"><h3 class="side">Противник</h3></div>
            <div class="col-md-1"></div>
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
            <button id="quit" class="btn btn-danger">Выйти</button>
        </div>
        <div class="huge-otstup"></div>
    </div>
    <form method="post" action="/result" id="form" class="hidden">
        <input id="resultbattle" type="text" name="result" value="">
    </form>
    <script>
        function randomInt(min,max) {
            var rand = min - 0.5 +Math.random()*(max-min+1);
            rand = Math.round(rand);
            return rand;
        }
        var win=false;
        yourhp=${hp};
        enemyhp=${hpEnemy};
        enemyfullhp=${hpEnemy};
        yourfullhp=${hp};
        damage=${damage};
        enemydamage=${damageEnemy};
        heroname = '${name}';
        enemyname = '${nameEnemy}';
        pathhero = '${pathToHero}';
        pathenemy = '${pathToEnemy}';
        enemyagility = ${agilityEnemy};
        agility = ${agility};
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
            win=true;
        }
        function lost() {
            $('#main-container').addClass('hidden');
            $('#result-container').removeClass('hidden');
            $('#result').text("ПОРАЖЕНИЕ!");
            $('#xp').text("Повезет в следующий раз!");
            win=false;
        }
        $('#quit').click(function () {
            if(win) {
                $('#resultbattle').attr("value",'w');
                $('#form').submit();
            }
            else{
                $('#resultbattle').attr("value",'l');
                $('#form').submit();
            }
        });
        function enemyAtack() {
            countenemy++;
            miss = randomInt(0,100);
            var isMissing=false;
            if(miss>=0&&miss<=agility)
                isMissing=true;
            hit = randomInt(enemydamage-4,enemydamage+4);
            crit = randomInt(1,10);
            var isCrit=false;
            if(crit==5) {
                hit = Math.round(2.5 * hit);
                isCrit=true;
            }
            if(!isMissing) {
                yourhp -= hit;
                if (!isCrit)
                    log += "<br>" + "-Ход " + countenemy + "(Противник): Противник наносит " + hit + " урона!";
                else
                    log += "<br>" + "-Ход " + countenemy + "(Противник): Противник критует на " + hit + " урона!";
            }
            else
                log += "<br>" + "-Ход " + countyou + "(Противник): Промах!";
            if(yourhp<=0) {
                yourhp = 0;
                $('#hit').addClass('hidden');
                setTimeout(lost,1000);
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
                miss = randomInt(0,100);
                var isMissing=false;
                if(miss>=0&&miss<=enemyagility)
                    isMissing=true;
                hit = randomInt(damage-4,damage+4);
                crit = randomInt(1,10);
                var isCrit=false;
                if(crit==5) {
                    hit = Math.round(2.5 * hit);
                    isCrit=true;
                }
                if(!isMissing) {
                    enemyhp -= hit;
                    if (!isCrit)
                        log += "<br>" + "-Ход " + countyou + "(Вы): Вы наносите " + hit + " урона!";
                    else
                        log += "<br>" + "-Ход " + countyou + "(Вы): Вы критуете на " + hit + " урона!";
                }
                else{
                    log += "<br>" + "-Ход " + countyou + "(Вы): Промах!";
                }
                if(enemyhp<=0) {
                    enemyhp = 0;
                    $('#hit').addClass('hidden');
                    setTimeout(won,1000);
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
