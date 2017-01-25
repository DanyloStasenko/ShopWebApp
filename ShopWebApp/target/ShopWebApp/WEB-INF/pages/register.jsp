<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register</title>
    <link href="css/adminstyle.css" type="text/css" rel="stylesheet" />
</head>

<body>
<div id="wrapper">
    <div id="header">
        <div id="menu">
            <ul>
                <li><a href="<c:url value="/home"/>">Home</a></li>
                <li><a href="<c:url value="/products"/>">Products</a></li>
                <li><a href="<c:url value="/admin"/>">Admin Page</a></li>
                <li class="rightblock"><a href="<c:url value="/login"/>">Login</a></li>
                <li class="rightblock"><a class="current" href="<c:url value="/register"/>">Register</a></li>
            </ul>
        </div>
    </div>

    <div class="content">
        <div class="container">
            <br>
            <div class="divider"></div>
            <h2 class="red-headline">Please use these logins:</h2>
            <div class="center">
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
                <br>
                <h2 class="red-headline">Or register new user:</h2>
                <c:url var="addAction" value="/register/adduser"/>
                <form:form action="${addAction}" commandName="user">
                    <table>
                        <tr>
                            <td>
                                <form:label path="username">
                                    <spring:message text="Username "/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="username"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:label path="password">
                                    <spring:message text="Password "/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="password"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <c:if test="${empty user.username}">
                                    <input type="submit"
                                           value="<spring:message text="Add User"/>"/>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                    </form:form>
                <br>
            </div>
        </div>
    </div>

    <div class="footer">
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <p> Welcome : ${pageContext.request.userPrincipal.name} | <a href="<c:url value="/j_spring_security_logout"/>">Logout</a></p>
        </c:if>
        <p>Copyright &copy; 2017 <a href="http://github.com/danylostasenko">Danylo Stasenko</a></p>
    </div>
</div>
</body>
</html>
