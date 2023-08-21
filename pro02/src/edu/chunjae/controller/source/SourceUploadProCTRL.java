package edu.chunjae.controller.source;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import edu.chunjae.dto.Source;
import edu.chunjae.model.SourceDAO;

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

@WebServlet("/SourceUploadPro.do")
public class SourceUploadProCTRL extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "";
        ServletContext application = request.getServletContext();
        try {
            String saveDirectory = application.getRealPath("/storage"); //실제 저장 경로
            int maxSize = 1024*1024*10;     //10MB
            String encoding = "UTF-8";

            MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
            Source file = new Source();
            file.setUname(mr.getParameter("uname"));
            file.setSubject(mr.getParameter("subject"));
            file.setContent(mr.getParameter("content"));

            Enumeration files = mr.getFileNames();
            String item = (String) files.nextElement();

            String oriFile = mr.getOriginalFileName(item); //실제 첨부된 파일경로와 이름
            String fileName = mr.getFilesystemName(item);  //파일이름만 추출

            File upfile = mr.getFile(item); //실제 업로드
            if(upfile.exists()){
                msg = "파일 업로드 성공";
            } else {
                msg = "파일 업로드 실패";
            }

            file.setFilename(upfile.getName());

            SourceDAO dao = new SourceDAO();
            int cnt = dao.fileUploadTest(file);
            List<Source> fileList = new ArrayList<>();
            if(cnt>0){
              fileList = dao.getFileTestList();
              request.setAttribute("fileList",fileList);
              RequestDispatcher view = request.getRequestDispatcher("/source/uploadList.jsp");
              view.forward(request, response);
            } else {
                response.sendRedirect("/SourceUpload.do");
            }
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
