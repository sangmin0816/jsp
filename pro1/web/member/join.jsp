<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../google.css">
    <link rel="stylesheet" href="../fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../common.css">
    <link rel="stylesheet" href="../hd.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:500px; margin:20px auto;}
        #mypage *{padding: 10px; line-height: 32px; border-top: 1px solid black; border-bottom: 1px solid black;}
        .tb1 th {width: 200px;}
        .tb1 td { width: 300px;}

        .indata { display:inline-block; width: 500px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="../ft.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="../">HOME</a> &gt; <span>로그인</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">회원 정보 수정</h2>
                <form action="/member/joinpro.jsp" id="join_form" class="frm" onsubmit="return join(this)" method="post">
                    <table class="tb1" id="mypage">
                        <tbody>
                        <%-- tr>(th+td)--%>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input type="text" name="id" id="id" class="indata" required autofocus>
                                <button type="button" id="ck_btn" onclick="idcheck()" class="inbtn" style="margin: 10px;">아이디 중복 체크</button>
                                <input type="hidden" name="ck_item" id="ck_item" value="false">
                            </td>
                        </tr>
                        <tr>
                            <th>패스워드</th>
                            <td><input type="password" name="pw" id="pw" class="indata"required></td>
                        </tr>
                        <tr>
                            <th>패스워드 확인</th>
                            <td><input type="password" name="pw_val" id="pw_val" class="indata"required></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input type="email" name="email" id="email" class="indata"required></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="tel" name="tel" id="tel" class="indata"required></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="회원가입" class="inbtn"></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>

<script>
    // 폼 입력값에 대한 유효성 검증
    var form = document.getElementById("join_form");
    function join(frm){
        if(frm.pw.value === frm.pw_val.value){
            <%System.out.println("비밀번호 다름");%>
            if(frm.ck_itm.value!="false"){
                alert("아이디 중복 검색을 진행하시길 발랍니다.")
                frm.id.focus();
                return false;
            }
        }
        else{
            alert("비밀번호와 비밀번호 확인이 다릅니다");
            return false;
        }
    }
    function idcheck(){
        var id = document.getElementById("id");
        var child;
        if(id.value==""){
            alert("아이디 입력 칸이 비어있습니다.");
            id.focus();
            return false;
        } else if(id.value.length<3 || id.value.length>20){
            alert("아이디는 3글자 이상 20글자 이하입니다.")
            id.focus()
            return false;
        }
        else{
           child = window.open("/member/idcheck.jsp", "_child", "width=400, height=300, top=100, left=100, location=no, menubar=no, toolbar=no");
           return;
        }
    }
</script>
</body>
</html>