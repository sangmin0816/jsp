<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교재 페이지</title>
    <%@ include file="../common.jsp"%>
</head>

<body>
<%@ include file="../header.jsp"%>
<div style="display: flex; min-height: 80vh;">
    <div class="container" style="margin-top: 20px;">
        <c:set var="book" value="${book}"/>
        <div class="row">
            <div class="col-4">
                <img class="card-img-top" src="${rootPath}/storage/${book.imgSrc }" alt="${book.title }" width="100"/>
            </div>
            <div class="col-8">
                <table class="table">
                    <thead>
                    <tr>
                        <td colspan="2"><h2>${book.title }</h2></td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">카테고리</th>
                        <td>${book.category}</td>
                    </tr>
                    <tr>
                        <th scope="row">가격</th>
                        <td>${book.price}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="content">
            ${book.content}
        </div>
        <a class="btn btn-primary" href="${rootPath }/BookList.do" role="button">글 목록</a>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
