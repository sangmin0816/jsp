<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>
<%
    String id = (String) session.getAttribute("id");
    Member me = new Member();

    String pw= request.getParameter("pw");
    if(pw==""){
        System.out.println("pw 변경 안 함");
        pw = request.getParameter("old_pw");
    }
    String email= request.getParameter("email");
    String tel= request.getParameter("tel");

    Connection conn = null;
    PreparedStatement pstmt = null;
    Statement stmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }
    try {
        String sql = "update member set pw=?, email=?, tel=? where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, pw);
        pstmt.setString(2, email);
        pstmt.setString(3, tel);
        pstmt.setString(4, id);
        int cnt = pstmt.executeUpdate();
        if(cnt>0){
            response.sendRedirect("/member/mypage.jsp");
        }
    } catch(SQLException e) {
        System.out.println("Redirect 실패");
        response.sendRedirect("/member/modify.jsp");
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }
%>