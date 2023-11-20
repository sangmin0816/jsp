<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<header>
    <nav class="navbar fixed-top navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="${rootPath}">SamSam</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="gnb collapse navbar-collapse" id="navbarScroll">
                <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="${rootPath}">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${rootPath}/main/introduce.jsp">소개</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            서비스
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${rootPath}/BookList.do?category=*">도서 스토어</a></li>
                            <li><a class="dropdown-item" href="#">온라인 강의</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            커뮤니티
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${rootPath}/NoticeList.do">공지사항</a></li>
                            <li><a class="dropdown-item" href="${rootPath}/QnaList.do">묻고답하기</a></li>
                            <li><a class="dropdown-item" href="${rootPath }/FileboardList.do">학습자료실</a></li>
                            <li><a class="dropdown-item" href="${rootPath}/Online.do">1:1 문의</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="tnb d-flex">
                    <ul class="navbar-nav">
                        <c:choose>
                            <c:when test="${empty session_id}">
                                <li class="nav-item"><a class="nav-link" href="${rootPath }/member/login.jsp">로그인</a></li>
                                <li class="nav-item"><a class="nav-link" href="${rootPath }/member/term.jsp">회원가입</a></li>
                            </c:when>
                            <c:when test="${session_id eq 'admin'}">
                                <li class="nav-item"><a class="nav-link" href="${rootPath }/Logout.do">로그아웃</a></li>
                                <li class="nav-item"><a class="nav-link" href="${rootPath }/AdminMain.do">관리자</a></li>
                                <li class="nav-item"><a class="nav-link" href="${rootPath }/Mypage.do">마이페이지</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item"><a class="nav-link" href="${rootPath }/Logout.do">로그아웃</a></li>
                                <li class="nav-item"><a class="nav-link" href="${rootPath }/Mypage.do">마이페이지</a></li>
                                <li class="nav-item"><a class="nav-link" href="${rootPath }/CartList.do">장바구니</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</header>