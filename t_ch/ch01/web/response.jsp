<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>response 페이지</title>
<%
    //page, out < request(요청), response(반응) < session < application
    //request : 요청 정보가 전달되는 객체
    // -> 요청한 정보가 해당 페이지를 벗어나면 소멸됨.
    //response : 결과를 돌려줄 페이지에 전달할 정보가 객체
    // -> 요청한 페이지로 결과를 전달후에 소멸됨.
    //session : 로그인을 하고, 로그아웃 전까지 정보가 저장되는 객체
    // -> 로그아웃시에 소멸됨
    //application : 애플리케이션 정보가 담기는 객체로 브라우저가 닫히거나
    // 웹 애플리케이션이 종료되면, 자동으로 소멸된다.
    //모든 웹의 객체는 attribute가 값을 저장할 수 있으며,(setAttribute)
    //저장된 값을 가져올 수 있음(getAttribute)
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=UTF-8");

    application.setAttribute("appname", "천재교육");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    String[] idArr = {"admin","kim","lee"};
    String[] pwArr = {"1234","4321","1111"};
%>
</head>
<body>
    <h2>페이지 출력</h2>
<div id="msg">
<%
        String msg = "로그인 실패";
        for(int i=0;i<idArr.length;i++){
            if(idArr[i].equals(id) && pwArr[i].equals(pw)){
                session.setAttribute("id", id);
                session.setAttribute("pw", pw);
                //session.invalidate(); //로그아웃
                //session.removeAttribute("id");
                //session.removeAttribute("pw");
                msg = "로그인 성공";
            }
        }
        //response.sendRedirect("test05.jsp?msg="+msg);
        response.addHeader("Site", "http://chunjae.co.kr");
        response.setHeader("Url2", "https://github.com/kktlove");
        response.setStatus(200); //성공 처리
        //response.setStatus(404); //실패 처리
        //response.sendError(404, "요청하신 페이지가 존재하지 않습니다.");
%>
    <p><a href='test05.jsp?msg=<%=msg%>'><%=msg%> 페이지 이동</a></p>
    <p> 콘텐츠 유형 : <%=response.getContentType() %>
    <p> 문자 인코딩 : <%=response.getCharacterEncoding() %>
    <p> 추가된 헤더 : <%=response.getHeader("Site") %>
    <p> 설정된 헤더 : <%=response.getHeader("Url2") %>
    <p> 추가된 헤더 존재 유무 확인 : <%=response.containsHeader("Site") %></p>
    <p> 설정된 헤더 존재 유무 확인 : <%=response.containsHeader("Url2") %></p>
    <p> 저장된 상태코드 : <%=response.getStatus() %></p>
    <p> 저장된 세션정보 아이디: <%=session.getAttribute("id") %></p>
    <p> 저장된 세션정보 비밀번호: <%=session.getAttribute("pw") %></p>
</div>
</body>
</html>