<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String name = (String) pageContext.getAttribute("name");
    String age = (String) pageContext.getAttribute("age");
%>

<div class="infile">
    <h1>IncludeFile</h1>
    <div class="dataArea">
        <p>Name: <%=name %></p>
        <p>Age: <%=age %></p>
    </div>
</div>