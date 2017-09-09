<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Target!</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/stylet.css" rel="stylesheet">

    <%--this code will execute on every 5s so we are updating data with an AJAX request--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript">
        window.setInterval(function() {
            $('#updating').load('/target.html #updating');
        }, 5000);
    </script>

</head>
<body>
<div id = updating>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <c:if test="${!empty products}">
                    <h1>Products List:</h1>
                    <table class="table">
                        <thead>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Buy</th>
                        </thead>
                        <tbody>
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
                        </tbody>
                    </table>
                </c:if>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
