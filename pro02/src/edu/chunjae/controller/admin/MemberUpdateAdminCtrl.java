package edu.chunjae.controller.admin;

import edu.chunjae.dto.Member;
import edu.chunjae.model.MemberDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MemberUpdateAdmin.do") // 사용자가 보는 이름
public class MemberUpdateAdminCtrl extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("msg", "회원 수정 페이지를 출력합니다.");
    String id = request.getParameter("id");

    MemberDAO dao = new MemberDAO();
    Member member = dao.getMember(id);

    request.setAttribute("member", member);

    RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/memberUpdate.jsp");
    view.forward(request, response);
  }
}