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
    <title>FAQ</title>
    <%@ include file="../head.jsp" %>
</head>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "SELECT * from faq ORDER BY cnt desc";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Faq> faqList = new ArrayList<>();

    while(rs.next()){
        faqList.add(new Faq(rs.getInt("fno"), rs.getString("question"), rs.getString("answer"), rs.getInt("cnt")));
    }
%>

<body>

<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="banner">
            <div class="breadcrumb">
                <p><a href="../">HOME</a> &gt; <span>FAQ</span></p>
            </div>
            <h2 class="page_tit">FAQ</h2>
        </div>
        <div class="my_page">
            <ul class="faq">
                <%
                    for(Faq fq: faqList){
                        fq.print();
                %>
                <li>
                    <div class="question">Q. <%=fq.getQuestion()%></div>
                    <hr style="margin: 10px auto;">
                    <div class="answer">
                        <table class="row_table">
                            <tbody>
                            <tr>
                                <td>A. <%=fq.getAnswer()%></td>
                            </tr>
                            <%if(sid!=null && sid.equals("admin")){%>
                            <tr>
                                <td><a href="updateFaq.jsp?fno=<%=fq.getFno()%>" class="inbtn">글 수정</a></td>
                                <td><a href="deleteFaq.jsp?fno=<%=fq.getFno()%>" class="inbtn">글 삭제</a></td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>

                    </div>
                </li>
                <%}%>
            </ul>
            <script>
                $(document).ready(function(){
                    $(".faq li").click(function(){
                        $(this).find(".answer").slideToggle(400);
                    });
                });
            </script>
            <%if(sid!=null && sid.equals("admin")){%>
            <a href="addFaq.jsp" class="inbtn">글쓰기</a>
            <%}%>
        </div>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>