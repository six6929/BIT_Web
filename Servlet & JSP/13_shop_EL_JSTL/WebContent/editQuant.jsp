<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 제품번호(p_num)와 수량(su) 값으로 장바구니 데이타 수정처리 --%>
<jsp:useBean id="cart" class="com.bc.mybatis.Cart"
		scope="session"/>
<%
	//1. 파라미터 값 추출
	String p_num = request.getParameter("p_num");
	int su = Integer.parseInt(request.getParameter("su"));
	
	//2. 장바구니(cart)에 있는 제품의 수량 변경 처리
	cart.setQuant(p_num, su);
	
	//3. 페이지 이동(cartList.jsp)
	response.sendRedirect("cartList.jsp");
%>
