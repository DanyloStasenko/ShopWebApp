<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
    <head>
        <title>Products</title>
        <link href="css/style.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <div class="center">
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <a href="<c:url value="/user"/>">Login</a>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <a href="<c:url value="/j_spring_security_logout"/>"> Logout</a>
            </c:if>
            <c:if test="${empty products}">
                <h1>Products List is empty...</h1>
            </c:if>
            <c:if test="${!empty products}">
            <h1>Products List:</h1>
                <table class="tg">
                    <tr>
                        <th width="80">ID</th>
                        <th width="120">Title</th>
                        <th width="120">Description</th>
                        <th width="120">Price</th>
                        <th width="120">Buy</th>
                    </tr>
                    <c:forEach items="${products}" var="product">
                        <tr>
                            <td>${product.id}</td>
                            <td><a href="/productdata/${product.id}" >${product.title}</a></td>
                            <td>${product.description}</td>
                            <td>${product.price}</td>
                            <c:if test="${pageContext.request.userPrincipal.name == null}">
                                <td><a href="<c:url value="/user"/>">Buy</a></td>
                            </c:if>
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <td><a href="<c:url value='/user/buyproduct/${product.id}/${pageContext.request.userPrincipal.name}'/>">Buy</a></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </body>
</html>