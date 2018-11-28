<%@page import="com.spring.biz.board.impl.BoardDAO"%>
<%@page import="com.spring.biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 값으로 DB연동처리(삭제) 후 화면이동 --%>
<%
	//1.파라미터값 받아오기
	String seq = request.getParameter("seq");
	
	//2. DB연결
	BoardVO vo = new BoardVO();
	vo.setSeq(Integer.parseInt(seq));
	
	BoardDAO boardDAO = new BoardDAO();
	boardDAO.deleteBoard(vo);
	
	//3.화면출력
	response.sendRedirect("getBoardList.jsp");
%>