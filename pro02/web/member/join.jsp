<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <%@ include file="../common.jsp" %>
</head>
<body>
<div class="wrap">
<%@ include file="../header.jsp" %>
<div class="contents" id="contents">
    <div class="sub">
        <h2>회원가입</h2>
    </div>
    <div class="breadcrumb">
        <p><a href="">HOME</a> &gt; <span>회원가입</span></p>
    </div>
    <h2 class="page_tit">회원가입</h2>
    <br><br><br>
    <form name="frm1" class="frm" action="${rootPath}/JoinPro.do" method="post" onsubmit="return inform(this)">
        <div class="join">
            <table>
                <colgroup>
                    <col style="width:15%">
                    <col style="width:auto">
                    <col style="width:20%">
                </colgroup>
                <tbody>
                <tr>
                    <th><label for="name">이름<span class="important">*</span></label></th>
                    <td colspan="2"><input type="text" id="name" name="name" required ></td>
                </tr>
                <tr>
                    <th><label for="id">아이디<span class="important">*</span></label></th>
                    <td colspan="2"><input type="button" id="id" name="id" required placeholder="12글자 이내로만 입력가능합니다." onclick="idcheck()">
                        <div id="checkResult" class="check_result"></div></td>
                    <input type="hidden" name="ck_item" id="ck_item" value="no">
                </tr>
                <tr>
                    <th><label for="pw">비밀번호<span class="important">*</span></label></th>
                    <td><input type="password" id="pw" name="pw" required></td>
                    <td class="use_btn" rowspan="2"><button type="button"  class="inBtn1" onclick="pwcheck()">비밀번호 확인</button></td>
                </tr>
                <tr>
                    <th><label for="pwChk">비밀번호 확인<span class="important">*</span></label></th>
                    <td><input type="password" id="pwChk" name="pwChk" required>
                        <button type="button"  class="inBtn inBtn1 center" onclick="togglePasswordVisibility('pw')">입력값 확인</button>
                        <div id="checkResult1" class="check_result"></div></td>
                </tr>
                <tr>
                    <th><label for="email">이메일<span class="important">*</span></label></th>
                    <td colspan="2"><input type="email" id="email" name="email" required></td>
                </tr>
                <tr>
                    <th><label for="tel">전화번호<span class="important">*</span></label></th>
                    <td colspan="2"><input type="tel" id="tel" name="tel" required></td>
                </tr>
                </tbody>
            </table>
            <div class="btn_area" style="text-align:center;">
                <a href="/" class="inBtn inBtn1">취소하기</a>
                <input type="submit" value="제출하기" class="inBtn inBtn2">
            </div>
        </div>
    </form>
    <script>
        function inform(frm){
            var ck_item = frm.ck_item;
            //var ck_item = document.getElementById("ck_item");
            if(ck_item.value!="yes"){
                alert("아이디 중복 검사를 진행하시기 바랍니다.");
                frm.id.focus();
                return false;
                console.log();
            }
            var pw = frm.pw.value;
            var pw2 = frm.pw2.value;
            if(pw!=pw2){
                alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                frm.pw.focus();
                return false;
            }
        }

        function idcheck(){
            var child;
            var id = document.getElementById("id");
            <c:forEach var="idList" items="${memberList}">
                if(id.value==idList){
                    alert("해당 아이디는 이미 사용 중입니다.");
                    return false;
                }
            </c:forEach>
            var checkResult = document.getElementById("checkResult");
            checkResult.innerHTML = "&nbsp;<span style='color: blue;'> 중복확인 완료</span>";
            document.getElementById("id").value = id;
            document.getElementById("ck_item").value = "yes";
        }

        function pwcheck() {
            var pw = document.getElementById("pw");
            var pw2 = document.getElementById("pwChk");
            var checkResult = document.getElementById("checkResult1");

            if (pw.value !== pw2.value) {
                checkResult.innerHTML = "&nbsp;<span style='color: red;'>비밀번호가 서로 다릅니다.</span>";
            } else {
                checkResult.innerHTML = "&nbsp;<span style='color: blue;'>비밀번호가 서로 일치합니다.</span>";
            }
        }
        function togglePasswordVisibility(inputId) {
            var pw= document.getElementById("pw")
            var pw2=document.getElementById("pwChk")

            if(pw.type==="password"){
                pw.type="text";
            }else{
                pw.type="password";
            }
            if(pw2.type==="password"){
                pw2.type="text";
            }else {
                pw2.type="password";
            }
        }
    </script>
<%@ include file="../footer.jsp" %>
</body>
</html>