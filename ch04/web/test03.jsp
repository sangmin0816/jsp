<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page 03</title>
    <%
        pageContext.setAttribute("name", "Kim1");
        pageContext.setAttribute("age", "1");
    %>
</head>
<body>
<div class="container">
    <a href="./index.jsp">To Home</a>

    <h2 class="title">include directive</h2>
    <div class="container">
        <%@ include file="test03Include.jsp"%>
    </div>

    <h2 class="title">include action tag</h2>
    <div class="container">
        <jsp:include page="test03Include.jsp"></jsp:include>
    </div>
</div>
</body>
</html>