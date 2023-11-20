<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px;">
    <a href="" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <span class="fs-4">마이페이지</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li><a id="admin-main-nav" href="${rootPath}/Mypage.do" class="nav-link text-white">내 정보</a></li>
        <li><a id="admin-qna-nav" href="${rootPath}/Mypage.do" class="nav-link text-white">문의내역</a></li>
        <li><a id="admin-payment-nav" href="${rootPath}/PayList.do" class="nav-link text-white">결제내역</a></li>
    </ul>
</div>

<script>
    var link =  document.location.href;
    let nav;
    if(link.includes("My")) {
        nav = $("#admin-main-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    } else if(link.includes("Qna")){
        nav = $("#admin-qna-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    } else if(link.includes("Pay")){
        nav = $("#admin-payment-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    }
</script>
