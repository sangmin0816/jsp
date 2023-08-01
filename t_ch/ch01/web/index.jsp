<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%!
  private String name;
  public String getName(){
    return this.name;
  }
  public void setName(String name){
    this.name = name;
  }
%>
<!DOCTYPE html>
<html>
  <head>
    <title>메인</title>
  </head>
  <body>
<%
  setName("김기태");
  String addr = "가산동";
%>
    <div class="container">
      <h2 class="title">천재교육</h2>
      <hr>
      <p>이름 : <%=getName() %></p>
      <p>주소 : <%=addr %></p>
      <a href="test01.jsp">테스트1</a><br>
      <a href="test02.jsp">로그인 폼 테스트</a><br>
      <a href="test03.jsp">복수 개의 값 전송</a><br>
      <a href="test04.jsp?msg=한시간남았네">요청 정보 및 헤더 정보</a><br>
      <a href="test05.jsp">로그인 폼 - response</a><br>
      <a href="test06.jsp">jsp 8 객체</a><br>
    </div>
  </body>
</html>
