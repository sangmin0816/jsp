<%@ page import="dto.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.HashMap" %>
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
    <h2>표값</h2>
    <ul class="list-group"></ul>
    <%
        HashMap<String, Integer> ticket = (HashMap<String, Integer>) request.getAttribute("ticket");
        for(String key: ticket.keySet()){
            out.println("<li>"+key+": "+ticket.get(key)+"</li>");
        }
    %>
    <hr>
    <h2>학생 명단 ArrayList</h2>
    <hr>
    <table class="table">
        <thead>
            <tr>
                <th>학번</th>
                <th>이름</th>
                <th>국어 점수</th>
                <th>영어 점수</th>
                <th>수학 점수</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<Student> st_arr = (ArrayList<Student>) request.getAttribute("studentarr");
                for(Student s: st_arr){
                    out.print("<tr>");
                    out.print("<td>"+s.getNo()+"</td>");
                    out.print("<td>"+s.getName()+"</td>");
                    out.print("<td>"+s.getKor()+"</td>");
                    out.print("<td>"+s.getEng()+"</td>");
                    out.print("<td>"+s.getMat()+"</td>");
                    out.print("</tr>");
                }
            %>
        </tbody>
    </table>
    <hr>
    <h3>짐 목록</h3>
    <p>
        <%
            HashSet<String> shipment = (HashSet<String>) request.getAttribute("shipment");
            Iterator iter = shipment.iterator();
            while(iter.hasNext()){
                out.print(iter.next()+" ");
            }
        %>
    </p>
    <hr>
    <a href="test2.jsp">돌아가기</a>
</div>
</body>
</html>