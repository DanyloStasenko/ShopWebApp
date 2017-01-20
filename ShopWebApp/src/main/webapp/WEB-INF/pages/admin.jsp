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
    <h1>Admin Page</h1>
    <c:if test="${!empty products}">
        <h1>Products List</h1>
        <table class="tg">
            <tr>
                <th width="80">ID</th>
                <th width="120">Title</th>
                <th width="120">Description</th>
                <th width="120">Price</th>
                <th width="60">Edit</th>
                <th width="60">Delete</th>
            </tr>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td><a href="/productdata/${product.id}" target="_blank">${product.title}</a></td>
                    <td>${product.description}</td>
                    <td>${product.price}</td>
                    <td><a href="/admin/editproduct/${product.id}" target="_blank">Edit</a></td>
                    <td><a href="<c:url value='/admin/remove/${product.id}'/>">Delete</a></td>
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

    <c:if test="${!empty users}">
        <h1>Users List</h1>
        <table class="tg">
            <tr>
                <th width="120">Username</th>
                <th width="120">Password</th>
                <th width="120">Role</th>
                <th width="120">Delete</th>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.role}</td>
                    <td><a href="/admin/removeuser/${user.username}" target="_blank">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <h1>Add a User</h1>
    <c:url var="addAction" value="/admin/adduser"/>
    <form:form action="${addAction}" commandName="user">
        <table>
            <c:if test="${!empty user.username}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="Username"/>
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
                    <form:label path="username">
                        <spring:message text="Username"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="username"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="password">
                        <spring:message text="Password"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="password"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="role">
                        <spring:message text="Role"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="role"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty user.username}">
                        <input type="submit"
                               value="<spring:message text="Edit User"/>"/>
                    </c:if>

                    <c:if test="${empty user.username}">
                        <input type="submit"
                               value="<spring:message text="Add User"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>

    <c:if test="${!empty orders}">
        <h1>Orders List</h1>
        <table class="tg">
            <tr>
                <th width="80">ID</th>
                <th width="120">User</th>
                <th width="120">ProductId</th>
            </tr>
            <c:forEach items="${orders}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.username}</td>
                    <td>${order.productId}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>Welcome : ${pageContext.request.userPrincipal.name}
            | <a href="<c:url value="/j_spring_security_logout"/>">Logout</a></h2>
    </c:if>

</body>
</html>
