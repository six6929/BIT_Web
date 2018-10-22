<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.전달받은 파라미터 값 추출
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	
	//계산처리
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
	<!--
	//응답 형식
	/*
	 성적처리 결과
	 이름 : 홍길동 -> <p> 이름 : name </p>
	 국어 : 100
	 영어 : 90
	 수학 : 80
	 ---------
	 총점 : 270
	 평균 : 90.0
	 */
	-->
	<h2>학생성적 처리결과</h2>
	<p>이름 : <%=name %></p>
	<p>국어 : <%=kor %></p>
	<p>영어 : <%=eng %></p>
	<p>수학 : <%=math %></p>
	<p>---------------</p>
	<p>총점 : <%=tot %></p>
	<p>평균 : <%=avg %></p>
	<hr>
	<!-- 테이블 형식 -->
	
	<table border="1">
		<tr>
			<th>항목</th>
			<th>데이터</th>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name %></td>
		</tr>
		<tr> 
			<td>국어</td>
			<td><%=kor %></td>
		</tr>
		<tr> 
			<td>영어</td>
			<td><%=eng %></td>
		</tr>
		<tr> 
			<td>수학</td>
			<td><%=math %></td>
		</tr>
		<tr> 
			<td>총점</td>
			<td><%=tot %></td>
		</tr>
		<tr> 
			<td>평균</td>
			<td><%=avg %></td>
		</tr>
	</table>
	
	<hr>
	<hr>
	<!-- 강사님 답 -->
	<table border="1">
		<thead>
			<tr>
				<th>항목</th>
				<th>데이터</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>이름</td>
				<td><%=name %></td> 
			</tr>
			<tr>
				<td>국어</td>
				<td><%=kor %></td> 
			</tr>
			<tr>
				<td>영어</td>
				<td><%=eng %></td> 
			</tr>
			<tr>
				<td>수학</td>
				<td><%=math %></td> 
			</tr>
			<tr>
				<td>총점</td>
				<td><%=tot %></td> 
			</tr>
			<tr>
				<td>평균</td>
				<td><%=avg %></td> 
			</tr>
		</tbody>
	</table>
</body>
</html>