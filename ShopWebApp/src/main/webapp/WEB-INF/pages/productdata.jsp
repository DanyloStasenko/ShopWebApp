<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="css/style.css" type="text/css" rel="stylesheet" />
    <title>Product Details</title>
</head>

<body>
    <div id="wrapper">
        <div id="header">
            <div id="menu">
                <ul>
                    <li><a href="<c:url value="/home"/>">Home</a></li>
                    <li><a href="<c:url value="/products"/>">Products</a></li>
                    <li><a href="<c:url value="/admin"/>">Admin Page</a></li>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li class="rightblock"><a href="<c:url value="/j_spring_security_logout"/>">Logout (${pageContext.request.userPrincipal.name})</a></li>
                        <li class="rightblock"><a href="<c:url value="/basket"/>">Go to Basket</a></li>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <li class="rightblock"><a href="<c:url value="/login"/>">Login</a></li>
                        <li class="rightblock"><a href="<c:url value="/register"/>">Register</a></li>
                    </c:if>
                </ul>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <br>
                <h1>Product Details</h1>
                <div class="divider"></div>
                <div class="center">
                    <c:if test="${!empty product}">
                        <table class="tg">
                            <tr>
                                <th width="150">ID</th>
                                <th width="150">Title</th>
                                <th width="150">Description</th>
                                <th width="150">Price</th>
                            </tr>
                            <tr>
                                <td>${product.id}</td>
                                <td>${product.title}</td>
                                <td>${product.description}</td>
                                <td>${product.price}</td>
                            </tr>
                        </table>
                    </c:if>
                    <br>
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