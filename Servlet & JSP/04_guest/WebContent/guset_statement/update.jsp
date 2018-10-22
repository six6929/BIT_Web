<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 idx(사번) 데이터 삭제 --%>

<%

//한글처리
request.setCharacterEncoding("UTF-8");

final String DRIVER = "oracle.jdbc.OracleDriver";
final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
final String USER = "mystudy";
final String PASSWORD = "mystudypw";
Connection conn = null;
Statement stmt = null;

//전달받은 파라미터 값
int sabun = Integer.parseInt(request.getParameter("sabun"));
String name = request.getParameter("name");
int pay = Integer.parseInt(request.getParameter("pay"));


String sql = "";
sql += "UPDATE GUEST ";
sql += "  SET NAME = '" + name + "',";
sql += "      NALJA = SYSDATE , ";
sql += "      PAY = " + pay;
sql += "  WHERE SABUN = " + sabun;


try {
	//1. 드라이버 로딩
	Class.forName(DRIVER);
	//2. DB연결(Connection)
	conn = DriverManager.getConnection(URL, USER, PASSWORD);
	//3. Statement 객체 생성
	stmt = conn.createStatement();
	//4. SQL문 실행
	int cnt = stmt.executeUpdate(sql);
	//수정성공
		response.sendRedirect("list.jsp");
	
} catch (Exception e) {
	out.println("<h2>[예외발생] 담당자에게(8282) 연락바랍니다</h2>");
	e.printStackTrace();
} finally {
	try {
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	} catch (Exception e) {}
}
%>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정실패</title>
</head>
<body>
	<h1>수정 실패</h1>
	<p>수정작업 처리를 하지 못했습니다.</p>
	<a href="detail.jsp?idx=<%=sabun %>">상세페이지 이동</a>
	<a href="list.jsp">목록페이지 이동</a>
</body>
</html>