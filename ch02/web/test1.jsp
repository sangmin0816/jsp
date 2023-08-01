<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test1</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
    %>
</head>
<body>
<div class="container">
    <h2>pageContext</h2>
    <hr>
    <p>JSP 페이지에 대해 1:1로 연결된 객체로 JSP 페이지당 하나의 pageContext 객체가 생성됨</p>
    <%
        String str = request.getParameter("str");
        if(str.equals("include")){
            pageContext.include("target.jsp"); // target.jsp를 내장시켜라
        } else if(str.equals("forward")){
            pageContext.forward("target.jsp"); // target.jsp에 데이터를 보내라
        } else {
            out.println("<h2>잘못된 값입니다.</h2>"); //
        }
    %>
    <br><br><br><br>
    <h3>그 아래 내용</h3>
</div>
</body>
</html>