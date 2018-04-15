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
        #vs{
            font-family: "Impact";
        }
        #title{
            font-family: "Impact";
            border: 2px solid black;
        }
        .choosetext{
            font-family: "Arial Black";
            text-decoration: underline;
        }
        .heroes{
            width:140px;
            height: 140px;
        }
        .otstup{
            height:150px;
        }
        .heronames{
            font-family: "Arial Black";
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="otstup row">
            <br>
            <div class="col-md-4"></div>
            <div class="col-md-4"><h1 class="text-center" id="title">Выберите героев</h1></div>
            <div class="col-md-4"></div>
        </div>
        <form id="form" name="chooseform">
            <div class="herotitle row">
                <h2 class="choosetext text-center">Ваш герой</h2>
            </div>
            <div class="row">
                <div class="col-md-3 text-center">
                    <input class="text-center" type="radio" name="userhero" value="hero1" checked>
                    <br>
                    <img id="user1pict" class="heroes img-thumbnail center-block" src="../images/superman.jpg">
                    <p class="heronames">Супермен</p>
                </div>
                <div class="col-md-3 text-center">
                    <input class="text-center" type="radio" name="userhero" value="hero2">
                    <br>
                    <img id="user2pict" class="heroes img-thumbnail center-block" src="../images/batman.jpg">
                    <p class="heronames">Бэтмен</p>
                </div>
                <div class="col-md-3 text-center">
                    <input class="text-center" type="radio" name="userhero" value="hero3">
                    <br>
                    <img id="user3pict" class="heroes img-thumbnail center-block" src="../images/spiderman.jpg">
                    <p class="heronames">Человек-паук</p>
                </div>
                <div class="col-md-3 text-center">
                    <input class="text-center" type="radio" name="userhero" value="hero4">
                    <br>
                    <img id="user4pict" class="heroes img-thumbnail center-block" src="../images/hulk.jpg">
                    <p class="heronames">Халк</p>
                </div>
            </div>
            <div class="row">
                <h1 id="vs" class="text-center">----------------------vs----------------------</h1>
            </div>
            <div class="row">
                <div class="col-md-3 text-center">
                    <input class="text-center" type="radio" name="enemyhero" value="hero1" checked>
                    <br>
                    <img id="enemy1pict" class="heroes img-thumbnail center-block" src="../images/superman.jpg">
                    <p class="heronames">Супермен</p>
                </div>
                <div class="col-md-3 text-center">
                    <input class="text-center" type="radio" name="enemyhero" value="hero2">
                    <br>
                    <img id="enemy2pict" class="heroes img-thumbnail center-block" src="../images/batman.jpg">
                    <p class="heronames">Бэтмен</p>
                </div>
                <div class="col-md-3 text-center">
                    <input class="text-center" type="radio" name="enemyhero" value="hero3">
                    <br>
                    <img id="enemy3pict" class="heroes img-thumbnail center-block" src="../images/spiderman.jpg">
                    <p class="heronames">Человек-паук</p>
                </div>
                <div class="col-md-3 text-center">
                    <input class="text-center" type="radio" name="enemyhero" value="hero4">
                    <br>
                    <img id="enemy4pict" class="heroes img-thumbnail center-block" src="../images/hulk.jpg">
                    <p class="heronames">Халк</p>
                </div>
            </div>
            <div class="herotitle row">
                <h2 class="choosetext text-center">Вражеский герой</h2>
            </div>
            <div class="row text-center">
                <br>
                <button class="btn btn-success" type="submit">Начать сражение!</button>
            </div>
        </form>
    </div>
    <script>

    </script>
</body>
</html>
