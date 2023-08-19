<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 페이지</title>
    <%@ include file="../../common.jsp"%>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${rootPath}">Home</a></li>
                    <li class="breadcrumb-item"><a href="">Admin</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Notice</li>
                </ol>
            </div>
        </nav>
        <div class="container">
        <h2 class="title" style="margin: 30px auto;">공지사항 추가</h2>
        <form action="${rootPath }/NoticeAddPro.do" method="post">
            <div class="mb-3">
                <label class="form-label" for="title">제목</label>
                <input class="form-control" type="text" name="title" id="title">
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">내용 입력</label>
                <textarea class="form-control" name="content" id="content" rows="3"></textarea>
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3">글 등록</button>
            </div>
        </form>
        <a class="btn btn-primary" href="${rootPath }/NoticeListAdmin.do" role="button">글 목록</a>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>
