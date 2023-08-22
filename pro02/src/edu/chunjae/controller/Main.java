package edu.chunjae.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class Main extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext application = request.getServletContext();
        application.setAttribute("rootPath", request.getContextPath());

        RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
        view.forward(request, response);
    }
}
