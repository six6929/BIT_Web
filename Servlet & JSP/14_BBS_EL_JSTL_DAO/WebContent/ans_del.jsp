<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 사용해서 암호확인 후 삭제 요청 --%>
<%
	request.setCharacterEncoding("UTF-8");

	String c_idx = request.getParameter("c_idx");
	String pwd = request.getParameter("pwd");
	String b_idx = request.getParameter("b_idx");
	
	//EL 사용을 위해 속성 설정
	pageContext.setAttribute("c_idx", c_idx);
	pageContext.setAttribute("pwd", pwd);
	pageContext.setAttribute("b_idx", b_idx);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호확인</title>
<script>
	function ans_del(frm) {
		var pwd1 = frm.pwd.value;
		var pwd2 = "${pwd}";
		if (pwd1 != pwd2) {
			alert("비밀번호가 일치하지 않습니다.");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		var isDelete = confirm("정말 삭제하시겠습니까?");
		if (isDelete) {
			frm.submit();
		} else {
			history.back();
		}
	}
</script>
</head>
<body>

<form action="ans_del_ok.jsp" method="post">
	비밀번호 : <input type="password" name="pwd">
	<input type="button" value="삭제"
			onclick="ans_del(this.form)">
	<input type="hidden" name="c_idx" value="${c_idx }">
	<input type="hidden" name="b_idx" value="${b_idx }">						
</form>

</body>
</html>






