<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>WebShop</title>
        <link href="/css/style.css" type="text/css" rel="stylesheet" />
    </head>

    <body>
        <div class="wrapper">
            <div class="header">
                <div class="menu">
                    <ul>
                        <li><a class="current" href="<c:url value="/guide"/>">Home</a></li>
                        <li><a href="<c:url value="/products"/>">Products</a></li>
                        <li><a href="<c:url value="/admin"/>">Admin Page</a></li>
                        <li class="rightblock"><a href="<c:url value="/register"/>">Register</a></li>
                        <li class="rightblock"><a href="<c:url value="/user"/>">Login</a></li>
                    </ul>
                </div>
            </div>
            <div class="content">
                <br>
                <h1>This is my shop</h1>
                <div class="divider"></div>
                <h2 class="red-headline">Please use these logins:</h2>
                <div class="center">
                    <div class="table">
                        <c:if test="${!empty users}">
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
            </div>
            <div class="footer">
                <p>Copyright &copy; 2017 <a href="github.com/danylostasenko">Danylo Stasenko</a></p>
            </div>
        </div>
    </body>
</html>




















<%--
<html>

    <body>
        <div id = "wrapper">
            <div id = "header">
                <div id="menu">
                    <ul>
                        <li><a class="current" href="<c:url value="/guide"/>">Home</a></li>
                        <li><a href="<c:url value="/products"/>">Products</a></li>
                        <li><a href="<c:url value="/admin"/>">Admin Page</a></li>
                        <li class="register"><a href="<c:url value="/register"/>">Register</a></li>
                        <li class="rightblock"><a href="<c:url value="/user"/>">Login</a></li>
                    </ul>
                </div>
            </div>


            <h1>WebShop by Danylo Stasenko</h1>
            <h2><a href="<c:url value="/products"/>">Go to Products List</a></h2>
            <h2><a href="<c:url value="/admin"/>">Go to Admin Page</a></h2>

            <div class="items">
                <div class="left">
                    <div class="guide">
                        <c:if test="${!empty users}">
                            <h3>Logins:</h3>
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
            </div>
        </div>
    </body>
</html>--%>
