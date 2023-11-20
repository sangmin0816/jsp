<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>로그인</title>
    <%@ include file="../common.jsp" %>
</head>

<body>
<%@include file="../header.jsp"%>
<div class="content d-flex justify-content-center align-items-center" style="min-height: 90vh;">
    <div class="block text-center" style="padding: 20px; min-width: 350px;">
        <h2 class="text-center">로그인</h2>
        <form class="form_row" action="${rootPath}/LoginPro.do" id="login_form" method="post">
            <input class="form-control" type="text" name="id" id="id" placeholder="아이디 입력" autofocus required>
            <input class="form-control" type="password" name="pw" id="pw"  placeholder="패스워드 입력" required>
            <input type="submit" class="btn btn-primary" value="로그인">
        </form>
        <p class="mt-20">회원가입을 하시겠습니까?&nbsp;&nbsp;&nbsp;<a href="${rootPath }/member/term.jsp">회원가입</a></p>
    </div>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>