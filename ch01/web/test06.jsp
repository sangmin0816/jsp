<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <%
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
    %>
</head>
<body>
<div class="container">
    <%
        JspWriter pageOut = pageContext.getOut();
        out.println("<h2>out: 출력 객체</h2>");
        out.println("<p>브라우저에 태그를 포함하여 출력할 수 있는 객체</p>");
        out.println(pageOut == out);

        ServletRequest pageRequest = pageContext.getRequest();
        out.println("<h2>request: 요청 객체</h2>");
        out.println("<p>브라우저에서 요청한 정보를 저장하고 있는 객체</p>");
        out.println(request == pageRequest);

        ServletResponse pageResponse = pageContext.getResponse();
        out.println("<h2>response: 응답 객체</h2>");
        out.println("<p>브라우저에서 보낼 정보를 저장하고 있는 객체</p>");
        out.println(response == pageResponse);

        HttpSession pageSession = pageContext.getSession();
        out.println("<h2>session: 세션 객체</h2>");
        out.println("<p>로그인 정보를 저장하고 있는 객체</p>");
        out.println(session == pageSession);

        ServletContext pageServlet = pageContext.getServletContext();
        out.println("<h2>application: 애플리케이션 객체</h2>");
        out.println("<p>프로그램이 시작되어 끝날 때까지 저장하고 있는 객체</p>");
        out.println(application == pageServlet);

        ServletConfig pageConfig = pageContext.getServletConfig();
        out.println("<h2>config: 응답 객체</h2>");
        out.println("<p>애플리케이션의 설정 정보를 저장하고 있는 객체</p>");
        out.println(pageConfig==config);

        Exception pageException = pageContext.getException();
        out.println("<h2>Exception: 예외 처리 객체</h2>");
        out.println("<p>애플리케이션에서 예외 처리를 위한 객체</p>");

        Object pageObject = pageContext.getPage();
        out.println("<h2>page: 현재 페이지 객체</h2>");
        out.println("<p>현재 페이지에서만 사용할 내용을 저장하고 있는 객체</p>");
        out.println(page == pageObject);
    %>
</div>

</body>
</html>