<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력할 사원정보 작성 / 사번은 자동생성 --%>
<%-- 사번자동생성을 위한 사번 최대값 구하기 + 1111 --%>
<%
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT NVL(MAX(SABUN), 0) AS MAXSABUN FROM GUEST ";
	int sabun = 0;
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결(Connection)
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성
		stmt = conn.createStatement();
		//4. SQL문 실행
		rs = stmt.executeQuery(sql);
		//5. SQL문 실행결과에 대한 처리
		if (rs.next()) {
			sabun = rs.getInt("MAXSABUN");
			sabun += 1111;
		}
	} catch (Exception e) {
		out.println("<h2>[예외발생]담당자에게(8282) 연락바랍니다</h2>");
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {}
	}
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
</head>
<body>
	<h1>사원 정보 등록</h1>
	<form action="insert.jsp">
		<table>
			<tr>
				<th>사번</th>
				<td>
					<input type="text" name="sabun" value="<%=sabun %>" readonly>
				</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="text" name="pay">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="사원등록">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>