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
    <style type="text/css">

        html, body, div,
        h1, h2, h3, h4, h5, h6, p,
        a, dl, dt, dd, ol, ul, li,
        fieldset, form, label,
        table, tr, th, td, footer, header,
        menu {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
        }

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

        body {
            font: 14px/1.5 Arial, Verdana, sans-serif;
            text-align: center;
            position: relative;
        }

        h1 {
            font-size: 55px;
            font-weight: bold;
            line-height: 1.4;
        }

        h2 {
            font-size: 24px;
        }

        a {
            color: #a03131;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        #wrapper {
            width: 960px;
            margin: 0 auto;
            min-height: 100%;
            background: #f7f3eb;
        }

        #header {
            overflow: hidden;
        }

        #menu {
            width: 960px;
            height: 70px;
            background: #282828;
        }

        #menu ul {
            padding-left: 40px;
            padding-top: 25px;
            overflow: hidden;
        }

        #menu ul li {
            float: left;
            font: bold 18px Arial, Verdana, sans-serif;
            color: #ffffff;
            margin-right: 70px;
        }

        #menu ul li a {
            color: #ffffff;
            display: block;
            line-height: 1;
        }

        #menu ul li span {
            color: #ff1600;
        }

        #menu ul li a:hover, #menu .current {
            text-decoration: none;
            border-bottom: 2px solid #ffffff;
        }

        #menu ul li a:hover  {
            text-decoration: none;
            border-bottom: 2px solid #a03131;
            color: #a03131;
        }

        #menu .rightblock {
            float: right;
            margin-right: 30px;
            line-height: 1;
        }

        .red-headline {
            font-size: 30px;
            font-weight: bold;
            color: #a03131;
            margin-top: 28px;
        }

        #social li {
            text-align: left;
            height: 39px;
            padding-left: 60px;
            padding-top: 4px;
            padding-bottom: 4px;
        }

        .footer {
            padding-top: 5px;
            padding-bottom: 7px;
            background: #282828;
        }

        .footer p {
            color: grey;
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

        .container {
            width:960px;
            margin:0 auto;
            overflow: hidden;
        }

        .center {
            margin: 0 auto;
            width: 70%;
        }

        li {
            list-style-type: none;
        }
    </style>
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
