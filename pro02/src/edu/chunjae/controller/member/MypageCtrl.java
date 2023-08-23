package edu.chunjae.controller.member;

import edu.chunjae.dto.Member;
import edu.chunjae.model.MemberDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Mypage.do")
public class MypageCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "나의 정보로 이동합니다.");

        HttpSession session = request.getSession(); // 세션 생성
        MemberDAO dao = new MemberDAO();
        Member member = dao.getMember((String) session.getAttribute("session_id"));

        request.setAttribute("me", member);
        RequestDispatcher view = request.getRequestDispatcher("/member/mypage.jsp");
        view.forward(request, response);
    }
}