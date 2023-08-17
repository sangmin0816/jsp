<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>Document</title>
    <%@include file="/common.jsp"%>
</head>
<body style="margin: 20px auto;">
<div class="container">
    <header>
        <%@include file="/header.jsp"%>
    </header>
    <div class="contents">
        <h2>사용자: ${user }</h2>
        <h2>realPath: ${realPath }</h2>
        <%--    절대주소--%>
        <c:set var="path" value="<%=request.getContextPath()%>"/>
        <%--    상대주소--%>
        <h2>path: ${path }</h2>
        <p>chick in outer images</p><img src="./images/chick.gif" alt="">
        <p>otter in outer images</p><img src="./images/hello-cute.gif" alt="">
        <p>otter in inner img</p><img src="./WEB-INF/img/hello-cute.gif" alt="">
        <div class="btn-group">
            <a href="" class="btn btn-primary">서브1</a>
            <a href="" class="btn btn-primary">서브2</a>
        </div>
    </div>
    <footer><%@include file="/footer.jsp"%></footer>
</div>
</body>
</html>