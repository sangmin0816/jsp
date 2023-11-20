<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
    <%@ include file="../../common.jsp"%>
    <link href="../../js/chart.js">

</head>

<body>
<%@ include file="../../header.jsp"%>
<div class="content">
    <div style="display: flex; min-height: 80vh;">
        <%@include file="adminBoardList.jsp"%>
        <div class="container" style="margin-top: 20px;">
            <h2 class="title">게시판</h2>
            <div class="chart-div d-flex align-items-center justify-content-center" style="min-height: 60vh;">
                <canvas id="myChart" style="width: 500px; height: 500px;"></canvas>
            </div>
        </div>
        <c:forEach var="profit" items="${profitList}">
            <p>${profit.title}</p>
            <p>${profit.amount}</p>
        </c:forEach>
    </div>
</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    const data = {
        labels: [],
        datasets: []
    };



    <c:forEach var="profit" items="${profitList}">
        data.labels.push(${profit.title});
        data.datasets.push({
            label: ${profit.title},
            data: ${profit.amount},
            backgroundColor: Object.values(Utils.CHART_COLORS),
        })
    </c:forEach>
    console.log(data);

    const myChart = new Chart(
        document.getElementById('myChart'),
        {
            type: 'doughnut',
            data: data,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: false,
                    }
                }
            },
        }
    );


    if($("#myChart").html()===""){
        $(".chart-div").html("<h3>차트가 존재하지 않습니다.</h3>");
    }
</script>