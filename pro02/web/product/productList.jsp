<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>Product</title>
    <%@include file="/common.jsp"%>
</head>
<%
    String msg = (String) request.getAttribute("msg");
    System.out.println(msg);
%>
<body style="margin: 20px auto;">
<div class="container">
    <header>
        <%@include file="/header.jsp"%>
    </header>
    <div class="container">
        <div class="box_wrap">
            <ul class="list">
                <li>
                    <div class="card" style="width: 18rem;">
                        <img src="${path}/images/chick.gif" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">An item</li>
                            <li class="list-group-item">A second item</li>
                            <li class="list-group-item">A third item</li>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <footer><%@include file="/footer.jsp"%></footer>
</div>
</body>
</html>