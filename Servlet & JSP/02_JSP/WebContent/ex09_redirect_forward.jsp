<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리다이렉트, 포워딩</title>
</head>
<body>
<%--리다이렉트(redirect), 포워드(forward)
	1. 리다이렉트 : response.sendRedirect("이동위치")
		단순 페이지 전환(새로운 페이지를 다시 요청하도록)
		-> request, response 객체가 새로 생성
		-> 최초 요청된 요청 파라미터 값을 전달 할 수 없음
		-> 요청 URL이 변경됨
		
	2. 포워딩(forward) : 전달(또는 위임)의 개념
		1) RequestDispatcher rd = request.getRequestDispatcher("이동위치")
		   rd.forward(request, response);
		2) request.getRequestDispatcher("이동위치").forward(request,response);
		-> 최초 요청 request, response 객체를 전달 할 수 있음
		-> 최초 요청된 요청 파리미터 값 전달 가능
		-> 요청 URL은 변경 없음
--%>

	<form>
		아이디 : <input type="text" name="id"><br>
		패스워드 : <input type="text" name="pwd"><br>
		<input type="button" value="리다이렉트" onclick="send_redirect(this.form)">
		<input type="button" value="포워딩" onclick="send_forward(this.form)">
		
	</form>
	
	<script>
		function send_redirect(frm) {
			//리다이렉트 방식 처리
			frm.action = "ex09_resp_redirect.jsp";
			frm.submit();
		}
		
		function send_forward(frm) {
			//포워딩 방식으로 처리
			frm.action = "ex09_resp_forward.jsp";
			frm.submit();
		}
	</script>
</body>
</html>















