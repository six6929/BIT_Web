<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 제품번호(p_num) 사용해서 카트(cart)에서 삭제 --%>
<jsp:useBean id="cart" class="com.bc.mybatis.Cart"
		scope="session"/>
<%
	//1. 파라미터 값 추출(p_num)
	String p_num = request.getParameter("p_num");
	
	//2. 카트(cart)에서 제품(p_num) 삭제 처리
	cart.delProduct(p_num);
	
	//3. 페이지 이동(cartList.jsp)
	response.sendRedirect("cartList.jsp");
%>		