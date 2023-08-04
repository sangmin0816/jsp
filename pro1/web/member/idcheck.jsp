<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<form id="lo" onsubmit="return idCheck(this)">
    <input type="text" name="id" id="id" placeholder="아이디 입력" autofocus><br><br>
    <input type="submit" value="아이디 중복 확인"><br><br>
</form>
</body>
