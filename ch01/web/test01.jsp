<%--  --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%!
    private String name;
    public String getName(){return this.name;}
    public void setName(String name){
        this.name = name;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Test</title>
</head>
<body>
<%-- 스크립트릿 --%>
<%
    setName("김일일");
    String addr = "일일동";

%>
<hr>
<p>이름: <%=getName() %>;</p>
<p>주소: <%=addr%></p>
<a href="index.jsp">메인으로</a>
<a href="./test02.jsp">테스트2</a>
</body>
</html>
