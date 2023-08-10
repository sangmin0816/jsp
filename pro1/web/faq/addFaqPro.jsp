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

    String new_question = request.getParameter("new_question");
    String new_answer = request.getParameter("new_answer");

    if(new_question==null || new_question.equals("")){
        System.out.println("타이틀 없음");
        out.println("<script>history.back();</script>");
    }
    else {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DBC con = new MariaDBCon();
        conn = con.connect();

        String sql = sql = "insert into faq(question, answer) values(?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, new_question);
        pstmt.setString(2, new_answer);
        int cnt = pstmt.executeUpdate();

        if (cnt > 0) {
            System.out.println("작성이 완료되었습니다.");
            response.sendRedirect("faqList.jsp");
        } else {
            out.println("<script>history.back();</script>");
            System.out.println("sql 구문이 처리되지 않았습니다.");
        }
        con.close(rs, pstmt, conn);
    }
%>