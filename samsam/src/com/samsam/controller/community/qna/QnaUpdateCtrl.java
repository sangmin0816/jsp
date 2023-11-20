package com.samsam.controller.community.qna;

import com.samsam.dto.Qna;
import com.samsam.model.QnaDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/QnaUpdate.do")
public class QnaUpdateCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "묻고답하기 수정 페이지로 이동합니다.");
        int qno = Integer.parseInt(request.getParameter("no"));

        QnaDAO dao = new QnaDAO();
        Qna qna = dao.getQna(qno);

        request.setAttribute("qna", qna);

        RequestDispatcher view = request.getRequestDispatcher("community/qna/updateQna.jsp");
        view.forward(request, response);
    }
}