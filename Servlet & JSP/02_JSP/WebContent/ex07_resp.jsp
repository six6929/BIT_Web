<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	
	int tot = kor + eng + math;
	double avg = (tot * 100) / 3 / 100.0; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리결과</title>
</head>
<body>
	<h1>성적처리 결과</h1>
	<%--
	이름 : 홍길동
	총점 : 271
	평균 : 90.33
	평가(A~F) : A
	--%>
	<ul>
		<li>이름 : <%=name %></li>
		<li>총점 : <%=tot %></li>
		<li>평균 : <%=avg %></li>
		<li>평가(A~F) : 
		<%
		if(avg >= 90) {
			out.write("A");
		} else if(avg >= 80) {
			out.write("B");
		} else if (avg >=70) {
			out.write("C");
		} else if(avg >=60) {
			out.write("D");
		} else {
			out.write("F");
		}
		%>
		</li>
	</ul>
</body>
</html>