package edu.chunjae.controller.admin;

import edu.chunjae.dto.Notice;
import edu.chunjae.model.NoticeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/NoticeAddPro.do") // 사용자가 보는 이름
public class NoticeAddProCtrl extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // addNotice.jsp의 form에서 post method로 보내므로, doPost로 받아야 함
    request.setAttribute("msg", "공지사항을 추가합니다.");
    String path = request.getContextPath();

    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Notice new_notice = new Notice();
    new_notice.setTitle(title);
    new_notice.setContent(content);

    NoticeDAO dao = new NoticeDAO();
    int cnt = dao.addNotice(new_notice);

    if(cnt>0){
      System.out.println("성공적으로 추가되었습니다.");
      response.sendRedirect(path+"/NoticeListAdmin.do");
    } else{
      System.out.println("오류로 인해 제대로 처리되지 않았습니다.");
      PrintWriter out = response.getWriter();
      out.println("<script>history.go(-1);</script>");
    }
  }
}