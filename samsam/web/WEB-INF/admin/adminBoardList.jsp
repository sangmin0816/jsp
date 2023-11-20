<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="rootPath" value="<%=request.getContextPath() %>" />

<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <span class="fs-4">관리자 페이지</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li><a id="admin-main-nav" href="AdminMain.do" class="nav-link text-white">Home</a></li>
        <li><a id="admin-member-nav" href="MemberListAdmin.do" class="nav-link text-white">회원 관리</a></li>
        <li><a id="admin-notice-nav" href="NoticeListAdmin.do" class="nav-link text-white">공지사항 관리</a></li>
        <li><a id="admin-book-nav" href="BookListAdmin.do?category=*" class="nav-link text-white">교재 관리</a></li>
        <li><a id="admin-delivery-nav" href="DeliveryListAdmin.do" class="nav-link text-white">배송 관리</a></li>
        <li><a id="admin-file-nav" href="FileboardListAdmin.do" class="nav-link text-white">자료 관리</a></li>
    </ul>
</div>

<script>
    var link =  document.location.href;
    let nav;
    if(link.includes("Main")) {
        nav = $("#admin-main-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    } else if(link.includes("Member")){
        nav = $("#admin-member-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    } else if(link.includes("Notice")){
        nav = $("#admin-notice-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    } else if(link.includes("Book")){
        nav = $("#admin-book-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    } else if(link.includes("Delivery")){
        nav = $("#admin-delivery-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    } else if(link.includes("File")){
        nav = $("#admin-file-nav");
        $(nav).attr("aria-current", "page");
        $(nav).addClass("active");
    }
</script>
