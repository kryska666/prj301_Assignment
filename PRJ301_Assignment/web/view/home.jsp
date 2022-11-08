<%-- 
    Document   : home
    Created on : Nov 7, 2022, 9:45:58 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.account ne null}">
            <h1>FPT University Academic Portal</h1>
            <nav style="display: flex;
                 justify-content: space-between;
                 margin-top: 30px;
                 margin-bottom: 40px;
                 padding: 8px 15px;
                 background-color: #f5f5f5;
                 text-align: center">
                <div>
                    <p style="background: #00cc33; border-radius: 4px; padding: 4px ">
                        Hello ${sessionScope.account.displayname}
                    </p>
                </div>
                <div>
                    <p><a href="logout" style="text-decoration: none; color: black; background: #00cc33; border-radius: 4px; padding: 4px">logout</a></p>
                    
                </div>
            </nav>
            </br>
            </br>
            <c:if test="${!requestScope.x}">
                <div style="margin-left: 20px">
                    <h3><a href="std/timetable">Timetable</a></h3>
                </div>
            </c:if>
            <c:if test="${requestScope.x}">
                <div style="margin-left: 20px">
                    <h3><a href="lect/timetable">Timetable</a></h3>
                    </br>
                    <h3><a href="lect/list">Attendance Report</a></h3>
                </div>
            </c:if>
            
            
            

        </c:if>
        <c:if test="${sessionScope.account eq null}">
            Pls login first </br>
            Back to login page <a href="login">here</a>
        </c:if>
    </body>
</html>
