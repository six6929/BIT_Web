<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 idx(사번) 데이터 삭제 --%>

<%
final String DRIVER = "oracle.jdbc.OracleDriver";
final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
final String USER = "mystudy";
final String PASSWORD = "mystudypw";
Connection conn = null;
PreparedStatement pstmt = null;

//전달받은 파라미터 값
int idx = Integer.parseInt(request.getParameter("idx"));

String sql = "";
sql += "DELETE FROM GUEST WHERE SABUN = ?";

try {
	//1. 드라이버 로딩
	Class.forName(DRIVER);
	//2. DB연결(Connection)
	conn = DriverManager.getConnection(URL, USER, PASSWORD);
	//3. Statement 객체 생성
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, idx);
	//4. SQL문 실행
	int cnt = pstmt.executeUpdate();
	//입력성공
	if(cnt > 0) {
		response.sendRedirect("list.jsp");
	}
	
} catch (Exception e) {
	out.println("<h2>[예외발생] 담당자에게(8282) 연락바랍니다</h2>");
	e.printStackTrace();
} finally {
	try {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	} catch (Exception e) {}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제실패</title>
</head>
<body>
	<h1>삭제 실패</h1>
	<p>삭제작업 처리를 하지 못했습니다.</p>
	<a href="list.jsp">목록페이지 이동</a>
</body>
</html>