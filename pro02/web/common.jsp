<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="rootPath" value="<%=request.getContextPath() %>" />

<!-- 메타포, 오픈그래프, 파비콘, 폰트 등 각 종 자원 로딩 -->


<script src="${rootPath}/js/jquery-1.10.0.js"></script>
<script src="${rootPath}/js/nav.js"></script>
<link rel="stylesheet" href="${rootPath}/css/nav.css">
<link rel="stylesheet" href="${rootPath}/css/sub.css">
<link rel="stylesheet" href="${rootPath}/css/ft.css">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>


<style>
    #tb1 { width:960px; margin:40px auto; }
    #tb1 th { background-color: #111; color:#fff; }
    .item1 { width:10%; }
    .item2 { width:60%; }
    .item3 { width:20%; }
    .item4 { width:10%; }
    #page-nation1 { width: 960px; margin:20px auto; }
    .list li { margin-top: 24px; }
</style>



<style>
    .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

    .tb1 { width:500px; margin:50px auto; }
    .tb1 th { width:180px; line-height:32px; padding-top:8px; padding-bottom:8px;
        border-top:1px solid #333; border-bottom:1px solid #333;
        background-color:deepskyblue; color:#fff; }
    .tb1 td { width:310px; line-height:32px; padding-top:8px; padding-bottom:8px;
        border-bottom:1px solid #333;
        padding-left: 14px; border-top:1px solid #333; }

    .indata { display:inline-block; width: 500px; height: 48px; line-height: 48px;
        text-indent:14px; font-size:18px; }
    .inbtn { display:block;  border-radius:100px;
        min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
        line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
    .inbtn:first-child { float:left; }
    .inbtn:last-child { float:right; }

    .agree_fr { width: 900px; margin: 20px auto; border:1px solid #eee;
        padding: 20px; overflow-y: auto;
        height: 250px; white-space: pre-wrap; }
    .btn_fr{text-align:center;}
</style>

<style>
    .join > table {width:800px;margin:0 auto}
    .join > table tr {height:24px;}
    .join > table th, .join > table td {font-size:16px;padding:12px 0;text-align:left;height:76px;box-sizing:border-box;vertical-align:top;}
    .join > table th {padding-top:28px;font-size:18px;}
    .join > table td {padding-left:14px;}
    .join > table td > input {display:inline-block;width:calc(100% - 4px);height:48px;line-height:48px;text-indent:16px;font-size:18px;}

    .join .btn_area {text-align:right;}
    .term .important, .join .important {color:red;font-weight:900;}
    .join .use_btn > button {width:100%;height:100%;border:none;display:inline-block;border-radius:10px;text-align:center;color:white;font-weight:500;font-size:18px;}
    .join .use_btn > button:hover, .join .use_btn > button:active {box-shadow:2px 2px 5px #333;}

    .term input[type="checkbox"]{border: 0; clip: rect(0 0 0 0); height: 1px; margin: -1px; overflow: hidden; padding: 0; position: absolute; width: 1px;}
    .term input[type="checkbox"] + label{display:inline-block; position:relative; vertical-align:middle; padding-left:40px; line-height:28px; font-size:18px;}
    .term input[type="checkbox"] + label:after{content:""; display:block; position:absolute; top:0; left:0; width:31px; height:31px; background:url(../image/join/chk_ico.png) 0 0 no-repeat;}
    .term input[type="checkbox"]:checked + label:after{background-position:0 -31px;}

    .term {width:800px;margin:0 auto}
    .term ul li{display:flex; align-items:center; justify-content:space-between; padding:14px 0;}
    .term ul li p .essential{color:#ed3535;}
    .term ul li a{position:relative; font-size:14px; color:#97999b;}
    .term ul li a:before{content:""; display:inline-block; position:absolute; bottom:-1px; left:0; width:100%; border-bottom:1px solid #97999b;}

    .inBtn.center{display:block;margin:10px auto 0;width:80%;background-color:var(--third-color);}
</style>