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
            Hello ${sessionScope.account.displayname}
            </br>
            <a href="logout">logout</a> 
            </br>
            </br>
            <a href="lect/timetable">Timetable</a>
            <a href="lect/list">List attandance</a>

        </c:if>
        <c:if test="${sessionScope.account eq null}">
            you are not logged in yet!
        </c:if>
    </body>
</html>
