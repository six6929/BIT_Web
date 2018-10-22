<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달받은 파라미터 idx(사번정보) 확인 후 DB에서 데이터 조회
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	//파라미터 값 확인
	String idx = request.getParameter("idx");
	String sql = "";
	sql += "SELECT SABUN, NAME, NALJA, PAY ";
	sql += "  	FROM GUEST ";
	sql += "	WHERE SABUN = " + idx;
	
	//데이터 저장 변수 선언
	int sabun = 0;
	String name = "";
	Date nalja = null;
	int pay = 0;

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
		if(rs.next()) {
			sabun = rs.getInt("SABUN");
			name = rs.getString("NAME");
			nalja = rs.getDate("NALJA");
			pay = rs.getInt("PAY");
		}
		
	} catch (Exception e) {
		out.println("<h2>[예외발생] 담당자에게(8282) 연락바랍니다</h2>");
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
<title>상세정보</title>
</head>
<body>
	<h1>상세정보</h1>
	<table border="1">
		<tr>
			<th>사번</th>
			<td><%=sabun %></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=nalja %></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><%=pay %></td>
		</tr>
	</table>
	<br>
	<a href="editForm.jsp?idx=<%=sabun %>&name=<%=name %>&pay=<%=pay %>">수정</a>
	<a href="delete.jsp?idx=<%=sabun %>">삭제</a>
</body>
</html>