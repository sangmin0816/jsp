<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jsp 8 객체</title>
    <%
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
    %>
</head>
<body>
<div class="msg">
    <h2>jsp의 8객체 : out, request, response, session, application, config,
        page, exception</h2>
    <p>별도의 객체 생성 없이 jsp에서 기본적으로 제공하는 객체</p>
    <%

        //서블리에서 page 객체 만들기
        //HttpServlet pageContext = new HttpServlet();
        //Object page = pageContext.getPage();

        //서블릿에서 out 객체 만드는 법
        //PrintWriter out = response.getWriter();

        //서블릿에서 request 객체 만드는 법
        //ServletRequest request = pageContext.getRequest();

        //서블릿에서 response 객체 만드는 법
        //ServletResponse response = pageContext.getResponse();

        //서블릿에서 session 객체 만드는 법
        //HttpSession session = pageContext.getSession();

        //서블릿에서 application 객체 만드는 법
        //ServletContext application = pageContext.getServletContext();

        //서블릿에서 config 객체 만드는 법
        //ServletConfig config = pageContext.getServletConfig();

        //서블릿에서 exception 객체 만드는 법
        //Exception exception = pageContext.getException();
        //서블릿에서 해당 객체를 만드는 방법
        JspWriter pageOut = pageContext.getOut();
        out.println("<h2>out : 출력 객체</h2>");
        out.println("<p>브라우저에 태그를 포함하여 출력할 수 있는 객체</p>");
        out.println(pageOut == out);

        ServletRequest pageRequest = pageContext.getRequest();
        out.println("<h2>request : 요청 객체</h2>");
        out.println("<p>브라우저에서 요청한 정보를 저장하고 있는 객체</p>");
        out.println(pageRequest == request);

        ServletResponse pageResponse = pageContext.getResponse();
        out.println("<h2>response : 응답 객체</h2>");
        out.println("<p>브라우저에서 보낼 정보를 저장하고 있는 객체</p>");
        out.println(pageResponse == response);

        HttpSession pageSession = pageContext.getSession();
        out.println("<h2>session : 세션 객체</h2>");
        out.println("<p>로그인 정보를 저장하고 있는 객체</p>");
        out.println(pageSession == session);

        ServletContext pageServlet = pageContext.getServletContext();
        out.println("<h2>application : 애플리케이션 객체</h2>");
        out.println("<p>프로그램이 시작되어 끝날 때까지 저장하고 있는 객체</p>");
        out.println(pageServlet == application);

        ServletConfig pageConfig = pageContext.getServletConfig();
        out.println("<h2>config : 응답 객체</h2>");
        out.println("<p>애플리케이션의 설정 정보를 저장하고 있는 객체</p>");
        out.println(pageConfig == config);

        Exception pageException = pageContext.getException();
        out.println("<h2>exception : 예외 처리 객체</h2>");
        out.println("<p>애플리케이션에서 예외 처리를 위한 객체</p>");
        //out.println(pageException == exception);

        Object pageObject = pageContext.getPage();
        out.println("<h2>page : 현재 페이지 객체</h2>");
        out.println("<p>현재 페이지에서만 사용할 내용을 저장하고 있는 객체</p>");
        out.println(pageObject == page);
    %>
</div>
</body>
</html>