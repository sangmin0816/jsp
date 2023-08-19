<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 페이지</title>
    <%@ include file="../common.jsp"%>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${rootPath }">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Community</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Notice</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">공지사항</h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table">
                    <thead>
                    <tr>
                        <th class="item2">제목</th>
                        <th class="item3">작성일</th>
                        <th class="item4">조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="notice" value="${notice}"/>
                    <tr>
                        <td class="item2">${notice.title}</td>
                        <td class="item3">${notice.resdate}</td>
                        <td class="item4">${notice.visited}</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            ${notice.content}
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
