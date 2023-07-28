<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2023-07-28
  Time: 오후 3:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설문조사 결과</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String year = request.getParameter("year");
        String name = request.getParameter("name");
        String[] animal = request.getParameterValues("animal");

        for(int i=0; i<animal.length; i++){
            switch (animal[i]){
                case "dog":
                    animal[i] = "강아지";
                    break;
                case "cat":
                    animal[i] = "고양이";
                    break;
                case "quokka":
                    animal[i] = "쿼카";
                    break;
                case "snail":
                    animal[i] = "달팽이";
                    break;
            }
        }
    %>
<div class="container">
    <h2 class="title">설문조사 결과</h2>
    <ul class="list-group">
        <li class="list-group-item">ID <%=id %></li>
        <li class="list-group-item">출생년도 <%=year %></li>
        <li class="list-group-item">이름 <%=name %></li>
        <li class="list-group-item">좋아하는 동물 <%=Arrays.toString(animal)  %></li>
    </ul>
    <a href="index.jsp">메인으로</a>
</div>
</body>
</html>