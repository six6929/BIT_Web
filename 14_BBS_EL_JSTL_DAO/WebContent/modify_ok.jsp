<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이타를 사용해서 DB에 수정 작업 --%>
<%
	request.setCharacterEncoding("UTF-8");

	//Multipart 사용으로 request 객체에서 파라미터값을 추출할 수 없음
	//MultipartRequest 객체를 생성해서 데이타 처리
	String path = getServletContext().getRealPath("/upload");
	MultipartRequest mr = new MultipartRequest(
			request, path, 10*1024*1024, "UTF-8",
			new DefaultFileRenamePolicy());
	
	BBSVO bvo = new BBSVO();
	String b_idx = mr.getParameter("b_idx");
	bvo.setB_idx(b_idx);
	bvo.setSubject(mr.getParameter("subject"));
	bvo.setWriter(mr.getParameter("writer"));
	bvo.setContent(mr.getParameter("content"));
	bvo.setPwd(mr.getParameter("pwd"));
	
	bvo.setIp(request.getRemoteAddr());
	
	//첨부파일 처리
	if (mr.getFile("file_name") != null) {//첨부파일 있음
		bvo.setFile_name(mr.getFilesystemName("file_name"));
		bvo.setOri_name(mr.getOriginalFileName("file_name"));
	} else { //첨부파일 없음
		bvo.setFile_name("");
		bvo.setOri_name("");
	}
	
	//DAO 호출하면서 vo객체를 전달해서 DB데이타 수정 처리
	DAO.update(bvo);
	
	//페이지 이동(list.jsp / view.jsp)
	//response.sendRedirect("list.jsp");
	//response.sendRedirect("list.jsp?cPage=" + session.getAttribute("cPage"));
	
	response.sendRedirect("view.jsp?b_idx="+ b_idx
			+ "&cPage=" + session.getAttribute("cPage"));
%>











