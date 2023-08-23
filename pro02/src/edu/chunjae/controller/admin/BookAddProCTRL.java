package edu.chunjae.controller.admin;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import edu.chunjae.dto.Product;
import edu.chunjae.model.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

@WebServlet("/BookAddPro.do")
public class BookAddProCTRL extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "";
        ServletContext application = request.getServletContext();

        try {
            String saveDirectory = application.getRealPath("/storage"); //실제 저장 경로
            int maxSize = 1024*1024*10;     //10MB
            String encoding = "UTF-8";

            MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
            Product product= new Product();
            product.setCategory(Integer.parseInt(mr.getParameter("category")));
            product.setTitle(mr.getParameter("title"));
            product.setPrice(Integer.parseInt(mr.getParameter("price")));
            product.setContent(mr.getParameter("content"));

            Enumeration files = mr.getFileNames();
            String item = (String) files.nextElement();

            String oriFile = mr.getOriginalFileName(item); //실제 첨부된 파일경로와 이름
            String fileName = mr.getFilesystemName(item);  //파일이름만 추출

            File upfile = mr.getFile(item); //실제 업로드

            if(upfile.exists()){
                msg = "파일 업로드 성공";
                System.out.println("파일 업로드 성공");
            } else {
                msg = "파일 업로드 실패";
                System.out.println("파일 업로드 실패");
            }
            if(upfile.getName().isEmpty()){
                product.setImgSrc("empty.jpg");
            }
            product.setImgSrc(upfile.getName());
            System.out.println();

            ProductDAO dao = new ProductDAO();
            int cnt = dao.addProduct(product);
            List<Product> productList = new ArrayList<>();


            if(cnt>0){
              productList = dao.getProductList(1);
              request.setAttribute("bookList",productList);
              RequestDispatcher view = request.getRequestDispatcher("/BookListAdmin.do");
              view.forward(request, response);
            } else {
                response.sendRedirect("/BookAdd.do");
            }
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
