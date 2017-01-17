<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
    <head>
        <title>productData</title>
            <style type="text/css">
                .tg
                {
                    border-collapse: collapse;
                    border-spacing: 0;
                    border-color: #ccc;
                }
                .tg td
                {
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
                .tg th
                {
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
        <h1>Product Details</h1>
        <table class="tg">
            <tr>
                <th width="80">ID</th>
                <th width="120">Title</th>
                <th width="120">Description</th>
                <th width="120">Price</th>
            </tr>
            <tr>
                <td>${product.id}</td>
                <td>${product.title}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
            </tr>
        </table>
    </body>
</html>