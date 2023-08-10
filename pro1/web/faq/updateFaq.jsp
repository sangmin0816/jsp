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
    int fno = Integer.parseInt(request.getParameter("fno"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "SELECT * FROM faq WHERE fno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, fno);
    rs = pstmt.executeQuery();

    Faq fq = new Faq();

    if(rs.next()){
      fq = new Faq(rs.getInt("fno"), rs.getString("question"), rs.getString("answer"), rs.getInt("cnt"));
    }
%>

<body>

<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>

    <%
        if(sid==null || !sid.equals("admin")){
            response.sendRedirect("/faq/faqList.jsp");
        }
    %>
    <div class="contents" id="contents">
        <div class="banner">
            <div class="breadcrumb">
                <p><a href="../">HOME</a> &gt; <span>FAQ</span></p>
            </div>
            <h2 class="page_tit">FAQ</h2>
        </div>
        <section class="my_page">
            <div class="table_container">
                <form action="updateFaqPro.jsp" id="update_form" method="post">
                    <table class="board_tb" id="myTable">
                        <thead>
                        <tr>
                            <th class="item2">질문</th>
                            <th class="item3">답변</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <input type="hidden" name="fno" id="fno" value="<%=fq.getFno()%>">
                            <td class="item1">
                                <textarea name="new_question" id="new_question"><%=fq.getQuestion()%></textarea>
                            </td>
                            <td class="item2">
                                <textarea name="new_answer" id="new_answer"><%=fq.getAnswer()%></textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="submit" value="작성완료" class="inbtn">
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>