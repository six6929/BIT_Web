<%@page import="com.bc.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 사용해서 DB에서 삭제 처리 --%>
<%
	request.setCharacterEncoding("UTF-8");
	String c_idx = request.getParameter("c_idx");
	String b_idx = request.getParameter("b_idx");
	
	//DB COMMENT_T 테이블 데이타 삭제(c_idx)
	DAO.deleteComment(c_idx);
	
	/* 페이지 이동(view.jsp b_idx, cPage 전달) 
	b_idx : 파라미터 값으로 전달 받은 값 사용
	cPage : session 영역에 있는 "cPage" 값 사용
	*************************************/
	String cPage = (String) session.getAttribute("cPage");
	response.sendRedirect("view.jsp?b_idx=" + b_idx 
			+ "&cPage=" + cPage);
	
%>