<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");

    String sid = (String)session.getAttribute("id");
    String title = request.getParameter("title");
    String new_content = request.getParameter("new_content");
    int par = Integer.parseInt(request.getParameter("par"));
    int lev = Integer.parseInt(request.getParameter("lev"));

    if(title==null || title.equals("")){
        System.out.println("타이틀이 그러면 안 돼지");
        out.println("<script>history.back();</script>");
    }
    else {
        System.out.println(sid + " " + title + "\n" + new_content);
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DBC con = new MariaDBCon();
        conn = con.connect();

        String sql = "";
        int cnt = 0;
        if(lev==1){
            sql = "insert into qna(title, content, author, lev, par) values(?, ?, ?, 1, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, new_content);
            pstmt.setString(3, sid);
            pstmt.setInt(4, par);
            cnt+= pstmt.executeUpdate();
        } else{
            sql = "insert into qna(title, content, author, lev, par) values(?, ?, ?, 0, 0)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, new_content);
            pstmt.setString(3, sid);
            cnt+=pstmt.executeUpdate();

            sql = "UPDATE qna SET par=qno WHERE lev=0 and par=0;";
            pstmt = conn.prepareStatement(sql);
            cnt+=pstmt.executeUpdate();
        }

        if (cnt > 1) {
            System.out.println("질문 글 작성이 완료되었습니다.");
            response.sendRedirect("qnaList.jsp");
        } else if (cnt > 0) {
            System.out.println("답변글 작성이 완료되었습니다.");
            response.sendRedirect("qnaList.jsp");
        } else {
            out.println("<script>history.back();</script>");
            System.out.println("sql 구문이 처리되지 않았습니다.");
        }
        con.close(rs, pstmt, conn);
    }
%>