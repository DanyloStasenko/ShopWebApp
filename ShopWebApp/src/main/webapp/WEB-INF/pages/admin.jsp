<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Admin Page</title>
        <link href="css/style.css" type="text/css" rel="stylesheet" />
    </head>

    <body>
        <div id="wrapper">
            <div id="header">
                <div id="menu">
                    <ul>
                        <li><a href="<c:url value="/home"/>">Home</a></li>
                        <li><a href="<c:url value="/products"/>">Products</a></li>
                        <li><a class="current" href="<c:url value="/admin"/>">Admin Page</a></li>
                        <li class="rightblock"> <a href="<c:url value="/j_spring_security_logout"/>">Logout (${pageContext.request.userPrincipal.name})</a></li>
                        <li class="rightblock"><a href="<c:url value="/basket"/>">Go to Basket</a></li>
                    </ul>
                </div>
            </div>

            <%--  P R O D U C T S  --%>

            <div id="content">
                <div class="container">
                    <div class="sidebar">
                    <h2 class="red-headline">Products List</h2>
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
                                <td><a href="/productdata/${product.id}" >${product.title}</a></td>
                                <td>${product.description}</td>
                                <td>${product.price}</td>
                                <td><a href="/admin/editproduct/${product.id}" >Edit</a></td>
                                <td><a href="<c:url value='/admin/remove/${product.id}'/>">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="contents">
                    <h2 class="red-headline">Add Product</h2>
                    <c:url var="addAction" value="/admin/add"/>
                    <form:form action="${addAction}" commandName="product">
                        <table class="tg">
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
                                        <spring:message text="Title "/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="title"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form:label path="description">
                                        <spring:message text="Description "/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="description"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <form:label path="price">
                                        <spring:message text="Price "/>
                                    </form:label>
                                </td>
                                <td>
                                    <form:input path="price"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <c:if test="${empty product.title}">
                                        <input type="submit"
                                               value="<spring:message text="Add Product"/>"/>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                    </form:form>
                </div>
            </div>

            <%--  U S E R S  --%>

            <div class="container">
                <div class="sidebar">
                <c:if test="${!empty users}">
                <h2 class="red-headline">Users List</h2>
                    <table class="tg">
                        <tr>
                            <th width="150">Username</th>
                            <th width="150">Password</th>
                            <th width="150">Role</th>
                            <th width="150">Delete</th>
                        </tr>
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td>${user.username}</td>
                                <td>${user.password}</td>
                                <td>${user.role}</td>
                                <td><a href="/admin/removeuser/${user.username}" >Delete</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>

            </div>
            <div class="contents">
                <h2 class="red-headline">Add a User</h2>
                <c:url var="addAction" value="/admin/adduser"/>
                <form:form action="${addAction}" commandName="user">
                    <table class="tg">
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
                            <td>
                                <form:label path="role">
                                    <spring:message text="Role "/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="role"/>
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
            </div>

                <div class="container">
                    <br>
                    <div class="divider"></div>
                </div>

                <%--  O R D E R S  --%>

                <h2 class="red-headline">Orders List</h2>
                <div class="container">
                    <div class="sidebarcenter">
                        <c:if test="${!empty orders}">
                            <table class="tg">
                                <tr>
                                    <th width="80">ID</th>
                                    <th width="120">User</th>
                                    <th width="120">Product</th>
                                    <th width="120">Remove</th>
                                </tr>
                                <c:forEach items="${orders}" var="order">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td>${order.username}</td>
                                        <td>${order.productTitle}</td>
                                        <td><a href="/admin/removeorder/${order.id}" >Remove</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:if>
                    </div>
                    <div class="contents">
                        </div>
                    </div>

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
