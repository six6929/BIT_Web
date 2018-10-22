<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 여부 확인</title>
<script>
	var isOk = confirm("[로그인실패] 아이디, 패스워드를 다시 입력하세요.");
	if (isOk) {
		location.href="ex02_login.jsp";
	} else {
		location.href="ex02_login.jsp";
	}
	
</script>
</head>
<body>

</body>
</html>