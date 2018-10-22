<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String category = request.getParameter("category");
	
	//방법1 : DBService와 SqlSession 객체 이용해서 DB작업
	//SqlSession ss = DBService.getFactory().openSession();
	//List<ShopVO> list = ss.selectList("list", category);
	
	//방법2 : DAO 이용
	
%>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO" scope="session"></jsp:useBean>
<%
	List<ShopVO> list = dao.list(category);
	//System.out.println("제품목록 : " + dao.list(category));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
<style>
	table {
		width : 600px;
		margin : 30px auto 0 auto;
		border : 1px solid navy;
		border-collapse : collapse;
		font-size : 0.8em;
	}
	
	th, td {border:1px solid navy; paddong : 4px;}
	th {background-color: #dedede; }
	.darkred {color:red}
</style>
</head>
<body>
	<jsp:include page="shop.jsp" />
	
	<table border="1">
		<tr>
			<th width="15%">제품번호</th>
			<th width="10%">이미지</th>
			<th width="20%">제품명</th>
			<th width="20%">제품가격</th>
			<th>비고 </th>
		</tr>
<!-- 		<tr>
			<td>번호</td>
			<td>사진image</td>
			<td>제품명 TV</td>
			<td>5000</td>
			<td>원래 판매가 10000</td>
		</tr> -->
		
		<%
		if (list.size() <= 0) { //데이터가 없는 경우
		%>
		<tr>
			<td colspan="5">현재 등록된 제품이 없습니다.</td>
		</tr>
		<%
		} else {//데이터 있는 경우 tr태그 작성
			for(ShopVO vo : list) {
		%>
			<tr>
				<td>
					<a href="product_content.jsp?p_num=<%=vo.getP_num() %>"><%=vo.getP_num() %></a>
				</td>
				<td>
					<img src="images/<%=vo.getP_image_s() %>" width="100px" height="95px" alt="">;
				</td>
				<td><%=vo.getP_name() %></td>
				<td>할인가 : <%=vo.getP_saleprice() %>원 <br>
					<span class="darkred">(할인율 : <%=vo.getPercent() %>%)</span>
				</td>
				<td>시중가격 : <%=vo.getP_price() %>원</td>
			</tr>
		<%
			}
		}
		%>
	</table>
</body>
</html>



















