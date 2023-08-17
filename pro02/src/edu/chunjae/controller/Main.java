package edu.chunjae.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class Main extends HttpServlet {
  @Override
  // 메인은 무조건 service
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String user = "천재";
    ServletContext application = request.getServletContext(); // 현재 이 자리를 root임을 application 객체로 만들어준다.
    String realPath = request.getSession().getServletContext().getRealPath("/"); // 현재 main 서블릿이 있는 곳을 root로 잡는다.
    application.setAttribute("realPath", realPath); // 앞으로 request.ContextPath가 아니라 ${realPath}로 사용 가능
    request.setAttribute("user", user);
    RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");
    // 인덱스가 바깥에 있음. url 타고 못 들어오게 만듦
    // index.jsp를 WEB-INF 파일에 넣어 url을 타고 못 들어오게 만듦. 무조건 서블릿을 통해 들어올 수 있게 한다. 보안.
    view.forward(request, response);
  }
}