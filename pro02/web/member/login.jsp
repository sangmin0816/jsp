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
<div class="wrap">
<%@ include file="../header.jsp" %>
<div class="contents" id="contents">
    <div class="breadcrumb">
        <p><a href="">HOME</a> &gt; <span>로그인</span></p>
    </div>
    <section class="page" id="page1">
        <div class="page_wrap">
            <h2 class="page_tit">로그인</h2>
            <div class="login_area">
                <form action="${rootPath}/LoginPro.do" id="login_frm" class="frm" method="post">
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
        </div>
    </section>
</div>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>