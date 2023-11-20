package com.samsam.controller.cart;

import com.samsam.dto.Cart;
import com.samsam.model.CartDAO;
import com.samsam.model.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CartAdd.do")
public class CartAddCtrl extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(); // 세션 생성
    String id = (String) session.getAttribute("session_id");
    int amount = Integer.parseInt(request.getParameter("amount"));
    int proNo = Integer.parseInt(request.getParameter("proNo"));

    ProductDAO pdao = new ProductDAO();
    if(id!=null && pdao.getAmount(proNo)>amount){
      CartDAO dao = new CartDAO();
      Cart cart = new Cart();

      int cartNo = dao.isMemberCart(id, proNo);
      int cnt = 0;
      if(cartNo>0){
        System.out.println(cartNo);
        cnt += dao.updateCartAmount(cartNo, amount);
      } else{
        cart.setMemId(id);
        cart.setAmount(amount);
        cart.setProNo(proNo);
        cnt += dao.addCart(cart);
      }

      if(cnt>0){
        String path = request.getContextPath();
        response.sendRedirect(path+"/CartList.do");
      }
    }
    PrintWriter out = response.getWriter();
    out.println("<script>history.go(-1);</script>");
  }
}