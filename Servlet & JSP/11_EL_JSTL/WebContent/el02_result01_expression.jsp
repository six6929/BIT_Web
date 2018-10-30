<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--전달받은 form 데이터를 표현식으로 표시 --%>
<%
	
	//한글처리를 위한 encoding 처리(UTF-8)
	request.setCharacterEncoding("utf-8");
	
	//전달받은 파라미터 값 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	
	String[] hobby = request.getParameterValues("hobby"); //checkbox
	String addr = request.getParameter("addr"); //select 하지만 하나만 선택하기 때문
	String[] animal = request.getParameterValues("animal"); //
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식으로 form 데이터 표시</title>
</head>
<body>
	<h2>결과보기(표현식)</h2>
	<div>
		<ul>
			<li>이름 : <%=name %></li>
			<li>나이 : <%=age %></li>
			<li>성별 : <%=gender %></li>
			<li>취미 : 
				<%
				for(String h : hobby) {
				%>
					<%=h %>&nbsp;&nbsp;
				<%					
				}
				%>
			</li>
			<li>거주지 : <%=addr %></li>
			<li>애완동물 : 
				<%
				for (String a : animal) {
					out.print(a + " ");
				}
				%>
			</li>
		</ul>
	</div>
</body>
</html>