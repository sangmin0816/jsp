package edu.chunjae.controller.admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BookAdd.do")
public class BookAddCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "파일을 업로드 합니다.";

        request.setAttribute("msg", msg);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/bookAdd.jsp");
        view.forward(request, response);
    }
}
