<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="rootPath" value="<%=request.getContextPath() %>" />

<meta http-equiv="X-UA-Compatible" content="IE=dege"> <!-- 인터넷익스프로러로 접근시 엣지로 연결되게 함 -->
<meta http-equiv="Author" content="sangmin0816">
<meta http-equiv="Publisher" content="sangmin0816">

<!-- 검색엔진 최적화(SEO) -->
<meta name="Subject" content="쌤쌤, SamSam, samsam">
<meta name="Keyword" content="쌤쌤, SamSam, samsam, edutech, 에듀테크">
<meta name="Description" content="쌤쌤은 에듀테크 스타트업으로 교육의 평등과 혁신을 추구합니다.">
<meta name="Robots" content="index, follow">

<!-- 오픈 그래프(Open graph)-->
<meta property="og:type" content="website">
<meta property="og:title" content="SamSam">
<meta property="og:description" content="교육의 평등과 혁신">
<meta property="og:image" content="">
<meta property="og:url" content="">

<!-- 파비콘 설정 -->
<!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="${rootPath }/images/common/icon.ico">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="${rootPath }/images/common/icon_48.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="${rootPath }/images/common/icon_48.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="${rootPath }/images/common/icon_16.png" sizes="16x16">
<link rel="icon" href="${rootPath }/images/common/icon_36.png" sizes="36x36">
<link rel="icon" href="${rootPath }/images/common/icon_48.png" sizes="48x48">


<%-- 부트스트랩--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%--jqeury--%>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<%--맵 api--%>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/54/2/intl/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/54/2/intl/ko_ALL/util.js"></script></head>

<%--CSS--%>
<link rel="stylesheet" href="${rootPath}/css/body.css">
<link rel="stylesheet" href="${rootPath}/css/sidebar.css">

<%--불펌 방지--%>
<script>
    document.oncontextmenu = function() { return false; }
    document.ondragstart = function() { return false; }
    document.onselectstart = function() { return false; }
</script>
