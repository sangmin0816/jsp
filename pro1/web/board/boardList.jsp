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

    <link rel="stylesheet" href="../dataTables.css" />
    <script src="../dataTables.js"></script>

    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; margin-top: 150px; display:flex; flex-wrap: wrap; justify-content: center;}
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .breadcrumb { clear:both; width:1200px; margin: 0 auto; text-align: right; color:#fff; padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .table_container {margin:10px; width:90vw;}

        .board_tb [class*="item"] {padding: 20px;}
        .board_tb thead {background-color: darkturquoise;}
        .board_tb td {border: 1px solid gray;}
        .board_tb .item1 {width: 10%; text-align: center;}
        .board_tb .item2 {width: 60%; text-align: center;}
        .board_tb .item3 {width: 15%; text-align: center;}
        .board_tb .item4 {width: 15%; text-align: center;}

        .inbtn { display:block;  border-radius:100px; min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center; line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>
</head>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "select * from board order by bno desc";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Board> boards = new ArrayList<>();

    SimpleDateFormat ndf = new SimpleDateFormat("yyyy년 MM월 dd일");
    while(rs.next()){
      boards.add(new Board(rs.getInt("bno"), rs.getString("title"), rs.getString("contents"), rs.getString("author"), ndf.format(rs.getDate("regdate")), rs.getInt("cnt")));
    }
    con.close(rs, pstmt, conn);
%>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="../">HOME</a> &gt; <span>공지사항 목록</span></p>
        </div>
        <section class="page" id="page1">
            <div class="table_container">
                <table class="board_tb" id="myTable">
                    <thead>
                    <tr>
                        <th class="item1">글번호</th>
                        <th class="item2">글제목</th>
                        <th class="item3">작성자</th>
                        <th class="item4">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for(Board bd: boards){
                        bd.print();
                    %>
                    <tr>
                        <td class="item1"><%=bd.getBno() %></td>
                        <td class="item2"><a href="/board/getBoard.jsp?bno=<%=bd.getBno()%>"><%=bd.getTitle() %></a></td>
                        <td class="item3"><%=bd.getAuthor() %></td>
                        <td class="item4"><%=bd.getRegdate() %> </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable();
                    });
                </script>
            <div class="board_tb">
                <%if(sid!=null && sid.equals("admin")){%>
                    <a href="addBoard.jsp" class="inbtn">글쓰기</a>
                <%}%>
            </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>