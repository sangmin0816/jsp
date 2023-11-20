<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <%@ include file="../common.jsp" %>
</head>

<body>
    <%@ include file="../header.jsp"%>
    <div class="content">
        <div style="display: flex; min-height: 80vh;">
            <%@include file="myBoardList.jsp"%>
            <div class="container" style="margin-top: 20px;">
                <div class="d-flex justify-content-between">
                    <h2>마이페이지</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">마이페이지</li>
                    </ol>
                </div>
                <hr>

                <table class="table">
                    <tbody>
                        <tr>
                            <th>이름</th>
                            <td>${me.name}</td>
                        </tr>
                        <tr>
                            <th>아이디</th>
                            <td>${me.id}</td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td>${me.pw}</td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td>${me.tel}</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>${me.email}</td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>${address1 } ${address2 }</td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td>${me.birth}</td>
                        </tr>
                    </tbody>
                </table>
                <a href="${rootPath }/MypageUpdate.do" class="btn btn-primary mb-3">수정하기</a>
                <a href="${rootPath }/MypageDelete.do" class="btn btn-danger mb-3">탈퇴하기</a>
            </div>
        </div>
    </div>

    <%@ include file="../footer.jsp" %>
    </body>
</html>