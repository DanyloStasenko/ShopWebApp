<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title></title>
</head>
<body>
    <%
        if (request.getUserPrincipal().getName() != null){
            String username = request.getUserPrincipal().getName();
            if (username.equals("admin"))
                response.sendRedirect("/admin");
        }
        else {
            response.sendRedirect("/products");
        }
    %>
</body>
</html>
