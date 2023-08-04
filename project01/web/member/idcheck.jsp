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
<script>
    document.getElementById("id").value = opener.document.getElementById("id").value;
    function idCheck(frm){
        if(frm.id.value==""){
            alert("아이디 입력칸이 비어 있습니다.");
            frm.id.focus();
            return false;
        } else {
            alert("사용 가능한 아이디 입니다.");
            opener.document.getElementById("id").value = document.getElementById("id").value;
            window.close();
        }
    }
    // 왼쪽이 세터, 오른쪽이 게터
</script>
</body>
</html>