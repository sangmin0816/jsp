<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%@ page import="com.chunjae.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온라인 상담</title>
    <%@ include file="../head.jsp" %>

</head>

<%

%>


<body>

<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="banner">
            <div class="breadcrumb">
                <p><a href="../">HOME</a> &gt; <span>온라인 상담</span></p>
            </div>
            <h2 class="page_tit">온라인 상담</h2>
        </div>
        <div class="my_page">
            <form action="onlinePro.jsp" name="online" id="online_form" method="post">
                <table class="table_form">
                    <tbody>
                    <tr>
                        <th>보내는 이름</th>
                        <td><input type="text" name="name" id="name"></td>
                    </tr>
                    <tr>
                        <th>보내는 id</th>
                        <td><input type="text" name="author" id="author"></td>
                    </tr>
                    <tr>
                        <th>보내는 사람 email 주소</th>
                        <td><input type="email" name="email" id="email"></td>
                    </tr>
                    <tr>
                        <th>보내는 사람 전화번호</th>
                        <td><input type="tel" name="tel" id="tel"></td>
                    </tr>
                    <tr>
                        <th>상담 제목</th>
                        <td><input type="text" name="new_title" id="new_title" placeholder="상담 제목을 입력하세요."></td>
                    </tr>
                    <tr>
                        <th>상담내용</th>
                        <td><textarea name="new_content" id="new_content" placeholder="상담 내용을 입력하세요."></textarea></td>
                    </tr>
                    </tbody>
                </table>
                <input type="submit" class="inbtn">
            </form>
        </div>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>