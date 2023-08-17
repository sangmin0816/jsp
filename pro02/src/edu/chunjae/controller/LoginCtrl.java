package edu.chunjae.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Login.do")
public class LoginCtrl extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("msg", "로그인 하시길 바랍니다.");
    RequestDispatcher view = request.getRequestDispatcher("/custom/login.jsp");
    // 인덱스가 바깥에 있음. url 타고 못 들어오게 만듦
    // index.jsp를 WEB-INF 파일에 넣어 url을 타고 못 들어오게 만듦. 무조건 서블릿을 통해 들어올 수 있게 한다. 보안.
    view.forward(request, response);
  }
}