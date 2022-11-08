<%-- 
    Document   : TimeTable
    Created on : Nov 8, 2022, 10:05:33 PM
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
    <h1>Timetable</h1>
    <body>
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
        Student: <input type="text" readonly="readonly" value="${requestScope.student.name}"/>

        <table border="1px" style="width: 100%;">
            <tr style=" background-color:#6b90da;">
                <td>
                    <form action="timetable" method="GET">
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
                    <td>Slot ${slot.id} </br>
                        ${slot.description}</td>
                        <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                    ${ses.group.subject.name}
                                    <br/>
                                    ${ses.room.name}
                                    </br>

                                    <c:if test="${ses.attandated}">
                                        <c:forEach items="${ses.attandances}" var="att">
                                            <c:if test="${att.present}">
                                                (Present)
                                            </c:if>
                                            <c:if test="${!att.present}">
                                                (Absent)
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${!ses.attandated}">
                                        (Not yet)
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