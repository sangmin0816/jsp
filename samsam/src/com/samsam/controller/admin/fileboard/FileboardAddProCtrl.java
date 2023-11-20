package com.samsam.controller.admin.fileboard;

import com.samsam.dto.Fileboard;
import com.samsam.model.FileboardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;


@WebServlet("/FileboardAddPro.do")
public class FileboardAddProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "";
        ServletContext application = request.getServletContext();

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        if(sid != null && sid.equals("admin")) {
            try {
                String saveDirectory = application.getRealPath("/storage"); //실제 저장 경로
                int maxSize = 1024*1024*10;     //10MB
                String encoding = "UTF-8";

                MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
                Fileboard file = new Fileboard();

                file.setTitle(mr.getParameter("title"));
                file.setContent(mr.getParameter("content"));

                File upfile = null;
                Enumeration files = mr.getFileNames();

                int idx = 1;
                String item;
                String oriFile = "";
                String fileName = "";
                List<String> filesName = new ArrayList<>();
                while(files.hasMoreElements()) {
                    item = (String) files.nextElement();
                    if(mr.getFilesystemName(item)!=null){
                        upfile = mr.getFile(item); //실제 업로드
                        filesName.add(upfile.getName());
                    }
                }

                file.setFiles(filesName.toString());

                FileboardDAO dao = new FileboardDAO();
                int cnt = dao.addFileboard(file);

                if(cnt>0){
                    System.out.println("성공적으로 추가되었습니다.");
                    String path = request.getContextPath();
                    response.sendRedirect(path+"/FileboardListAdmin.do");
                } else {
                    System.out.println("오류로 인해 제대로 처리되지 않았습니다.");
                    response.sendRedirect("/FileboardAdd.do");
                }
            } catch(Exception e){
                System.out.println(e.getMessage());
            }
        } else {
            response.sendRedirect(request.getContextPath()+"/");
        }
    }
}

