<%@page import="com.spring.biz.board.impl.BoardDAO"%>
<%@page import="com.spring.biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 DB에 입력 처리하고 목록 페이지로 이동--%>
<%
	//1. 전달 받은 데이터 추출
	request.setCharacterEncoding("utf-8"); //한글처리
	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	//2. DB 연동 처리(데이터 입력)
	BoardVO vo = new BoardVO();
	vo.setTitle(title);
	vo.setWriter(writer);
	vo.setContent(content);
	
	BoardDAO boardDAO = new BoardDAO();
	boardDAO.insertBoard(vo);
	
	//3. 화면 네비게이션(목록페이지 이동)
	response.sendRedirect("getBoardList.jsp");
%>