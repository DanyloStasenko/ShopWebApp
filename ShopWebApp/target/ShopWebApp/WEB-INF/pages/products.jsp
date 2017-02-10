<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Products</title>
    <link href="css/style.css" type="text/css" rel="stylesheet" />
</head>

<body>
<div id="wrapper">
    <div id="header">
        <div id="menu">
            <ul>
                <li><a href="<c:url value="/home"/>">Home</a></li>
                <li><a class="current" href="<c:url value="/products"/>">Products</a></li>
                <li><a href="<c:url value="/admin"/>">Admin Page</a></li>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <li class="rightblock"> <a href="<c:url value="/j_spring_security_logout"/>">Logout (${pageContext.request.userPrincipal.name})</a></li>
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
            <div class="center">
                <c:if test="${!empty products}">
                    <br>
                    <h1>Products List:</h1>
                    <br>
                    <table class="tg">
                        <tr>
                            <th width="80">ID</th>
                            <th width="180">Title</th>
                            <th width="180">Description</th>
                            <th width="180">Price</th>
                            <th width="180">Buy</th>
                        </tr>
                        <c:forEach items="${products}" var="product">
                            <tr>
                                <td>${product.id}</td>
                                <td><a href="/productdata${product.id}" >${product.title}</a></td>
                                <td>${product.description}</td>
                                <td>${product.price}</td>
                                <c:if test="${pageContext.request.userPrincipal.name == null}">
                                    <td><a href="<c:url value="/login"/>">Login to Buy</a></td>
                                </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <td><a href="<c:url value='/buyproduct/${product.id}/${pageContext.request.userPrincipal.name}'/>">Buy</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
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