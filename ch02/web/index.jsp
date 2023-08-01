<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>메인페이지</title>
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
  <h2>Index 메인 페이지</h2>
  <br>
  <nav class="nav">
    <ul class="list-group">
      <li class="list-group-item"><a href="test1.jsp?str=include">include 테스트</a></li>
      <li class="list-group-item"><a href="test1.jsp?str=forward">forward 테스트</a></li>
      <li class="list-group-item"><a href="test1.jsp?str=etc">etc 테스트</a></li>
      <li class="list-group-item"><a href="test2.jsp">자바 객체 테스트</a></li>
      <li class="list-group-item"><a href="">jsp scope 테스트</a></li>
    </ul>
  </nav>
</div>
</body>
</html>