package edu.chunjae.controller.admin;


import edu.chunjae.dto.Product;
import edu.chunjae.model.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/BookListAdmin.do")
public class BookListAdminCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "교재 목록을 출력합니다.");

        ProductDAO dao = new ProductDAO();
        List<Product> bookList = dao.getProductList(1);

        request.setAttribute("bookList", bookList);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/bookList.jsp");
        view.forward(request, response);
    }
}
