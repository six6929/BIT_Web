<%@page import="com.bc.mybatis.ShopVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품번호를 사용 DB에서 제품정보 조회후 화면 출력 --%>
<%
	//전달 받은 값 추출
	String p_num = request.getParameter("p_num");
%>
	<%--액션태그 useBean은 scope상에 id이름의 속성이 있으면
		가져다 사용하고, 없으면 새로 생성
	--%>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO"
			scope="session"/>

<%--EL,JSTL 적용버전으로 변경을 위해 주석처리 	
	//DAO 객체 사용해서 제품정보 조회해서 vo에 저장
	ShopVO vo = dao.selectOne(p_num);
	
	//vo값 사용해서 HTML 태그 작성
	System.out.println("vo: " + vo);
--%>
<%
	//EL,JSTL 적용버전으로 변경(EL만 사용)
	pageContext.setAttribute("vo", dao.selectOne(p_num));
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세정보</title>
<style>
	table {
		width: 600px;
		border: 1px solid navy;
		border-collapse: collapse;
		margin: 30px auto auto auto;
		font-size: 0.8em;
	}
	th, td {
		border: 1px solid navy;
		padding: 0 4px;
		height: 2em;
	}
	th { background-color: #dedede; }
	tfoot { height: 3em; text-align: center; }
	
	.align-center { text-align: center; }
	.red { color: red; }
	.title { width: 40%; }
	.content { width: 60%; }
</style>
</head>
<body>
	<jsp:include page="shop.jsp"/>
	<table>
	<tbody>
		<tr>
			<th class="title">제품Category</th>
			<td class="content">${vo.getCategory() }</td>
		</tr>
		<tr>
			<th class="title">제품번호</th>
			<td class="content">${vo.getP_num() }</td>
		</tr>
		<tr>
			<th class="title">제품이름</th>
			<td class="content">${vo.getP_name() }</td>
		</tr>
		<tr>
			<th>제품제조사</th>
			<td>${vo.getP_company() }</td>
		</tr>
		<tr>
			<th>제품가격</th>
			<td>정가: ${vo.getP_price() }원
				<span class="red">(할인가격:${vo.getP_saleprice() }원)</span>
			</td>
		</tr>
		<tr>
			<th>제품설명</th>
			<td>${vo.getP_content() }</td>
		</tr>
		<tr>
			<td colspan="2" class="align-center">
				<img src="images/${vo.getP_image_l() }">
			</td>
		</tr>
	</tbody>	
	<tfoot>
		<tr>
			<td colspan="2">
				<input type="button" value="장바구니에 담기"
					onclick="javascript:location.href='addProduct.jsp?p_num=${vo.getP_num() }'">
				<input type="button" value="장바구니 보기"
					onclick="javascript:location.href='cartList.jsp'">
			</td>
		</tr>
	</tfoot>
	</table>
</body>
</html>












