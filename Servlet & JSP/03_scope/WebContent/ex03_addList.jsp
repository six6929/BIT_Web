<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 품목을 장바구니에 담기 --%>
<%
	//전달받은 데이터 확인
	String product = request.getParameter("product");

	//장바구니에 담기 : ArrayList에 저장
	//ArrayList<String> list = new ArrayList<>();
	//list.add(product);
	
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("product_list");
	if(list == null) {
		session.setAttribute("product_list", new ArrayList<String>());
		list = (ArrayList<String>)session.getAttribute("product_list");
	}
	list.add(product);
	System.out.println("list : " + list);
	
	//response.sendRedirect("ex03_shopping.jsp");
%>
<script>
	history.go(-1);// 뒤로 이동하기(이전으로)
</script>