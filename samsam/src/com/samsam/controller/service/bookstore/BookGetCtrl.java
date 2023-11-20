package com.samsam.controller.service.bookstore;

import com.samsam.dto.Category;
import com.samsam.dto.Product;
import com.samsam.dto.Review;
import com.samsam.model.CategoryDAO;
import com.samsam.model.ProductDAO;
import com.samsam.model.ReviewDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/BookGet.do")
public class BookGetCtrl extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ServletContext application = request.getServletContext();
    request.setAttribute("msg", "교재 상세페이지를 출력합니다.");
    int proNo = Integer.parseInt(request.getParameter("proNo"));

    HttpSession session = request.getSession();
    String sid = (String) session.getAttribute("session_id");

    ProductDAO dao = new ProductDAO();
    Product product = dao.getProduct(proNo);
    int inventory = dao.getAmount(proNo);

    File isfile = new File( application.getRealPath("/storage/") + product.getImg());
    if(!isfile.exists()) {
      product.setImg(request.getContextPath() + "/images/noimage.jpg");
    } else {
      product.setImg(request.getContextPath() + "/storage/" + product.getImg());
    }

    File isVideo = new File( application.getRealPath("/storage/") + product.getVideo());
    if(!isVideo.exists()) {
      product.setVideo("");
    } else {
      product.setVideo(request.getContextPath() + "/storage/" + product.getVideo());
    }

    CategoryDAO cdao = new CategoryDAO();
    Category category = cdao.getCategory(product.getCategoryNo());

    ReviewDAO reviewDAO = new ReviewDAO();
    boolean reviewPass = reviewDAO.checkReview(sid, proNo);
    List<Review> reviewList = reviewDAO.getReviewList(proNo);


    request.setAttribute("inventory", inventory);
    request.setAttribute("product", product);
    request.setAttribute("category", category);
    request.setAttribute("sid", sid);
    request.setAttribute("reviewPass", reviewPass);
    request.setAttribute("reviewList", reviewList);

    RequestDispatcher view = request.getRequestDispatcher("/service/bookstore/bookGet.jsp");
    view.forward(request, response);
  }
}