package edu.chunjae.controller.notice;

import edu.chunjae.dto.Notice;
import edu.chunjae.model.NoticeDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/Notice.do") // 사용자가 보는 이름
public class NoticeCtrl extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("msg", "공지사항 상세페이지를 출력합니다.");
    int no = Integer.parseInt(request.getParameter("no"));

    NoticeDAO dao = new NoticeDAO();
    Notice notice = dao.getNotice(no);
    request.setAttribute("notice", notice);

    RequestDispatcher view = request.getRequestDispatcher("/notice/getNotice.jsp");
    view.forward(request, response);
  }
}