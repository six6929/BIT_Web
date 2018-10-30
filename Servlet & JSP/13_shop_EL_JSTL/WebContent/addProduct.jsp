<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 장바구니(cart)에 표시할 데이타 생성
	1. 장바구니 정보를 담은 객체 생성(카트 만들기)
	2. 장바구니에 제품 추가(전달받은 제품번호 사용)
	3. 장바구니에 담은 후에 다시 상세정보 페이지로 이동
		(제품번호의 상세정보 표시)
--%>
	<jsp:useBean id="cart" class="com.bc.mybatis.Cart"
			scope="session"/>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO"
			scope="session"/>
<%
	String p_num = request.getParameter("p_num");

	//장바구니(cart)에 제품 담기
	cart.addProduct(p_num, dao);
	System.out.println("카트목록: " + cart.getList());
	
	//제품 상세페이지 이동
	response.sendRedirect("product_content.jsp?p_num=" + p_num);
%>			