<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Admin</title>
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
    <h1>Admin</h1>

    <h1>Products List</h1>

    <c:if test="${!empty products}">
        <table class="tg">
            <tr>
                <th width="80">ID</th>
                <th width="120">Title</th>
                <th width="120">Description</th>
                <th width="120">Price</th>
                <th width="60">Edit</th>
                <th width="60">Delete</th>
                    <%-- <th width="60">Order</th>--%>
            </tr>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td><a href="/productdata/${product.id}" target="_blank">${product.title}</a></td>
                    <td>${product.description}</td>
                    <td>${product.price}</td>
                    <td><a href="/editproduct/${product.id}" target="_blank">Edit</a></td>
                    <td><a href="<c:url value='/remove/${product.id}'/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <h1>Add a Product</h1>
    <c:url var="addAction" value="/admin/add"/>
    <form:form action="${addAction}" commandName="product">
        <table>
            <c:if test="${!empty product.title}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>

            <tr>
                <td>
                    <form:label path="title">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="title"/>
                </td>
            </tr>

            <tr>
                <td>
                    <form:label path="description">
                        <spring:message text="Description"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="description"/>
                </td>
            </tr>

            <tr>
                <td>
                    <form:label path="price">
                        <spring:message text="Price"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="price"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">

                    <c:if test="${!empty product.title}">
                        <input type="submit"
                               value="<spring:message text="Edit Product"/>"/>
                    </c:if>

                    <c:if test="${empty product.title}">
                        <input type="submit"
                               value="<spring:message text="Add Product"/>"/>
                    </c:if>

                </td>
            </tr>
        </table>
    </form:form>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>Welcome : ${pageContext.request.userPrincipal.name}
            | <a href="<c:url value="/j_spring_security_logout" />" > Logout</a></h2>
    </c:if>


    <h1>Users List</h1>

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

</body>
</html>
