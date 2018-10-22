<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script>
	function log_in(frm) {
		frm.action = "ex02_loginProc.jsp";
		frm.submit();
	}
</script>
</head>
<body>
<%
	//로그인 성공 여부 확인
	System.out.println("login_chk : " + session.getAttribute("login_chk"));
	if(session.getAttribute("login_chk") != null) {
		if(session.getAttribute("login_chk").equals("ok")) {
			//로그인 성공인 경우
			String id = (String)session.getAttribute("id");
			out.print("<h2>로그인 성공 " + id + "님 환영합니다.</h2>");
		} else {
			//로그인 실패인 경우
			session.invalidate(); // 로그인 초기화
			response.sendRedirect("ex02_loginMessage.jsp");
		}
	} else {
		
	}
%>
	<form>
		<p>아이디 : <input type="text" name="id"></p>
		<p>암  호 : <input type="password" name="pwd"></p>
		<input type="button" value="로그인" onclick="log_in(this.form)">
	</form>
</body>
</html>