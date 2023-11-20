<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록</title>
    <%@ include file="../../common.jsp"%>
</head>
<body>
<%@ include file="../../header.jsp"%>
<div class="content container">
    <div class="d-flex justify-content-between">
        <h2>공지사항</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">공지사항</li>
        </ol>
    </div>
    <hr>
    <c:set var="qna" value="${qna}"/>
    <form action="${rootPath }/QnaUpdatePro.do" method="post">
        <input type="hidden" name="no" value="${qna.qno}">
        <div class="mb-3">
            <label class="form-label" for="title">제목</label>
            <input class="form-control" type="text" name="title" id="title" value="${qna.title}">
        </div>
        <div class="mb-3">
            <label for="content" class="form-label">내용 입력</label>
            <textarea class="form-control" name="content" id="content" rows="3">${qna.content}</textarea>
        </div>
        <div class="btn-group text-right" style="margin:20px 0;">
            <button type="submit" class="btn btn-main btn-medium">글 수정</button>
        </div>
    </form>
    <div class="btn-group text-right" style="margin:20px 0;">
        <a class="btn btn-main btn-medium" href="${rootPath }/QnaList.do" role="button">글 목록</a>
    </div>
</div>

<%@ include file="../../footer.jsp" %>
</body>
</html>