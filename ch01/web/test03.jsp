<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2023-07-28
  Time: 오후 3:30
  To change this template use File | Settings | File Templates.
--%>
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
    <h2 class="title">설문조사</h2>
    <form action="research.jsp" class="frm" method="post">
        <table class="table" id="tb1">
            <tobdy>
                <tr>
                    <th><label for="id">id</label></th>
                    <td><input type="text" name="id" id="id" required autofocus></td>
                </tr>
                <tr>
                    <th><label for="year">출생년도</label></th>
                    <td><input type="number" name="year" id="year" min="1970" step="1" value="1990"></td>
                </tr>
                <tr>
                    <th><label for="name">name</label></th>
                    <td><input type="text" name="name" id="name" required></td>
                </tr>
                <tr>
                    <th><label>좋아하는 동물</label></th>
                    <td>
                        <input type="checkbox" name="animal" id="animal1" value="dog" checked><label for="animal1">강아지</label><br>
                        <input
                            type="checkbox" name="animal" id="animal2" value="cat"><label for="animal2">고양이</label><br>
                        <input
                            type="checkbox" name="animal" id="animal3" value="quokka"><label for="animal3">쿼카</label><br>
                        <input
                            type="checkbox" name="animal" id="animal4" value="snail"><label for="animal4">달팽이</label><br></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="제출" class="btn btn-danger">
                        <input type="reset" value="취소" class="btn btn-primary">
                    </td>
                </tr>
            </tobdy>
        </table>
    </form>
    <a href="index.jsp">메인으로</a>
</div>
</body>
</html>