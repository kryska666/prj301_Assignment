<%-- 
    Document   : TimeTable
    Created on : Oct 27, 2022, 3:10:37 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="../home">Home</a>
        <a href="../logout">Logout</a>
        </br>
        Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/>

        <table border="1px">
            <tr>
                <td>
                    <form action="timetable" method="GET">
                        <input type="hidden" name="lid" value="${param.lid}"/>
                        From: <input type="date" name="from" value="${requestScope.from}"/>
                        </br>
                        To: <input type="date" name="to" value="${requestScope.to}"/>
                        </br>
                        <input type="submit" value="View"/> 
                    </form>
                </td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>${d}<br/>${helper.getDayNameofWeek(d)}</td>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.description}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                    <a href="takeatt?id=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                    <br/>
                                    ${ses.room.name}
                                    <c:if test="${ses.attandated}">
                                        Done
                                    </c:if>
                                    <c:if test="${!ses.attandated}">
                                        Not yet
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
