<%-- 
    Document   : TakeAtt
    Created on : Oct 29, 2022, 8:32:27 PM
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
        <h1>Take Attendance</h1>
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
        Take attendance for Group: ${requestScope.ses.group.name} <br/>
        Subject: ${requestScope.ses.group.subject.name} <br/>
        Room: ${requestScope.ses.room.name} <br/>
        Date: ${requestScope.ses.date} - ${requestScope.ses.timeslot.description}<br/>
        Attended: <span style="color: red;"> ${requestScope.ses.attandated?"Yes":"No"} </span>
        <form action="takeatt" method="POST">
            <input type="hidden" name="sesid" value="${param.id}"/>
            </br>
            </br>
            <table border="1px" style="width: 100%">
                <tr style="background-color:#6b90da ">
                    <td>No.</td>
                    <td>StudentID</td>
                    <td>Full Name</td>
                    <td style="color: green">Present</td>
                    <td style="color: red">Absent</td>
                    <td>Description</td>
                </tr>
                <c:forEach items="${requestScope.ses.attandances}" var="a" varStatus="loop">
                 <tr>
                    <td>${loop.index+1}</td>
                    <td>${a.student.id}
                    <input type="hidden" name="stdid" value="${a.student.id}"/>
                    </td>
                    <td>${a.student.name}</td>
                    <td><input type="radio"
                               <c:if test="${a.present}">
                               checked="checked" 
                               </c:if>
                               name="present${a.student.id}" value="present" /></td>
                    <td><input type="radio"
                               <c:if test="${!a.present}">
                               checked="checked"
                               </c:if>
                               name="present${a.student.id}" value="absent" /></td>
                    <td><input style="width: 99%" type="text" name="description${a.student.id}" value="${a.description}" /></td>
                </tr>   
                    
                </c:forEach>
                
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
