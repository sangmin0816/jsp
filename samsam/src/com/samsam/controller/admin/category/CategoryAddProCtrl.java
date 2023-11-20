package com.samsam.controller.admin.category;

import com.samsam.dto.Category;
import com.samsam.model.CategoryDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/CategoryAddPro.do")

public class CategoryAddProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        request.setCharacterEncoding("UTF-8");
        String cname = request.getParameter("newcategoryName");

        if(sid != null && sid.equals("admin")) {
            Category cate = new Category();
            cate.setCategoryName(cname);
            CategoryDAO dao = new CategoryDAO();
            int cnt = dao.addCategory(cate);
            if (cnt > 0) {
                response.sendRedirect(request.getContextPath() + "/CategoryList.do");
            } else {
                response.sendRedirect(request.getContextPath() + "/WEB-INF/admin/adminMain.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath()+"/");
        }
    }
}
