<%@ page import="java.util.Enumeration" %>
<%@ page import="java.net.InetAddress" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div class="container">
    <a href="./index.jsp">To Home</a>
    <%
        Enumeration e = request.getHeaderNames();
        while(e.hasMoreElements()){
            String name = (String) e.nextElement();
            String value = request.getHeader(name);
            out.println("<p>name: "+name+", value: "+value+"</p>");
        }
    %>
    <h2>Server or Client IP Address/HostName</h2>
    <%
        out.println("<p>접속 PC 주소 "+request.getLocalAddr()+"</p>");
        InetAddress ipaddr = InetAddress.getLocalHost();
        out.println("<p>서버 주소 "+request.getRemoteAddr()+"</p>");
        out.println("<p>서버 주소 "+ipaddr+"</p>");
        out.println("<p>서버 홈 디렉토리 "+request.getContextPath()+" 이게 다입니다"+"</p>");
    %>
</div>
</body>
</html>



