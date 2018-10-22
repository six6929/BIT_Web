<%@page import="com.bc.mybatis.GuestBookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//DB에 있는 테이블 전체 데이터 가져오기
	//1. SqlSession 객체 만들기
	SqlSession ss = DBService.getFactory().openSession();
	
	//2. mapper의 SQL문 실행
	List<GuestBookVO> list = ss.selectList("all");
	ss.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
<style>
	#container {
		width : 512px;
		margin : auto;
	}
	
	#container h2 {
		text-align : center;
	}
	
	#container p {
		text-align : center;
	}
	
	#container table {
		width : 500px;
		padding : 0 5px;
		border : 1px solid black;
		border-collapse : collapse;
	}
	
	#container th, td {
		border : 1px solid black;
	}
	
	#container table th {
		background-color : #9cf;
		text-align : center;
	}
	
	#container table td {
		text-align : left;
	}
	
	#container p > a {
		text-decoration : none;
		font-weigth : bold;
	}
	
	#container .center {
		text-align : center;
	}
</style>
</head>
<body>
	<div id="container">
		<h2>방명록</h2>
		<hr>
		<p>[<a href="write.jsp">방명록 쓰기</a>]</p>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<%--
				<tr>
					<td class="center">1</td>
					<td class="center">홍길동</td>
					<td>제목1</td>
					<td class="center">2018/10/17</td>
				</tr>
			--%>
<%
			if (list.size() > 0) {
				for (GuestBookVO vo : list) {
%>	
				<tr>
					<td class="center"><%=vo.getIdx() %></td>
					<td class="center"><%=vo.getName() %></td>
					<td class="center">
						<a href="onelist.jsp?idx=<%=vo.getIdx() %>"><%=vo.getSubject() %></a>
					</td>
					<td class="center"><%=vo.getRegdate() %></td>
				</tr>
<%				
				}
			} else {
%>
				<tr>
					<td colspan="4">입력된 자료가 없습니다.</td>
				</tr>
<%
			}
%>
			</tbody>
		</table>
	</div>	
</body>
</html>