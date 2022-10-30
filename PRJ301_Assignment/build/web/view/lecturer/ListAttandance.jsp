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
        Lecturer: <input type="text" readonly="readonly" value="${requestScope.lect.name}"/>
        <form action="ListAttandance" method="GET">
            <input type="hidden" name="gid" value="${param.gid}"/>
        </form>
        Class: <input type="text" readonly="readonly" value="${requestScope.gr.name}"/>
        <table border="1px">
            <tr>
                <td> </td>
                <c:forEach items="${requestScope.sess}" var="d">
                    <td>${d.date}</td>
                </c:forEach>
                <td>Rate</td>
            </tr>
            <c:forEach items="${requestScope.stds}" var="std">
                <tr>
                    <td>${std.name}</td> 
                    <c:set var="total" value="${requestScope.numOfSlot}" />
                    <c:set var="count" value="0" />
                    <c:forEach items="${std.attandances}" var="att">
                        <c:if test="${att.session.attandated}">
                            <c:if test="${att.present}">
                                <td>Present</td>
                            </c:if> 
                            <c:if test="${!att.present}">
                                <td>Absent</td>
                                <c:set var="count" value="${count+1}" />
                            </c:if>
                        </c:if> 
                        <c:if test="${!att.session.attandated}">
                                <td>Not yet</td>
                        </c:if>

                    </c:forEach>
                    <td>${count/total*100}%</td>
                </tr>
            </c:forEach>
        </table>
        ${requestScope.istrue}
    </body>
</html>

