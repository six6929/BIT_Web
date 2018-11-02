<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 DB에 저장하고 list.jsp 이동 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%--Multipart 사용시에는 request로 부터 getParameter 처리가
	안되므로 파라미터 값을 VO에 일괄 입력처리 하지 못함.
	<jsp:useBean id="bvo" class="com.bc.mybatis.BBSVO"/>
	<jsp:setProperty property="*" name="bvo"/>
--%>
<%
	//Multipart 사용되었으므로 MultipartRequest 사용처리
	//파일의 저장할 위치값 확인
	String path = getServletContext().getRealPath("/upload");
	
	MultipartRequest mr = new MultipartRequest(
			request, path, (10 * 1024 * 1024),
			"UTF-8", new DefaultFileRenamePolicy());
	
	BBSVO bvo = new BBSVO();
	bvo.setSubject(mr.getParameter("subject"));
	bvo.setWriter(mr.getParameter("writer"));
	bvo.setContent(mr.getParameter("content"));
	bvo.setPwd(mr.getParameter("pwd"));
	
	bvo.setIp(request.getRemoteAddr()); //접속자 IP정보
	
	//첨부파일 처리
	if (mr.getFile("file_name") != null) {
		bvo.setFile_name(mr.getFilesystemName("file_name"));
		bvo.setOri_name(mr.getOriginalFileName("file_name"));
	} else {
		bvo.setFile_name(""); //실제 저장시 사용된 파일명
		bvo.setOri_name(""); //원본 파일명
	}
	
	//DB에 저장하기
	DAO.insert(bvo);
	
	//목록페이지 이동
	response.sendRedirect("list.jsp");
	
%>	








