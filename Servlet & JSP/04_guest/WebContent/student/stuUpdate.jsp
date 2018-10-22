<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이타를 이용해서 DB에서 수정작업 처리 --%>
<%!
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
%>
<%
	//전달받은 파라미터 값 추출
	int idx = Integer.parseInt(request.getParameter("idx"));
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	
	//DB연결하고 UPDATE SQL작성해서 DB에 수정처리
	Connection conn = null;	
	PreparedStatement pstmt = null;
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결(Connection)
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성
		String sql = "";
		sql += "UPDATE STUDENT2 ";
		sql += "   SET KOR = ?, ENG = ?, MATH = ? ";
		sql += " WHERE IDX = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, kor);
		pstmt.setInt(2, eng);
		pstmt.setInt(3, math);
		pstmt.setInt(4, idx);
		
		//4. SQL문 실행
		int result = pstmt.executeUpdate();
		
		//결과에 따른 페이지 이동처리 : 성공시 - stuList.jsp
		if (result > 0) {
			response.sendRedirect("stuList.jsp");
		} else {
			response.sendRedirect("stuUpdateForm.jsp");
		}
		
	} catch (Exception e) {
%>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 입력</title>
</head>
<body>
<table border="1" width="800px">
	<tr>
		<th width="250">
			<a href="main.jsp">
			<img src="../imgs/bitcamp_logo.png" 
				alt="로고" width="200px">
			</a>
		</th>
		<th width="100px"><a href="stuList.jsp">조회</a></th>
		<th width="100px"><a href="stuForm.jsp">학생등록</a></th>
		<th width="100px" bgcolor="orange"><a href="stuAdd.jsp">성적입력</a></th>
		<th width="100px"><a href="stuDel.jsp">데이타삭제</a></th>
	</tr>
	<tr>
		<td colspan="5" height="400">
			<center>
			<h1>성적 입력(수정)</h1>
<% 			
			//예외 발생시 예외 메시지 표시 - 담당자에게 연락
			out.println("<h2>[예외발생]담당자(8282)전화연락</h2>");
%>
			</center>
		</td>
	</tr>
</table>
</body>
</html>
<%
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {}
	}		
%>
