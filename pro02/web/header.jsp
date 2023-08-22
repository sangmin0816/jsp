<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<header class="header container-fluid fixed-top" id="hd" style="background-color: #435334">
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="${rootPath }/index.jsp">
                    <img src="${rootPath}/images/favicon-color.png" alt="SamSam" height="40">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="${rootPath }/ProList.do" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                상품
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${rootPath }/ProList.do">교과서</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${rootPath }/SourceUpload.do">업로드</a></li>
                                <li><a class="dropdown-item" href="#">문제집</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                커뮤니티
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${rootPath }/NoticeList.do">공지사항</a></li>
                                <li><a class="dropdown-item" href="${rootPath }/">묻고답하기</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${rootPath }/">학습후기</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="">ETC</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                        </li>
                    </ul>
                    <ul class="nav justify-content-end">
                    <c:choose>
                        <c:when test="${empty session_id}">
                            <li class="nav-item"><a href="${rootPath }/member/login.jsp" class="nav-link">Login</a></li>
                            <li class="nav-item"><a href="${rootPath }/member/term.jsp" class="nav-link">Join</a></li>
                        </c:when>
                        <c:when test="${session_id eq 'admin'}">
                            <li class="nav-item"><a href="${rootPath }/Logout.do" class="nav-link">Logout</a></li>
                            <li class="nav-item"><a href="${rootPath }/member/term.jsp" class="nav-link">Mypage</a></li>
                            <li class="nav-item"><a href="${rootPath }/NoticeListAdmin.do" class="nav-link">AdminPage</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a href="${rootPath }/Logout.do" class="nav-link">Logout</a></li>
                            <li class="nav-item"><a href="${rootPath }/member/mypage.jsp" class="nav-link">Mypage</a></li>
                        </c:otherwise>
                    </c:choose>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
