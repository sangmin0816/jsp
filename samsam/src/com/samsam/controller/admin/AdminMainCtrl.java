package com.samsam.controller.admin;


import com.samsam.dto.Product;
import com.samsam.dto.Profit;
import com.samsam.model.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminMain.do")
public class AdminMainCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        if(sid!=null && sid.equals("admin")) {
            ProductDAO dao = new ProductDAO();
            List<Profit> profitList = dao.getProfitList();

            request.setAttribute("profitList", profitList);

            RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/adminMain.jsp");
            view.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath()+"/");
        }
    }
}
