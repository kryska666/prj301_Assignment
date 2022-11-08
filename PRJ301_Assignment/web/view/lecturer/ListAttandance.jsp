<%-- 
    Document   : ListAttandance
    Created on : Oct 25, 2022, 10:51:00 AM
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
        <h1>Attendance Report</h1>
        </br>
        <nav style="display: flex;
             justify-content: space-between;
             margin-top: 30px;
             margin-bottom: 40px;
             padding: 8px 15px;
             background-color: #f5f5f5;
             text-align: center">
            <div>
                <p><a href="../home" style="text-decoration: none; color: black; background: #00cc33; border-radius: 4px; padding: 4px">Home</a></p>
            </div>
            <div>
                <p><a href="../logout" style="text-decoration: none; color: black; background: #00cc33; border-radius: 4px; padding: 4px">logout</a></p>
            </div>
        </nav>
        </br>
        <div>
            <p>Class List:</p>
            </br>
            <div style=" background-color: #6b90da;">
                <div style="display: flex; justify-content: space-between; max-width: 100%;">
                    <c:forEach items="${requestScope.groups}" var="group">
                        <p style="margin: 20px">
                            <a href="list?gid=${group.id}">${group.name}</a>
                        </p>

                    </c:forEach>
                </div>
            </div>


        </div>

        </br>
        </br>
        <c:if test="${requestScope.gr ne null}">
            Lecturer: <input type="text" readonly="readonly" value="${requestScope.lect.name}"/>
            <form action="ListAttandance" method="GET">
                <input type="hidden" name="gid" value="${param.gid}"/>
            </form>
            Class: <input type="text" readonly="readonly" value="${requestScope.gr.name}"/>
            <table border="1px" style="width: 100%">
                <c:set var="total" value="0" />
                <tr>
                    <td> </td>
                    <c:forEach items="${requestScope.sess}" var="d">
                        <c:set var="total" value="${total+1}" />
                        <td style="background-color: #6b90da; font-weight: bold;"><a style="color: black; text-decoration: none;" href="takeatt?id=${d.id}">Slot ${total} </br> (${d.date})</a> </td>
                    </c:forEach>
                    <td style="background-color: #6b90da; font-weight: bold">Rate</td>
                </tr>
                <c:forEach items="${requestScope.stds}" var="std">
                    <tr>
                        <td style=" background-color: #6b90da;">${std.name}</td> 
                        <c:set var="count" value="0" />
                        <c:forEach items="${std.attandances}" var="att">
                            <c:if test="${att.session.attandated}">
                                <c:if test="${att.present}">
                                    <td style="color: #00cc33; text-align: center">Present</td>
                                </c:if> 
                                <c:if test="${!att.present}">
                                    <td style="color: red; text-align: center">Absent</td>
                                    <c:set var="count" value="${count+1}" />
                                </c:if>
                            </c:if> 
                            <c:if test="${!att.session.attandated}">
                                <td style="text-align: center">Not yet</td>
                            </c:if>

                        </c:forEach>
                                <td style="text-align: center">${count/total*100}%</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>

