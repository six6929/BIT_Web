<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리를 위한 문자처리방식 지정(특히 post방식 필수)
	request.setCharacterEncoding("UTF-8");
	//파라미터값 추출
	String name = request.getParameter("name");
	session.setAttribute("name", name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물건구입</title>
<script>
	function add_list(frm) {
		frm.action = "ex03_addList.jsp";
		frm.submit();
	}
</script>
</head>
<body>
	<h2>상품선택</h2>
	<hr>
	[<%=session.getAttribute("name") %>]님이 로그인 한 상태입니다
	<hr>
	<form>
		<select name="product">
			<option>::선택하세요::</option>
			<option value="수박">수박</option>
			<option value="사과">사과</option>
			<option value="딸기">딸기</option>
			<option value="참외">참외</option>
			<option value="망고">망고</option>
		</select>
		<input type="button" value="추가" onclick="add_list(this.form)">
	</form>
	<p><a href="ex03_list_calc.jsp">계산하기</a></p>
	<p><a href="ex03_Logout.jsp">로그아웃</a></p>
</body>
</html>