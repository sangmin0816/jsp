<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>

<%
    String id = (String) session.getAttribute("id");
    Connection conn = null;
    PreparedStatement pstmt = null;
    Statement stmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    Member me = new Member();

    try {
        conn = con.connect();
        if(conn != null){
            System.out.println("DB 연결 성공");
        }
        String sql = "select * from member where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()){
            me.setId(rs.getString("id"));
            me.setPw(rs.getString("pw"));
            me.setName(rs.getString("name"));
            me.setEmail(rs.getString("email"));
            me.setTel(rs.getString("tel"));
            me.setRegdate(rs.getString("regdate"));
            me.setPoint(rs.getInt("point"));
        } else {
            response.sendRedirect("/member/login.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }
    String pw = me.getPw();
    String name = me.getName();
    String email = me.getEmail();
    String tel = me.getTel();
    String regdate = me.getRegdate();
    int point = me.getPoint();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
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
                <h2 class="page_tit">회원 정보</h2>
                <table class="tb1" id="mypage">
                    <tbody>
                    <tr>
                        <th>아이디</th>
                        <td><%=id %></td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <%
//                            System.out.println(pw);
                            String blind_pw = pw.substring(0, 2);
                            for(int i=0; i<pw.length()-2; i++){
                              blind_pw += "*";
                            }
                        %>
                        <td><%=blind_pw %></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><%=name %></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><%=email %></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><%=tel %></td>
                    </tr>
                    <tr>
                        <th>가입일</th>
                        <td><%=regdate %></td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td><%=point %></td>
                    </tr>
                    </tbody>
                </table>
                <br>
                <table class="tb1">
                    <tbody>
                    <tr>
                        <td><a href="/member/modify.jsp" class="inbtn">회원정보 수정</a></td>
                        <td><a href="/member/resign.jsp" class="inbtn">회원 탈퇴</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>