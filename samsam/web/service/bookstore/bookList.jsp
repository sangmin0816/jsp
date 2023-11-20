<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교재 목록</title>
    <%@ include file="../../common.jsp"%>
</head>

<body>
<%@ include file="../../header.jsp"%>
<div class="content container">
    <div class="d-flex justify-content-between">
        <h2>도서 상품</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">도서 상품</li>
            <li class="breadcrumb-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${rootPath }/BookList.do?category=*">전체</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <c:forEach var="category" items="${categoryList}" varStatus="status">
                        <li><a class="dropdown-item" href="${rootPath }/BookList.do?category=${category.categoryNo}">${category.categoryName}</a></li>
                    </c:forEach>
                </ul>
            </li>
        </ol>
    </div>
    <hr>
    <div class="d-flex">
        <c:forEach var="book" items="${bookList }">
            <div class="card" style="width: 18rem; margin: 10px;">
                <a href="${rootPath }/BookGet.do?proNo=${book.proNo }">
                    <img src="${book.img }" alt="${book.title }" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${book.title }</h5>
                            <%--            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>--%>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">${book.price } 원</li>
                    </ul>
                </a>
            </div>
        </c:forEach>
        <c:if test="${empty bookList }">
            <p class="text-center">등록된 상품이 없습니다.</p>
        </c:if>
    </div>
    </div>
<%@ include file="../../footer.jsp" %>
</body>
</html>

<script>
    $(document).ready(function(){
        if($(".card").length===0){
            $(".d-flex.align-content-start.flex-wrap").append("<div class='text-center align-center' style='margin-top: 50px; height: 30vh;'>해당 목록이 존재하지 않습니다.</div>");
        }
    })
</script>

