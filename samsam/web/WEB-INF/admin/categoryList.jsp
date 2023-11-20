<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교재 목록</title>
    <%@ include file="../../common.jsp"%>
    <c:set var="path" value="<%=request.getContextPath() %>" />
</head>
<body>
<%@ include file="../../header.jsp"%>

<div class="content">
    <div style="display: flex; min-height: 80vh;">
        <%@include file="adminBoardList.jsp"%>
        <div class="container" style="margin-top: 20px;">
            <h2 class="title">카테고리 목록</h2>
            <div class="container">
                <div class="box_wrap">
                    <form method="post">
                        <table class="table table-borderd" id="tb1">
                            <thead>
                            <tr>
                                <th></th>
                                <th class="item3">카테고리명</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cate" items="${cateList }" varStatus="status">
                                <tr>
                                    <td class="item1"><input type="checkbox" class="isDelete" name="categoryNo" value="${cate.categoryNo }"></td>
                                    <td class="item3"><span title="${cate.categoryName}">${cate.categoryName }</span></td>
                                    <td><a class="btn btn-primary" href="${rootPath }/CategoryUpdate.do?categoryNo=${cate.categoryNo}" role="button">수정하기</a></td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td><input type="hidden" id="categoryNo" name="newcategoryNo" class="form-control"></td>
                                <td><input type="text" id="categoryName" name="newcategoryName" class="form-control"></td>
                                <td><input class="btn btn-primary" type="submit" value="추가하기" onclick="addButton()"></td>
                            </tr>
                            <c:if test="${empty cateList}">
                                <tr>
                                    <td colspan="3">카테고리가 존재하지 않습니다.</td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                        <c:if test="${!empty cateList}">
                            <input type="submit" value="선택삭제" class="btn btn-danger" onclick="deleteButton()">
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../../footer.jsp" %>
</body>
</html>

<script>
    $(document).ready(function(){
        if($("tbody tr").length==0){
            $("tbody").append("<tr><td colspan='3' class='text-center'>해당 목록이 존재하지 않습니다.</td></tr>")
        }
    })
</script>

<script>
    function addButton(){
        $("form").attr("action", "${rootPath}/CategoryAddPro.do");
    }
    function deleteButton(){
        if(deleteTrue()){
            $("form").attr("action", "${rootPath}/Deletecate.do");
        } else{
            return false;
        }
    }

    function deleteTrue(){
        var isdelete = confirm("정말 삭제하시겠습니까?");

        if(isdelete==true){
            var len = $(".isDelete:checked").length;
            console.log(len);
            if(len>0){
                return true;
            } else{
                alert("삭제할 상품이 없습니다.");
                return false;
            }
        } else {
            return false;
        }
    }
</script>