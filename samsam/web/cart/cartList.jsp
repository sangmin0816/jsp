<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니 목록</title>
    <%@ include file="../common.jsp"%>
</head>

<body>
<%@ include file="../header.jsp"%>
    <div class="content container">
    <div class="d-flex justify-content-between align-items-end">
        <h2>장바구니</h2>
        <ol class="breadcrumb ">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">장바구니</li>
        </ol>
    </div>
    <hr>
    <form method="post" onsubmit="return checkLen()">
        <table class="table table-bordered" id="tb1">
            <thead class="thead-light">
            <tr>
                <th></th>
                <th>번호</th>
                <th>상품 이름</th>
                <th>표지 사진</th>
                <th>상품 가격</th>
                <th>개수</th>
                <th>총계</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cartVO" items="${cartVOList}" varStatus="status">
                <tr>
                    <td><input class="cartCheck" type="checkbox" name="cartCheck" value="${cartVO.cart.cartNo}"></td>
                    <td>${status.count}</td>
                    <td><a href="${rootPath}/BookGet.do?proNo=${cartVO.product.proNo}">${cartVO.product.title}</a></td>
                    <td><img src="${rootPath}/storage/${cartVO.product.img}" style="max-width: 50px; max-height: 50px;" alt="대표 이미지"></td>
                    <td>${cartVO.product.price}</td>
                    <td>${cartVO.cart.amount}</td>
                    <td>${cartVO.product.price*cartVO.cart.amount}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <input type="submit" class="btn btn-primary" value="결제" onclick="return payButton()" >
        <input type="submit" class="btn btn-danger" value="삭제" onclick="return deleteButton()">
    </form>
</div>
<%@ include file="../footer.jsp" %>

</body>
</html>

<script>
    function checkLen(){
        var len = $(".cartCheck:checked").length;
        if(len>0){
            return true;
        } else{
            alert("선택된 항목이 없습니다.");
            return false;
        }
    }
    function deleteButton(){
        $("form").attr("action", "${rootPath}/CartDelete.do");

    }
    function payButton(){
        $("form").attr("action", "${rootPath}/PayCart.do");
    }
</script>


<script>
    $(document).ready(function(){
        if($("tbody tr").length==0){
            $("tbody").append("<tr><td colspan='7' class='text-center'>해당 목록이 존재하지 않습니다.</td></tr>")
        }
    })
</script>