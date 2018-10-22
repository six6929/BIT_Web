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
	
	//파라미터 값 추출
	String id = request.getParameter("id");
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결(Connection)
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성
		String sql = "";
		sql += "DELETE FROM MEMBER2 WHERE ID = ? ";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);

		//4. SQL문 실행
		int result = pstmt.executeUpdate();
		if(result > 0) {
			response.sendRedirect("selectAll.jsp");
		} else {
			response.sendRedirect("deleteMember.jsp");
		}
		
		
	} catch (Exception e) {
		out.println("<h2>[예외발생]담당자에게(8282) 전화하세요</h2>");
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {}
	}
	
%>