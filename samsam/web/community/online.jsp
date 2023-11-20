<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온라인 상담</title>
    <%@ include file="../common.jsp" %>

</head>

<%

%>


<body>
<%@ include file="../header.jsp" %>
<div class="content container">
    <div class="d-flex justify-content-between align-items-end">
        <h2>1:1문의</h2>
        <ol class="breadcrumb ">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">1:1 문의</li>
        </ol>
    </div>
    <hr>

    <form class="form_row" action="${rootPath}/OnlinePro.do" name="online" method="post">
        <div class="form-group">
            <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요." required>
            <input type="hidden" name="memId" id="memId" value="${session_id}">
        </div>
        <div class="form-group">
            <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
        </div>
        <div class="form-group">
            <input type="tel" class="form-control" id="tel" name="tel" placeholder="전화번호를 입력하세요">
        </div>
        <div class="form-group">
            <input type="text"  class="form-control" name="title" id="title" placeholder="상담 제목을 입력하세요.">
        </div>
        <div class="form-group">
            <textarea  class="form-control" name="content" id="content" placeholder="상담 내용을 입력하세요."></textarea>
        </div>
        <div class="text-center">
            <input type="submit" class="btn btn-primary" value="제출">
        </div>

    </form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>