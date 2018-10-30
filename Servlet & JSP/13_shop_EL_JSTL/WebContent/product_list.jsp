<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%--전달받은 카테고리 값에 따라서 제품 표시 --%>
<%
	request.setCharacterEncoding("UTF-8");

	String category = request.getParameter("category");
	
	//방법1 : DBService와 SqlSession 객체 이용해서 DB작업
	//SqlSession ss = DBService.getFactory().openSession();
	//List<ShopVO> list = ss.selectList("list", category);
%>
	<%--방법2 : DAO 이용 --%>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO"
			scope="session"/>
	
<%--EL, JSTL 사용으로 주석처리	
	List<ShopVO> list = dao.list(category);
	System.out.println("제품목록: " + list);
--%>
<%
	//EL,JSTL 사용버전으로 변경
	//조회된 제품목록 데이타를 page scope에 등록
	pageContext.setAttribute("list", dao.list(category));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
<style>
	table {
		width: 600px;
		margin: 30px auto 0 auto;
		border: 1px solid navy;
		border-collapse: collapse;
		font-size: 0.8em;
	}
	th, td { border: 1px solid navy; padding: 4px; }
	th { background-color: #dedede; }
	.red { color: red; }
</style>
</head>
<body>
	<jsp:include page="shop.jsp"/>	
	
	<table>
		<tr>
			<th width="15%">제품번호</th>
			<th width="10%">이미지</th>
			<th width="20%">제품명</th>
			<th width="20%">제품가격</th>
			<th>비고</th>
		</tr>
<%-- 		
<%
	if (list.size() <= 0) { //데이타 없는 경우
%>
		<tr>
			<td colspan="5">현재 등록된 제품이 없습니다.</td>
		</tr>
<%			
	} else {//데이타 있는 경우 tr 태그 작성
		for (ShopVO vo : list) {
%>
		<tr>
			<td><%=vo.getP_num() %></td>
			<td>
				<img src="images/<%=vo.getP_image_s() %>"
					width="100px" height="95px">
			</td>
			<td>
				<a href="product_content.jsp?p_num=<%=vo.getP_num() %>">
					<%=vo.getP_name() %>
				</a>
			</td>
			<td>할인가 : <%=vo.getP_saleprice() %>원<br>
			    <span class="red">(할인율 : <%=vo.getPercent() %>%)</span>
			</td>
			<td>시중가격: <%=vo.getP_price() %>원</td>
		</tr>
<%			
		}
	}
%>
--%>
<%-- 
	<c:if test="${list == null || list.size() <= 0 }"> <!-- 데이타 없는 경우-->
--%>
	<c:if test="${empty list }">
		<tr>
			<td colspan="5">현재 등록된 제품이 없습니다.</td>
		</tr>
	</c:if>		

<%-- 
	<c:if test="${list != null && list.size() > 0 }"> <!-- 데이타 있는 경우 tr 태그 작성-->
--%>				
	<c:if test="${not empty list }"><!--데이타 있는 경우 tr 태그 작성 -->
		<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.getP_num()  }</td>
			<td>
				<img src="images/${vo.getP_image_s() }"
					width="100px" height="95px">
			</td>
			<td>
				<a href="product_content.jsp?p_num=${vo.getP_num() }">
					${vo.getP_name() }
				</a>
			</td>
			<td>할인가 : ${vo.getP_saleprice() }원<br>
			    <span class="red">(할인율 : ${vo.getPercent() }%)</span>
			</td>
			<td>시중가격: ${vo.getP_price() }원</td>
		</tr>
		</c:forEach>
	</c:if>
	</table>
</body>
</html>







