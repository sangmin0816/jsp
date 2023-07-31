<%@ page import="java.util.Collection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Response</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <%
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
    %>
</head>
<body>
<div class="container">
    <%
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String msg = "";
        Cookie ck  = null;

        response.addHeader("Site", "https://chunjae.co.kr"); // 있는 헤더 추가
        response.setHeader("Url2", "https://www.naver.com"); // 없는 헤더 추가
        // out.prinln(""); // 페이지에서 출력
        if(id.equals("admin") && pw.equals("1234")){
            session.setAttribute("id", id);
            session.setAttribute("pw", pw);
            msg = "로그인 성공";
//            response.sendRedirect("test05.jsp?msg="+msg);

//            session.invalidate(); // 로그아웃 처리. 모든 session의 설정된 attribute를 지움
//            session.removeAttribute("id"); // 특정 항목의 session atttribute를 지움

//            response.setStatus(200);
//            response.sendError(200, "페이지가 정상적으로 처리되었습니다."); // 수동 정상 처리

        }
        else{
            msg = "login_fail";
            response.sendRedirect("test05.jsp?msg="+msg);
            //response.sendRedirect("test05.jsp?msg="+URLEncoder.encode(msg, StandardCharsets.UTF_8));

//            response.setStatus(404);
//            response.sendError(404, "해당페이지가 존재하지 않습니다."); // 수동 오류 처리
        }
    %>
    <p><a href="test05.jsp?msg=<%=msg %>">test05 <%=msg %></a></p>

    <table class="table" id="tb1">
        <tbody>
        <%
            Collection<String> arr= response.getHeaderNames();
            System.out.println(arr);
            for(String s: arr){
        %>
        <tr>
            <th><%=s %></th>
            <td><%=response.getHeader(s)%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <p>콘텐츠 유형<%=response.getContentType()%></p>
    <p>문자 인코딩<%=response.getCharacterEncoding()%></p>
    <p>추가된 헤더 존재 유무 <%=response.containsHeader("Site")%></p>
    <p>설정된 헤더 존재 유무 <%=response.containsHeader("Url2")%></p>
    <p>저장된 상태코드: <%=response.getStatus()%></p>
    <p>저장된 세션 아이디:<%=session.getAttribute("id")%></p>
    <p>저장된 세션 비밀번호: <%=session.getAttribute("pw")%></p>
</div>
</body>
</html>