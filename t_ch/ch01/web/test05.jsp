<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>response</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <h2 class="title">Response 객체 폼</h2>
        <form name="login_form" action="response.jsp" method="post">
            <table class="table" id="tb1">
                <tbody>
                <tr>
                    <th><label for="id">아이디</label></th>
                    <td><input type="text" name="id" id="id" required autofocus></td>
                </tr>
                <tr>
                    <th><label for="pw">비밀번호</label></th>
                    <td><input type="password" name="pw" id="pw" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="로그인" class="btn btn-primary"> &nbsp; &nbsp; &nbsp; &nbsp;
                        <input type="reset" value="취소" class="btn">
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
    <hr>
<%
    String msg = request.getParameter("msg");
    String id = (String) session.getAttribute("id");
    String pw = (String) session.getAttribute("pw");
%>
    <div class="container">
        <h2>로그인 정보</h2>
        <%        if(msg!=null){    %>
            <p>메시지 : <%=msg %></p>
        <%        }    %>
        <%        if(id!=null){    %>
            <p>로그인 아이디 : <%=id %></p>
            <p>로그인 비밀번호 : <%=pw %></p>
        <%        }    %>
    </div>
</body>
</html>