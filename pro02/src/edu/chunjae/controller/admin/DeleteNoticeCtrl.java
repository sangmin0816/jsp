//package edu.chunjae.controller.admin;
//
//import edu.chunjae.dto.Notice;
//import edu.chunjae.model.NoticeDAO;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet("/AddNotice.do") // 사용자가 보는 이름
//public class DeleteNoticeCtrl extends HttpServlet {
//  @Override
//  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    request.setAttribute("msg", "공지사항을 추가합니다.");
//
//    Notice new_notice = (Notice) request.getAttribute("new_notice");
//
//    NoticeDAO dao = new NoticeDAO();
//    int cnt = dao.addNotice(new_notice);
//    if(cnt>0){
//      System.out.println("성공적으로 추가되었습니다.");
//      response.sendRedirect("/notice/addNotice.jsp");
//    } else{
//      System.out.println("오류로 인해 제대로 처리되지 않았습니다.");
//      response.sendRedirect("/notice/addNotice.jsp");
//    }
//  }
//}