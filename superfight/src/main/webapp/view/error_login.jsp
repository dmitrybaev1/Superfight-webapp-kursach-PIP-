
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
    </style>
</head>
<body>
    <div class="container">
        <div class="row text-center"><h2>Ошибка!</h2></div>
        <div class="row text-center">
            <form method="get" action="/back_from_error">
                <button type="submit" class="btn btn-link">Назад</button>
                <p>${login}</p>
            </form>
        </div>
    </div>
</body>
</html>
