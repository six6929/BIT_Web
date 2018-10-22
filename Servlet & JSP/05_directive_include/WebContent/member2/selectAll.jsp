<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결(Connection)
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성
		String sql = "";
		sql += "SELECT IDX, ID, PWD, NAME, AGE, ADDRESS, REG ";
		sql += " FROM MEMBER2 "; 
		sql += " ORDER BY IDX ";

		pstmt = conn.prepareStatement(sql);
		
		//4. SQL문 실행
		rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 데이터 검색</title>
</head>
<body>
	<%--테이블형태로 만든 메뉴 및 입력폼 삽입 --%>
	<%@ include file="start.jsp" %>
	
	<h1>전체 데이터 검색</h1>
	<table border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>나이</th>
			<th>주소</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
	<%
	//5. SQL문 실행결과에 대한 처리
	while(rs.next()) {
	%>
		<tr>
			<td><%=rs.getInt("IDX") %></td>
			<td><%=rs.getString("ID") %></td>
			<td><%=rs.getString("PWD") %></td>
			<td><%=rs.getString("NAME") %></td>
			<td><%=rs.getInt("AGE") %></td>
			<td><%=rs.getString("ADDRESS") %></td>
			<td><%=rs.getDate("REG") %></td>
		</tr>
	<% 
	}
	%>
	
	</tbody>
	</table>
</body>
</html>

<% 							
		
	} catch (Exception e) {
		out.println("<h2>[예외발생]담당자에게(8282) 전화하세요</h2>");
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {}
	}
					
%>