<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
    <head>
        <title>Products Page</title>

        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <a href="<c:url value="/user"/>">Login</a>
        </c:if>

        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <a href="<c:url value="/j_spring_security_logout"/>"> Logout</a>
        </c:if>

        <style type="text/css">
            .tg {
                border-collapse: collapse;
                border-spacing: 0;
                border-color: #ccc;
            }

            .tg td {
                font-family: Arial, sans-serif;
                font-size: 14px;
                padding: 10px 5px;
                border-style: solid;
                border-width: 1px;
                overflow: hidden;
                word-break: normal;
                border-color: #ccc;
                color: #333;
                background-color: #fff;
            }

            .tg th {
                font-family: Arial, sans-serif;
                font-size: 14px;
                font-weight: normal;
                padding: 10px 5px;
                border-style: solid;
                border-width: 1px;
                overflow: hidden;
                word-break: normal;
                border-color: #ccc;
                color: #333;
                background-color: #f0f0f0;
            }
        </style>
    </head>

    <body>
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
                        <td><a href="/productdata/${product.id}" target="_blank">${product.title}</a></td>
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
    </body>
</html>