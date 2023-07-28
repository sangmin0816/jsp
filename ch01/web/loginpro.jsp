<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2023-07-28
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%
        // 사용자에게는 보이지 않음
        String id = request.getParameter("id"); // name 속성이 id인 것만 저장
        String pw = request.getParameter("pw");
        int qw = 2; // 안 들어올 때를 대비하여 초기화 필요
        if(request.getParameter("qty") != null){
            qw = Integer.parseInt(request.getParameter("qty"));
        }
        int price = 1000; // null처리 하지 않으면 500번 내부 서버 오류 발생
        if(request.getParameter("price")!= null){
            qw = Integer.parseInt(request.getParameter("price"));
        }
    %>
</head>
<body>

<div class="container">
    <ul class="lst">
        <li><span> id <%=id %> </span></li>
        <li><span> pw <%=pw %> </span></li>
        <li><span> total <%=qw*price %> </span></li>
    </ul>
</div>

<a href="index.jsp">메인으로</a>
</body>
</html>