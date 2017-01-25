<% response.sendRedirect("/home.html");  %>
<%--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>WebShop</title>
        <link href="css/style.css" type="text/css" rel="stylesheet" />
    </head>

    <body>
        <div class="center">
            <h3>WebShop by Danylo Stasenko:</h3>
            <br/>
            <a href="<c:url value="/products"/>">Open Products List</a>
            <br>
            <br>
            <a href="<c:url value="/admin"/>">Open Admin Page</a>

            <div class="items">
                <div class="left">
                    <c:if test="${!empty users}">
                        <h1>Users List</h1>
                        <table class="tg">
                            <tr>
                                <th width="120">Username</th>
                                <th width="120">Password</th>
                                <th width="120">Role</th>
                            </tr>
                            <c:forEach items="${users}" var="user">
                                <tr>
                                    <td>${user.username}</td>
                                    <td>${user.password}</td>
                                    <td>${user.role}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
            </div>

            <br/>
        </div>
    </body>
</html>--%>
