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
<%@ include file="../header.jsp" %>

<div class="container contents">
    <h2 class="page_title text-center">로그인</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Login</li>
        </ol>
    </nav>

    <%-- 로그인 Form   --%>
    <form action="${rootPath}/LoginPro.do" id="login_form" class="form" method="post">
        <table class="tb1">
            <tbody>
            <tr>
                <td><input type="text" name="id" id="id" class="indata" placeholder="아이디 입력" autofocus required></td>
            </tr>
            <tr>
                <td><input type="password" name="pw" id="pw" class="indata" placeholder="패스워드 입력" required></td>
            </tr>
            <tr>
                <td>
                    <div class="btn_group">
                        <input type="submit" value="로그인" class="inBtn inBtn1">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>