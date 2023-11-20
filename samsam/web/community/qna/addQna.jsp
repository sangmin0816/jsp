<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>qna 글쓰기</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../../common.jsp"%>

</head>
<body>
<%@ include file="../../header.jsp"%>

<div class="content container">
    <div class="d-flex justify-content-between">
        <h2>QnA 작성</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Qna작성</li>
        </ol>
    </div>
    <hr>
    <form action="${rootPath }/QnaAddPro.do" method="post">
        <input type="hidden" name="lev" value="0" >
        <input type="hidden" name="par" value="0" >

        <div class="mb-3">
            <label class="form-label" for="title">제목</label>
            <input class="form-control" type="text" name="title" id="title">
        </div>
        <div class="mb-3">
            <label for="content" class="form-label">내용 입력</label>
            <textarea class="form-control" name="content" id="content" rows="5"></textarea>
        </div>
        <div class="col-auto text-right">
            <button type="submit" class="btn btn-main btn-medium">글 등록</button>
        </div>
    </form>
    <div class="btn-group text-right" style="margin:20px 0;">
        <a class="btn btn-secondary" href="${rootPath }/QnaList.do" role="button">글 목록</a>
    </div>
</div>

<%@ include file="../../footer.jsp" %>
</body>
</html>
