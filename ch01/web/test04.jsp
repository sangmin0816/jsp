<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2023-07-28
  Time: 오후 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--파일 업로드할 때 별도로 accept MIME type 설정해야 한다. 나중에 별도로 application해야 파일 업로드할 수 있다. 폼태그에 속성 뭐라는거야 짜증나
폼 안의 내용은 text로 인식하므로 별도로 MIME type 설정해야 한다.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤더 정보 출력하기</title>
    <%
        request.setCharacterEncoding("UTF-8");
        String msg = request.getParameter("msg");
    %>
</head>
<body>
<div class="container">
    <h2 class="title">요청 정보 및 헤더 정보 출력</h2>
    <hr>
    <ul class="list">
        <li><span>메시지: </span><strong><%=msg %></strong></li>
        <li><span>프로토콜: </span><strong><%=request.getProtocol() %></strong></li>
        <li><span>요청된 서버 이름: </span><strong><%=request.getServerName() %></strong></li>
        <li><span>요청 방식: </span><strong><%=request.getMethod() %></strong></li>
        <li><span>파라미터열 쿼리 스트링: </span><strong><%=request.getQueryString() %></strong></li>
        <li><span>요청 주소: </span><strong><%=request.getRequestURL() %></strong></li>
        <li><span>요청 uri: </span><strong><%=request.getRequestURI() %></strong></li>
        <li><span>서버 이름: </span><strong><%=request.getRemoteHost() %></strong></li>
        <li><span>서버 주소: </span><strong><%=request.getRemoteAddr() %></strong></li>
<%--서버 이름과 주소가 같다.--%>
        <li><span>서버포트 원격: </span><strong><%=request.getRemotePort()%></strong></li>
        <li><span>서버포트 지역: </span><strong><%=request.getServerPort()%></strong></li>
        <li><span>현재문서경로: </span><strong><%=request.getContextPath() %></strong></li>
<%--.getContextPath() 중요--%>
        <li><span>header accept: </span><strong><%=request.getHeader("Accept") %></strong></li>
        <li><span>header host address: </span><strong><%=request.getHeader("Host")%></strong></li>
    </ul>
    <hr>
    <h2 class="title">헤더 정보</h2>
    <table class="table" id="tb1">
        <tbody>
        <%
            Enumeration e = request.getHeaderNames();
            while(e.hasMoreElements()){
                String hdname = (String) e.nextElement();
        %>
        <tr>
            <th><%=hdname %></th>
            <td><%=request.getHeader(hdname)%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>