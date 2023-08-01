<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 폼</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h2 class="title">로그인</h2>
    <form action="loginpro.jsp" class="frm" method="post">
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
                    <input type="submit" value="로그인" class="btn btn-danger">
                    <input type="reset" value="취소" class="btn btn-primary">
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <hr>
</div>
<div class="container">
    <a href="loginpro.jsp?qty=2&price=40000" class="btn btn-primary">GET 전송</a>
</div>
<div class="container">
    <h2 class="title">폼 전송</h2>
    <div class="msg">
        <table class="table">
            <tbody>
            <tr>
                <th>GET</th>
                <th>POST</th>
            </tr>
            <tr>
                <td>
                    <p>보안이 취약합니다.</p>
                    <p>전송 할 수 있는 데이터는 최대 255자입니다.</p>
                    <p>post에 비해 처리속도는 빠른 편입니다.</p>
                    <p>name=value의 형식으로 주소창에 전송됩니다.</p>
                    <p>서블릿에서는 doGet()을 이용합니다.</p>
                </td>
                <td>
                    <p>get에 비해 보안에 더 유리합니다.</p>
                    <p>전송 할 수 있는 데이터의 양이 무한입니다.</p>
                    <p>get에 비해 처리속도가 느립니다.</p>
                    <p>서블릿에서 doPost()를 이용합니다.</p>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>