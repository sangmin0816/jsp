<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="ch04.Member"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<%
    String name = "김멤버";
    int age = 10;
    int num1 = 10, num2=20, num3=30;

    List<Member> lst = new ArrayList<>();
    Member m1 = new Member(1, "Lee", "1234", "이",  100);
    Member m2 = new Member(2, "Choi","min", "최", 90);

    lst.add(m1); lst.add(m2);
    request.setAttribute("name", name);
    request.setAttribute("gae", age);
    request.setAttribute("num1", num1);
    request.setAttribute("num2", num2);
    request.setAttribute("num3", num3);
    request.setAttribute("m1", m1);
    request.setAttribute("m2", m2);
    request.setAttribute("lst", lst);
%>

<body>
<div class="container">
    <h1>EL & JSTL</h1>
    <hr>
    <h2>표현식</h2>
    <p><%=name %></p>
    <p><%=age %></p>
    <p><%=num1 %></p>
    <p><%=num2 %></p>
    <p><%=num3 %></p>
    <p><%=(num1+num2+num3)%></p>

    <hr>
    <h2>스크립트릿</h2>
    <%for(Member m: lst){%>
    <p><%=m.getId()%></p>
    <p><%=m.getName()%></p>
    <%}%>

    <hr>
    <h2>EL</h2>
    <p>${name}</p>
    <p>${age}</p>
    <p>${num1+num2+num3}</p>

    <h3>멤버 출력</h3>
    <p>m1.no: ${m1.no}, m1.name: ${m1.name}, m1.id: ${m1.id}, m1.pw: ${m1.pw}</p>

    <h3>리스트 출력</h3>
    <%for(Member m:lst){
      pageContext.setAttribute("m", m);
    %>
    <p>m.no: ${m.no}, m.name: ${m.name}</p>
    <%}%>

    <h3>표현어와 태그 라이브러이</h3>
    <c:forEach var="m" items="${lst}" varStatus="status">
        <p>status.content ${status.count} m.no ${m.no}</p>
    </c:forEach>
    <c:set var="tot" value="${num1+num2+num3}"/>
    <%-- c:set은 위와 같이 열림자와 닫힘자를 한 번에 쓸 수도 있다. --%>
    <p>tot: ${tot}</p>


</div>
</body>
</html>