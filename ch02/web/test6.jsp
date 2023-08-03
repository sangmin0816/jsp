<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test6</title>
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
    <a href="index.jsp">To Home</a>
    <h2>Scope Test Result - Test6</h2>
    <%
        String pageData = (String) pageContext.getAttribute("pageData");
        String requestData = (String) request.getAttribute("requestData");
        String sessionData = (String) session.getAttribute("sessionData");
        String appData = (String) application.getAttribute("appData");
        String path = request.getContextPath(); // 현재 프로젝트 디렉토리를 알아서 가져옴.
        // 설정할 때는 setContextPath()
        System.out.println("this is path"+path);
    %>
    <p><%=pageData %></p>
    <p><%=requestData %></p>
    <p><%=sessionData %></p>
    <p><%=appData %></p>
    <p>path: <%=path %></p>
    <p>img: <img src="<%=path%>/img/dog%20ears.gif" alt="img"></p>
    <%
        session.invalidate();
        if(sessionData!=null){
            out.println("<a href=\"test5.jsp\">test5</a>");
        }
        else{
            out.println("<a href=\"test4.jsp\">test4 로그인 먼저</a>");
        }
    %>


</div>
</body>
</html>