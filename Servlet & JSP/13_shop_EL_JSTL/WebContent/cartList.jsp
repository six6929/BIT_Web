<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니(cart) 보기</title>
<style>
	table {
		width: 600px;
		border: 1px solid navy;
		border-collapse: collapse;
		margin: 30px auto auto auto; /* 상, 우, 하, 좌 */
		font-size: 0.8em;
	}
	th, td {
		border: 1px solid navy;
		padding: 0 4px; /* 상하, 좌우 */
		height: 2em;
	}
	th { background-color: #dedede; }
	tfoot {
		height: 3em;
		font-size: 1.5em;
		font-weight: bold;
		text-align: center;
	}
	
	.red { color: red; }
</style>
</head>
<body>
	<jsp:include page="shop.jsp"/>
	<jsp:useBean id="cart" class="com.bc.mybatis.Cart"
			scope="session"/>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO"
			scope="session"/>			
<%--EL,JSTL 버전으로 변경하면서 주석처리
	List<ShopVO> list = cart.getList();
--%>	
<%
	pageContext.setAttribute("list", cart.getList());	
%>	
	<table>
	<thead>
		<tr>
			<td colspan="6">::장바구니 내용</td>
		</tr>
		<tr>
			<th>제품번호</th>
			<th>제품명</th>
			<th>단가</th>
			<th>수량</th>
			<th>금액</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
	<%-- <c:if test="${list == null  || list.size() <= 0}"> --%> 		
	<c:if test="${empty list}"> 		
		<tr>
			<td colspan="6">장바구니가 비었습니다.</td>
		</tr>
	</c:if>		
	<c:if test="${not empty list}"><!-- 장바구니에 데이타가 있는 경우 --> 
		<c:forEach var="vo" items="${list}">
		<tr>
			<td>${vo.getP_num() }</td>
			<td>${vo.getP_name() }</td>
			<td>정가: ${vo.getP_price() }원
				<span class="red">(세일가격: ${vo.getP_saleprice() }원)</span>
			</td>
			<td>
				<form action="editQuant.jsp" method="post">
					<input type="number" name="su" 
						value="${vo.getQuant() }" size="3">
					<input type="hidden" name="p_num"
						value="${vo.getP_num() }">
					<input type="submit" value="수정">
				</form>
			</td>
			<td>${vo.getTotalprice() }</td>
			<td>
				<input type="button" value="삭제"
					onclick="javascript:location.href='delProduct.jsp?p_num=${vo.getP_num() }'">
			</td>
		</tr>
		</c:forEach>
	</c:if>	
	</tbody>
	<tfoot>
		<tr>
			<td colspan="6">총결재금액 : ${cart.getTotal() }원</td>
		</tr>
	</tfoot>
	</table>
</body>
</html>







