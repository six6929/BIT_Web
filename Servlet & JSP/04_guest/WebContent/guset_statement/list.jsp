<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JDBC 프로그램시 사용할 변수 선언 --%>
<%
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "";
	sql += "SELECT ROWNUM AS RN, SABUN, NAME, NALJA, PAY ";
	sql += "  FROM (SELECT SABUN, NAME, NALJA, PAY ";
	sql += "  			FROM GUEST ";
	sql += "			ORDER BY SABUN ";
	sql += "	   ) A";		
	int cnt = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
</head>
<body>
	<h1>사원목록</h1>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>사번</th>
				<th>성명</th>
				<th>날짜</th>
				<th>금액</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<%--1111 USER1 2018/10/11 1000 --%>
			<%-- 
			<tr>
				<td>1</td>
				<td>1111</td>
				<td>USER1</td>
				<td>2018/10/11</td>
				<td>1000</td>
			</tr>
			<tr>
				<td>2</td>
				<td>2222</td>
				<td>USER2</td>
				<td>2018/10/11</td>
				<td>2000</td>
			</tr>
			--%>
<%
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
		while (rs.next()) {
%>
			<tr>
				<td><%=rs.getInt("RN") %></td>
				<td><%=rs.getInt("SABUN") %></td>
				<td><%=rs.getString("NAME") %></td>
				<td><%=rs.getDate("NALJA") %></td>
				<td><%=rs.getInt("PAY") %></td>
				<td><a href="detail.jsp?idx=<%=rs.getInt("SABUN") %>">선택</a></td>
			</tr>
<%		}
		rs = stmt.executeQuery("SELECT COUNT(*) AS CNT FROM GUEST");
		if (rs.next()) {
			cnt = rs.getInt("CNT");
		}
	} catch (Exception e) {
		out.println("<h2>[예외발생] 담당자에게(8282) 연락바랍니다</h2>");
	} finally {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {}
	}
%>			
		</tbody>
	</table>
	<p>전체인원 : <%=cnt %> 명</p>
	<p><a href="addForm.jsp">사원등록(입력)</a><p>
	
</body>
</html>