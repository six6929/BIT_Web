<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP id, pw</title>
<script>
	function send_go(frm) {
		//alert("전달받은 객체 : " + frm);
		frm.action = "ex04_resp.jsp";
		frm.submit();
	}
</script>
</head>
<body>
	<!-- JSP 요청 페이지 JSP 응답 페이지로 이동 -->
	<h1>(요청)ID,PW값 서버측에 전달</h1>
	<form>
		<p> ID : <input type="text" name="id"></p>
		<p> PW : <input type="password" name="pw"></p>
		<input type="button" value="전송(다른페이지로 이동)" onclick="send_go(this.form)">
	</form>
</body>
</html>