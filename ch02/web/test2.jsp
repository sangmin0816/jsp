<%@ page import="dto.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.HashSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
    %>
</head>
<body>
<div class="container">
    <h2>여기는 항구입니다.</h2>
    <hr>
    <%
        String send = request.getParameter("send");
        // 보내는 곳에서 담는 부분
        Student st1 = new Student();
        st1.setNo(1);
        st1.setName("김일일");
        ArrayList<Student> st = new ArrayList<>();
        for(int i=1; i<=5; i++){
            st.add(new Student(i, "김00"+i, (int)(Math.random()*100), (int)(Math.random()*100), (int)(Math.random()*100)));
        }
        request.setAttribute("studentarr", st); // 컨테이너에 포장

        HashSet<String> shipment = new HashSet<>();
        for(int i=1; i<=5; i++){
            shipment.add("짐"+i);
        }
        request.setAttribute("shipment", shipment);

        HashMap<String, Integer> ticket = new HashMap<>();
        for(int i=1; i<=5; i++){
            ticket.put(i+"명", i*10000-(i-1)*1000);
        }
        request.setAttribute("ticket", ticket);

        out.println("<h3> 선장은 "+st1.getName()+"</h3>");
        out.println("<p>학생 명단은 다음과 같습니다.</p>");
        for(Student s: st){
            out.println("<p>"+s.getName()+"</p>");
        }
    %>
    <%
        if(send!=null && send.equals("true")){
            RequestDispatcher rd = request.getRequestDispatcher("test3.jsp"); // 보내질 곳 지정
            rd.forward(request, response); // request와 response를 실어서 보내질 곳으로 보냄
        }
    %>
    <a href="test2.jsp?send=true">SEND</a>
</div>
</body>
</html>