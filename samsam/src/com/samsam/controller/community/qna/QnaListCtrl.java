package com.samsam.controller.community.qna;

import com.samsam.dto.Qna;
import com.samsam.model.QnaDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/QnaList.do")
public class QnaListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "묻고답하기 목록을 출력합니다.");

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        QnaDAO dao = new QnaDAO();
        List<Qna> qnaList = dao.getQnaList();
        request.setAttribute("qnaList", qnaList);
        request.setAttribute("sid", sid);

        RequestDispatcher view = request.getRequestDispatcher("community/qna/qnaList.jsp");
        view.forward(request, response);

    }
}
