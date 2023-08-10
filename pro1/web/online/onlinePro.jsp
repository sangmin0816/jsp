<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%@ page import="com.chunjae.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온라인 상담</title>
    <%@ include file="../head.jsp" %>

</head>

<%
    String name = request.getParameter("name");
    String from = request.getParameter("author");
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");
    String title = request.getParameter("new_title");
    String content = request.getParameter("new_content");

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
      response.sendRedirect("../index.jsp");
    }

%>
<body>
</body>
</html>