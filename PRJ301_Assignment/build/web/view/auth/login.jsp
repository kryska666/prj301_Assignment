<%-- 
    Document   : login
    Created on : Nov 5, 2022, 10:45:21 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../CSS/logincss.css">
    </head>
    <body>
        <h1>FPT University</h1>
        <div class="login1" style="background-color: #6b90da;border-radius: 4px;  text-align: center; width: 360px;
             padding: 1% 1% ;
             margin: auto;">
            <form action="login" method="POST">
                <div style=" margin: 3px">
                    Username: <input type="text" name="username"/>
                </div>
                <div style=" margin: 3px">
                    Password: <input type="password" name="password" />
                </div>
                <input type="submit" value="Login" /> 
            </form>   
        </div>

    </body>
</html>
