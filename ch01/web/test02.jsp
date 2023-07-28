<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2023-07-28
  Time: 오후 2:18
  To change this template use File | Settings | File Templates.
--%>
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
    <h2 class="title"></h2>

    <form action="loginpro.jsp" class="form" method="post">
        <table class="table" id="tb1">
            <tbody>
            <tr>
                <th><label for="id">id</label></th>
                <td><input name="id" id="id" type="text" autofocus></td>
            </tr>
            <tr>
                <th><label for="pw">pw</label></th>
                <td><input name="pw" id="pw" type="password"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="제출" class="btn btn-danger">
                    <input type="reset" value="취소" class="btn btn-primary">
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <div>
        <a href="loginpro.jsp?qty=2&price=4000" class="btn btn-primary">qty price</a>
    </div>
</div>
</body>
</html>