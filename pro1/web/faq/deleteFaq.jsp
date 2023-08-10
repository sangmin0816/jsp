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
    int fno = Integer.parseInt(request.getParameter("fno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "delete from faq where fno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, fno);
    int cnt = pstmt.executeUpdate();

    if (cnt > 0) {
        System.out.println("글 삭제가 완료되었습니다.");
        response.sendRedirect("faqList.jsp");
    } else {
        out.println("<script>history.back();</script>");
        System.out.println("sql 구문이 처리되지 않았습니다.");
    }
    con.close(rs, pstmt, conn);
%>