package edu.chunjae.controller.member;

import edu.chunjae.model.MemberDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginPro.do")
public class LoginCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        MemberDAO dao = new MemberDAO();
        boolean bool = dao.loginMember(id, pw);

        if(bool){
            System.out.println("정상적으로 로그인되었습니다.");
            HttpSession session = request.getSession(); // 세션 생성
            session.setAttribute("id", id);
            session.setAttribute("pw", pw);
            String path = request.getContextPath();

            response.sendRedirect(path+"/index.jsp");
        } else{
            System.out.println("아이디 또는 비밀번호가 일치하지 않습니다.");
            PrintWriter out = response.getWriter();
            out.println("<script>history.go(-1);</script>");
        }
    }
}
