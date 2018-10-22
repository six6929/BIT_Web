<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean member</title>
</head>
<body>
	<h1>데이터 전달</h1>
	<form method="get" name="frm">
		이름 : <input type="text" name="name"><br>
		나이 : <input type="number" name="age"><br>
		비밀번호 : <input type="password" name="pwd"><br>
		<p> 성별 :
			<input type="radio" name="gender" value="남자">
			<input type="radio" name="gender" value="여자">
		</p>
		<p>취미 :
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="음악">음악
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="독서">독서
		</p>
		<p>
			<input type="button" value="파라미터보내기" onclick="send_go()">
		</p>
	</form>
	<script>
		function send_go() {
			document.frm.action = "ex04_useBeanDisp.jsp";
			document.frm.submit();
		}
	</script>
</body>
</html>