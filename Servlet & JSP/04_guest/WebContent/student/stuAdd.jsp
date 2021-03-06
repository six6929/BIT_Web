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
		sql += "SELECT IDX FROM STUDENT2 ";
		sql += " ORDER BY IDX ";
		pstmt = conn.prepareStatement(sql);
		
		//4. SQL문 실행
		rs = pstmt.executeQuery();
					
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 입력</title>
</head>
<body>
<table border="1" width="800px">
	<tr>
		<th width="250">
			<a href="main.jsp">
			<img src="../imgs/bitcamp_logo.png" alt="로고" width="200px">
			</a>
		</th>
		<th width="100px">
			<a href="stuList.jsp">조회</a>
		</th>
		<th width="100px">
			<a href="stuForm.jsp">학생등록</a>
		</th>
		<th width="100px" bgcolor="orange">
			<a href="stuAdd.jsp">성적입력</a>
		</th>
		<th width="100px">
			<a href="stuDel.jsp">데이터삭제</a>
		</th>
	</tr>
	<tr>
		<td colspan="5" height="400">
			<center>
				<h1>성적 입력</h1>
				<form action="stuUpdateForm.jsp">
					<select name="idx">
					<%--
					<option value="1111">1111</option>
					<option value="2222">2222</option>
					 --%>
<%
					//5. SQL문 실행결과에 대한 처리
					while(rs.next()) {
						int idx = rs.getInt(1);
%>
						<option value="<%=idx %>"><%=idx %></option>
<% 					} 

%>
					</select>
					<input type="submit" value="성적입력">
				</form>
			</center>
		</td>
	</tr>
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
