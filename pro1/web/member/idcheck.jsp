<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 중복 검사</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");

    String id = request.getParameter("id");
%>
<div class="container">
    <form name="child" action="idload.jsp" method="post" onsubmit="return invalidCheck(this)">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" value="<%=id %>" placeholder="12글자 이내">
        <input type="submit" value="아이디 중복 검사">
    </form>
    <script>
        document.getElementById("id").value = opener.document.getElementById("id").value;
        function invalidCheck(f){
            var id = f.id.value;
            if(id.length>12){
                alert("아이디의 글자수는 12글자 이내입니다.");
                f.id.focus();
                return false;
            }
        }
    </script>
</div>
</body>
</html>