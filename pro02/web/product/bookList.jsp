<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교재 목록</title>
    <%@ include file="../common.jsp"%>
</head>

<body>
<%@ include file="../header.jsp"%>
<div class="container contents text-center">
    <h2 class="page_title text-center">교과서 목록</h2>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-end">
            <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
            <li class="breadcrumb-item"><a href="#">상품</a></li>
            <li class="breadcrumb-item active" aria-current="page">교과서</li>
        </ol>
    </nav>
    <div class="d-flex align-content-start flex-wrap">
    <c:forEach var="book" items="${bookList}" varStatus="status">
        <div class="card" style="width: 18rem; margin: 10px;">
            <a href="${rootPath}/BookGet.do?id=${book.id }">
            <img class="card-img-top" src="${rootPath}/storage/${book.imgSrc }" alt="${book.title }" width="100"/>
            </a>
            <div class="card-body">
                <h5 class="card-title">${book.title}</h5>
                <p class="card-text">${book.price} 원</p>
            </div>

        </div>
    </c:forEach>
    </div>
    <ul class="pagination">
        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li>
    </ul>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
