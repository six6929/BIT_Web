<%@page import="com.bc.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 전달받은 데이타를 사용해서 DB에 댓글 입력처리--%>
<%
	request.setCharacterEncoding("UTF-8");

	String cPage = request.getParameter("cPage");
%>
<%-- 전달받은 데이타를 DB에 입력하기 위해 CommVO 객체에 담기 --%>
	<jsp:useBean id="cvo" class="com.bc.mybatis.CommVO"/>
	<jsp:setProperty property="*" name="cvo"/>
<%
	cvo.setIp(request.getRemoteAddr());

	System.out.println("댓글입력vo : " + cvo); 
	
	//DB에 입력 처리
	DAO.insertComment(cvo);
	
	response.sendRedirect("view.jsp?b_idx="+ cvo.getB_idx()
			+ "&cPage="+ cPage);
%>	











