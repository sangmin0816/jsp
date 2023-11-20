package com.samsam.controller.admin.category;

import com.samsam.model.CategoryDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Deletecate.do")
public class CategoryDeleteCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        String[] cateno = request.getParameterValues("categoryNo");

        if(sid != null && sid.equals("admin")) {
            CategoryDAO dao = new CategoryDAO();
            int cnt = 0;
            for (String cno : cateno) {
                cnt = cnt + dao.deleteCategory(Integer.parseInt(cno));
            }

            PrintWriter out = response.getWriter();

            if (cnt > 0) {
                String path = request.getContextPath();
                response.sendRedirect(path + "/CategoryList.do");
            } else {
                out.println("<script>history.go(-1);</script>");
            }
        } else {
            response.sendRedirect(request.getContextPath()+"/");
        }
    }
}
