package edu.chunjae.controller.member;

import edu.chunjae.model.MemberDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Join.do")
public class JoinCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        MemberDAO dao = new MemberDAO();
        List<String> memberList = new ArrayList<>();
        memberList = dao.getMemberIdList();

        request.setAttribute("memberList", memberList);

        request.setAttribute("msg", "회원가입 창으로 이동합니다.");
        RequestDispatcher view = request.getRequestDispatcher("/member/join.jsp");

    }
}