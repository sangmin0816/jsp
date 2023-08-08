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
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "SELECT a.*, b.name FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Qna> qnaList = new ArrayList<>();
    SimpleDateFormat ndf = new SimpleDateFormat("yyyy년 MM월 dd일");

    while(rs.next()){
        qnaList.add(new Qna(rs.getInt("qno"), rs.getString("title"), rs.getString("content"), rs.getString("author"), rs.getString("name"), ndf.format(rs.getDate("resdate")), rs.getInt("cnt"), rs.getInt("lev"), rs.getInt("par")));
    }
%>

<body>

<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
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
                        <th class="item1">글번호</th>
                        <th class="item2">글제목</th>
                        <th class="item3">작성자</th>
                        <th class="item4">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int qnaindex = 0;
                        for(Qna ql: qnaList){
                          qnaindex++;
                            ql.print();
                    %>
                    <tr>
                        <td class="hidden"><%=ql.getPar()%></td>
                        <td class="hidden"><%=ql.getLev()%></td>
                        <td class="hidden"><%=ql.getQno()%></td>
                        <td class="item2"><%=qnaindex%></td>
                        <%
                            if(ql.getLev()>0){
                        %>
                        <td class="item2 title"><a style="padding-left: 2em;" href="/qna/getQna.jsp?qno=<%=ql.getQno()%>">&#9492; [답변] <%=ql.getTitle() %></a></td>
                        <%
                            } else{ %>
                        <td class="item2 title"><a href="/qna/getQna.jsp?qno=<%=ql.getQno()%>"><%=ql.getTitle() %></a></td>
                        <%
                            }
                        %>
                        <td class="item3"><%=ql.getAuthor() %></td>
                        <td class="item4"><%=ql.getResdate() %> </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable({
                            order: [[0, "desc"],[1, "asc"],[2, "asc"]]
                        });
                    });
                </script>
                <div class="board_tb">
                    <%if(sid!=null){%>
                    <a href="addQ.jsp" class="inbtn">글쓰기</a>
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