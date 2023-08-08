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
    <title>Qna</title>
    <%@ include file="../head.jsp" %>
</head>


<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../header.jsp" %>
    </header>
    <%
        if(sid==null){
            response.sendRedirect("/qna/qnaList.jsp");
        }
        int par = Integer.parseInt(request.getParameter("par"));
    %>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="../">HOME</a> &gt; <span>질문</span></p>
        </div>
        <section class="page" id="page1">
            <form action="addAPro.jsp" id="update_form" method="post">
                <div class="table_container">
                    <table class="board_tb">
                        <thead>
                        <tbody>
                        <tr>
                            <th>답변글 제목</th>
                            <td><input class="indata" type="text" autofocus name="title" id="title" placeholder="글 제목을 입력"></td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="par" id="par" value="<%=par %>">
                    <textarea name="new_content" id="new_content" style="padding: 15px; width:100%; height: 60vh;" placeholder="글 내용 입력"></textarea>
                </div>
                <input type="submit" value="작성완료" class="inbtn">
            </form>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>