<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.*, java.text.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EL</title>
</head>
<body>
<div class="container">
    <a href="./index.jsp">To Home</a>
    <h1>EL(Expression Language) 표현 언어</h1>
    <%
        // 표현식 사용시에는 데이터변수로 저장하고, 매개변수로 전달해야 함.
        String title = "title";
        String[] value = {"val1", "val2", "val3"};
        Map<String, String> map1 = new HashMap<>();
        map1.put("name", "name1");
        map1.put("age", "100");
        map1.put("nick", "nickname");

        // EL 사용시에는 데이터를 넘기는 곳에서 set Attribute로 값을 지정해야 한다.
        request.setAttribute("tit", title);
        request.setAttribute("val", value);
        request.setAttribute("map", map1);
    %>
    <h2>표현식(Expression)</h2>
    <p>title: <%=title %></p>
    <p>value:
    <%
        for(String s: value){
    %> <%=s %>
    <%}%>
    </p>
    <p>map: <%=map1 %></p>

    <hr>
    <h2> 표현언어(Expression Language) </h2>
    <p>${tit}</p>
    <p>${val}</p>
    <c:forEach var="s" items="${val}">
        ${s }
    </c:forEach>
    <p>${map}</p>
    <%--  forward 문장을 기술하고 해당 문서가 화면에 로딩되고, 주소는 바뀌지 않고 전달됨  --%>
    <%--  받는 곳에서도 getAttribute하지 않고 표현언어로 받을 수 있다.  --%>
</div>
</body>
</html>
