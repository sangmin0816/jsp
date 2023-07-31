<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2023-07-31
  Time: 오후 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Response</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <%
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
    %>
</head>
<body>
<div class="container">
    <form name = "login_form" action="response.jsp" method="post">
        <table class="table" id="tb1">
            <tbody>
            <tr>
                <th><label for="id">ID</label></th>
                <td><input type="text" name="id" id="id"></td>
            </tr>
            <tr>
                <th><label for="pw">비밀번호</label></th>
                <td><input type="password" name="pw" id="pw"></td>
            </tr>
            <tr>
                <th><label for="submit">제출</label></th>
                <td><input type="submit" name="submit" id="submit" value="submit"></td>
            </tr>
            </tbody>
        </table>
    </form>
    <hr>
    <div id="msg">
        <%
            String msg = request.getParameter("msg");
            String id = (String) session.getAttribute("id");
            String pw = (String) session.getAttribute("pw"); // Attribute 객체로 반환하므로 (String)으로 cast  필요
        %>
        <% if(msg != null){ %>
            <h2>로그인 정보</h2>
            <p><%=msg %></p>
            <p>id: <%=id %></p>
            <p>pw: <%=pw %></p>
        <%}%>
    </div>
</div>
</body>
</html>