<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파일 업로드</title>
    <jsp:include page="../../common.jsp" />
</head>
<body>
<jsp:include page="../../header.jsp" />
<div style="display: flex; min-height: 80vh;">
    <%@include file="adminBoardList.jsp"%>
    <div class="container" style="margin-top: 20px;">
        <h2 class="title">교재 추가</h2>
        <div class="container">
            <form class="form_row" action="${path }/BookAddPro.do" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-2"><label for="category">카테고리</label></div>
                    <div class="col-8">
                        <select class="form-select" id="category" name="category">
                            <option selected>카테고리 선택</option>
                            <option value="1">Book</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2"><label for="title" class="form-label">교재 이름</label></div>
                    <div class="col-8"><input type="text" class="form-control col-10" id="title" name="title"></div>
                </div>
                <div class="row">
                    <div class="col-2"><label for="price" class="form-label">가격</label></div>
                    <div class="col-8"><input type="number" class="form-control" id="price" name="price"></div>
                </div>
                <div class="row">
                    <div class="col-2"><label for="content" class="form-label">내용</label></div>
                    <div class="col-8"><textarea class="form-control" id="content" name="content" rows="5"></textarea></div>
                </div>
                <div class="row">
                    <div class="col-2"><label for="imgSrc">파일 첨부</label></div>
                    <div class="col-8"><input type="file" class="form-control" id="imgSrc" name="imgSrc"></div>
                </div>
                <input type="submit" class="btn btn-primary mb-3" value="교재 추가">
            </form>

</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>
