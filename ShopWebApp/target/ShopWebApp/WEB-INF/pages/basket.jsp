<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Basket(${pageContext.request.userPrincipal.name})</title>
        <link href="css/style.css" type="text/css" rel="stylesheet" />
    </head>

    <body>
    <div id="wrapper">
        <div id="header">
            <div id="menu">
                <ul>
                    <li><a href="<c:url value="/home"/>">Home</a></li>
                    <li><a  href="<c:url value="/products"/>">Products</a></li>
                    <li><a href="<c:url value="/admin"/>">Admin Page</a></li>
                    <li class="rightblock"> <a href="<c:url value="/j_spring_security_logout"/>">Logout (${pageContext.request.userPrincipal.name})</a></li>
                    <li class="rightblock"><a class="current" href="<c:url value="/basket"/>">Basket</a></li>
                </ul>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <br>
                <h1>My Orders:</h1>
                <div class="center">
                    <c:if test="${!empty products}">
                        <br>
                        <%-- Get orders count for current user--%>
                        <c:set var="ordersCount" value="${0}"/>
                        <c:forEach items="${orders}" var="order">
                            <c:if test="${order.username == pageContext.request.userPrincipal.name}">
                                <c:set var="ordersCount" value="${ordersCount+1}" />
                            </c:if>
                        </c:forEach>

                        <%-- If this user has some orders - show his orders --%>
                        <c:if test="${ordersCount > 0}">
                            <br>
                            <table class="tg">
                                <tr>
                                    <th width="140">ID</th>
                                    <th width="260">Title</th>
                                    <th width="260">Cancel</th>
                                </tr>
                                <c:forEach items="${orders}" var="order">
                                    <c:if test="${order.username == pageContext.request.userPrincipal.name}">
                                        <tr>
                                            <td>${order.id}</td>
                                            <td>${order.productTitle}</td>
                                            <td><a href="<c:url value='/basket/cancelorder/${order.id}'/>">Cancel</a></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </table>
                        </c:if>
                    </c:if>
                    <br>
                    <p>Sorry for these redirects from 'Products page' when You are buying something :)</p>
                </div>
                <br>
                <br>
                <br>
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
