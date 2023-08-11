<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전역변수 테스트1</title>
    <%
        String userId = application.getInitParameter("userId");
        String memId = application.getInitParameter("memberId");

        application.setAttribute("sid", "Kim1");
        String sid = (String) application.getAttribute("sid");
    %>
</head>
<body>
<div class="container">
    <a href="./index.jsp">To Home</a>
    <h1>Test01</h1>

    <h2><%=userId%>님의 웹 어플리케이션</h2>
    <h2><%=memId%></h2>
    <h2><%=sid%></h2>
    <a href="test02.jsp">Test02 Page</a>
</div>
</body>
</html>