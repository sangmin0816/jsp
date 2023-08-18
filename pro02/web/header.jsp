<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="rootPath" value="<%=request.getContextPath() %>" />

<header class="header container-fluid" id="hd">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="${rootPath}/index.jsp">CHUNJAE</a>
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
                                <li><a class="dropdown-item" href="#">참고서</a></li>
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
                        <li class="nav-item"><a href="${rootPath }/Login.do" class="nav-link">Login</a></li>
                        <li class="nav-item"><a href="${rootPath }/Join.do" class="nav-link">Join</a></li>
                        <li class="nav-item"><a href="${rootPath }/AdminNoticeList.do" class="nav-link">AdminPage</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
