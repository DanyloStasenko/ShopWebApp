<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
    <head>
        <title>User: ${pageContext.request.userPrincipal.name}</title>
        <link href="css/style.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <div class="center">
        <h1>User</h1>
        <c:if test="${!empty products}">
        <h1>Products List</h1>
            <table class="tg">
                <tr>
                    <th width="80">ID</th>
                    <th width="120">Title</th>
                    <th width="120">Description</th>
                    <th width="120">Price</th>
                    <th width="60">Buy</th>
                </tr>
                <c:forEach items="${products}" var="product">
                    <tr>
                        <td>${product.id}</td>
                        <td><a href="/productdata/${product.id}" >${product.title}</a></td>
                        <td>${product.description}</td>
                        <td>${product.price}</td>
                        <td><a href="<c:url value='/user/buyproduct/${product.id}/${pageContext.request.userPrincipal.name}'/>">Buy</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

            <%-- Get orders count for current user --%>
            <c:set var="ordersCount" value="${0}"/>
            <c:forEach items="${orders}" var="order">
                <c:if test="${order.username == pageContext.request.userPrincipal.name}">
                <c:set var="ordersCount" value="${ordersCount+1}" />
                </c:if>
            </c:forEach>

            <%-- If this user has some orders - show his orders.--%>
            <c:if test="${ordersCount > 0}">
                <h1>Orders List</h1>
                <table class="tg">
                    <tr>
                        <th width="80">ID</th>
                        <th width="120">Title</th>
                        <th width="120">Cancel</th>
                    </tr>
                    <c:forEach items="${orders}" var="order">
                        <c:if test="${order.username == pageContext.request.userPrincipal.name}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.productTitle}</td>
                            <%-- Order may be cancelled only if 3 parameters will match: order ID, username, productTitle --%>
                            <td><a href="<c:url value='/user/cancelorder/${order.id}
                                    /${pageContext.request.userPrincipal.name}
                                    /${order.productTitle}'/>">Cancel</a></td>
                        </tr>
                        </c:if>
                    </c:forEach>
                </table>
            </c:if>

        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h2>Welcome : ${pageContext.request.userPrincipal.name}
                | <a href="<c:url value="/j_spring_security_logout" />" > Logout</a></h2>
        </c:if>
        </div>
    </body>
</html>
