<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QnA 게시판</title>
    <%@ include file="../head.jsp" %>
</head>

<%
    int qno = Integer.parseInt(request.getParameter("qno"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "SELECT * FROM qnalist WHERE qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, qno);
    rs = pstmt.executeQuery();

    Qna ql = new Qna();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");

    if(rs.next()){
        ql = new Qna(rs.getInt("qno"), rs.getString("title"), rs.getString("content"), rs.getString("author"), rs.getString("name"), sdf.format(rs.getDate("resdate")), rs.getInt("cnt"), rs.getInt("lev"), rs.getInt("par"));
    }
%>

<body>

<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>

    <%
        if(sid==null){
            response.sendRedirect("/qna/qnaList.jsp");
        }
    %>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="../">HOME</a> &gt; <span>QnA</span></p>
        </div>
        <section class="page" id="page1">
            <div class="table_container">
                <table class="board_tb" id="myTable">
                    <thead>
                    <tr>
                        <th class="hidden">par</th>
                        <th class="hidden">level</th>
                        <th class="hidden">qno</th>
                        <th class="item2">글제목</th>
                        <th class="item3">작성자</th>
                        <th class="item4">작성일</th>
                        <th class="item5">조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="hidden"><%=ql.getPar()%></td>
                        <td class="hidden"><%=ql.getLev()%></td>
                        <td class="hidden"><%=ql.getQno()%></td>
                        <td class="item2"><%=ql.getTitle() %></td>
                        <td class="item3"><%=ql.getAuthor() %></td>
                        <td class="item4"><%=ql.getResdate() %> </td>
                        <td class="item5"><%=ql.getCnt() %> </td>
                    </tr>
                    </tbody>
                </table>
                <div class="paragraph">
                    <%=ql.getContent()%>
                </div>

                <table class="row_table">
                    <tbody>
                    <tr>
                        <td><a href="/qna/qnaList.jsp" class="inbtn">글목록</a></td>
                        <%if(sid!=null){
                            if(ql.getAuthor().equals(sid)||sid.equals("admin")){%>
                                <td><a href="/qna/updateQna.jsp?qno=<%=ql.getQno()%>" class="inbtn">글수정</a></td>
                                <td><div class="inbtn" onclick="isDelete()">글삭제</div></td>
                            <%}%>
                            <%if(ql.getLev()==0){%>
                                <td><a href="/qna/addA.jsp?par=<%=ql.getPar()%>" class="inbtn">답변 작성</a></td>
                            <%}%>
                        <%}%>
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

<script>
    function isDelete(){
        let isdelete = confirm("정말 삭제하시겠습니까?");
        if(isdelete){
            location.href = "/qna/deleteQnaPro.jsp?qno=<%=ql.getQno()%>&lev=<%=ql.getLev()%>";
        }
    }
</script>