<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
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
    <link rel="stylesheet" href="../ft.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; margin-top: 150px;}
        .page::after { content:""; display:block; width: 100%; clear:both; }

        #page1 {display: flex; flex-wrap: wrap; justify-self: center; justify-content: space-around; align-content: flex-start; padding: 20px;}

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .board_tb {margin: 10px; width: 90vw;}
        .board_tb thead {background-color: darkturquoise;}
        .board_tb th {padding: 15px;}
        .board_tb td {border: 1px solid gray; padding: 15px;}

        .board_tb {margin: 10px; width: 90vw;}
        .board_tb [class*="item"] {padding: 10px; border: 1px solid gray}
        .board_tb thead {background-color: darkturquoise;}
        .board_tb .item1 {width: 5%; text-align: center;}
        .board_tb .item2 {width: 60%; text-align: center;}
        .board_tb .item3 {width: 15%; text-align: center;}
        .board_tb .item4 {width: 15%; text-align: center;}
        .board_tb .item5 {width: 5%; text-align: center;}

        .paragraph {width:90vw; margin:10px; padding: 15px; border: 1px solid gray; min-height: 40vh;}

        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }

    </style>
</head>

<%
    int bno = Integer.parseInt(request.getParameter("bno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "select * from board where bno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, bno);
    rs = pstmt.executeQuery();
    Board now = new Board();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");

    if(rs.next()){
      now.setBno(rs.getInt("bno"));
      now.setTitle(rs.getString("title"));
      now.setContents(rs.getString("contents"));
      now.setAuthor(rs.getString("author"));
      now.setRegdate(sdf.format(rs.getDate("regdate")));
      now.setCnt(rs.getInt("cnt"));
    }

    con.close(rs, pstmt, conn);
%>

<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <%
        if(sid==null){
          response.sendRedirect("/board/boardList.jsp");
        }
    %>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="../">HOME</a> &gt; <span>공지사항</span></p>
        </div>
        <section class="page" id="page1">
            <table class="board_tb">
                <thead>
                    <tr>
                        <th class="item1">글번호</th>
                        <th class="item2">글제목</th>
                        <th class="item3">작성자</th>
                        <th class="item4">작성일</th>
                        <th class="item5">조회수</th>
                    </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="item1"><%=now.getBno()%></td>
                    <td class="item2"><%=now.getTitle()%></td>
                    <td class="item3"><%=now.getAuthor()%></td>
                    <td class="item4"><%=now.getRegdate()%></td>
                    <td class="item5"><%=now.getCnt()%></td>
                </tr>
                </tbody>
            </table>
            <div class="paragraph">
                <%=now.getContents()%>
            </div>
            <%if(sid!=null && sid.equals("admin")){%>
            <a href="/board/boardList.jsp>" class="inbtn">글목록</a>
            <a href="/board/updateBoard.jsp?bno=<%=now.getBno()%>" class="inbtn">글수정</a>
            <div class="inbtn" onclick="isDelete()">글삭제</div>
            <%}%>
        </section>
        <script>
            function isDelete(){
                let isdelete = confirm("정말 삭제하시겠습니까?");
                if(isdelete){
                    location.href = "/board/deleteBoardPro.jsp?bno=<%=now.getBno()%>";
                }
            }
        </script>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>