package com.samsam.controller.community;

import com.samsam.util.SMTPAuthenticator;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

@WebServlet("/OnlinePro.do")
public class OnlineProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("session_id");

        if(sid != null) {

            String name = request.getParameter("name");
            String from = request.getParameter("memId");
            String email = request.getParameter("email");
            String tel = request.getParameter("tel");
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            String to = "757816@naver.com";

            Properties p = new Properties();
            p.put("mail.smtp.host", "smtp.naver.com");
            p.put("mail.smtp.port", "587");
            p.put("mail.smtp.starttls.enable","true");
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.debug", "true");
            p.put("mail.smtp.socketFactory.port", "587");
            p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            p.put("mail.smtp.socketFactory.fallback", "false");

            /* Gmail의 경우 아래 내용 추가
            //p.put("mail.smtp.ssl.enable", "false");
            //p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            //p.put("mail.smtp.user", email);
            */

            // 기관 방화벽 때문에 connect false할 수 있다.
            try{
                Authenticator auth = new SMTPAuthenticator();
                Session ses = Session.getInstance(p, auth);
                // 세션에 이미 들어온 경우 무조건 보낼 때는 Session.getDefaultInstance 사용
                // 세션 취득한 이후에만 보낼 수 있도록 하려면 Session.getInstance 사용
                ses.setDebug(true);
                MimeMessage msg = new MimeMessage(ses); // 멀티미디어
                // 메일받는 건 POP
                // 메일 보내는 건 SMTP
                // 멀티미디어는  MIME

                msg.setSubject(title); //  제목 정하기

                StringBuffer buffer = new StringBuffer();   //이메일 내용
                buffer.append("보내는 사람 : ");
                buffer.append(name+"\n");
                buffer.append("연락처 : ");
                buffer.append(tel+"\n");
                buffer.append("이메일 : ");
                buffer.append(email+"\n");
                buffer.append("제목 : ");
                buffer.append(title+"\n");
                buffer.append("내용 : ");
                buffer.append(content+"\n");

                Address fromAddr = new InternetAddress(from);  //보내는 사람
                msg.setFrom(fromAddr);

                Address toAddr = new InternetAddress(to);      // 받는 사람
                msg.addRecipient(Message.RecipientType.TO, toAddr);

                /* 받는 사람이 여려명인 경우
                ArrayList<Address> addrs = new ArrayList<>();
                addrs.add(new InternetAddress(to));
                msg.addRecipients(Message.RecipientType.TO, addrs.toArray());
                */

                msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용
                // 버퍼 없이 메시지 전달할 때는 msg.setText("이메일 내용); 객체가 아니라 텍스트만 전달할 때.
                Transport.send(msg); // 전송

                System.out.println("메일 전송됨");
            } catch(Exception e){
                e.printStackTrace();
                System.out.println("메일 전송 안됨");
                return;
            } finally {
                RequestDispatcher view = request.getRequestDispatcher("/community/online.jsp");
                view.forward(request, response);
            }
        } else {
            PrintWriter out = response.getWriter();

            out.println("<script>alert('로그인 후 이용 바랍니다.');history.go(-1);</script>");
        }
    }
}
