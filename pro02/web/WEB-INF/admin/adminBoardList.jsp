<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <span class="fs-4">관리자페이지</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li>
            <a href="${rootPath}/MemberListAdmin.do" class="nav-link text-white">
                회원 관리
            </a>
        </li>
        <li class="nav-item">
            <a href="${rootPath}/NoticeListAdmin.do" class="nav-link" aria-current="page">
                공지사항 관리
            </a>
        </li>
        <li>
            <a href="${rootPath}/BookListAdmin.do" class="nav-link text-white">
                교재 관리
            </a>
        </li>
    </ul>
</div>