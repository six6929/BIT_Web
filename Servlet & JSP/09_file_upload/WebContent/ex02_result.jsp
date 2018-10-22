<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 여러개의 파일을 업로드 처리 --%>

<%
	request.setCharacterEncoding("utf-8");

	//실제 파일을 저장하기 위한 위치정보 확인(upload)
	ServletContext sc = this.getServletContext();
	String path = sc.getRealPath("/upload");
	System.out.println("물리적 파일저장위치(path) : " + path);
	
	MultipartRequest mr = new MultipartRequest(
			request,
			path,
			10 * 1024 * 1024,
			"UTF-8",
			new DefaultFileRenamePolicy()
			);
	
	out.println("<h1>파일 업로드 결과보기</h1>");
	out.println("<h2>올린사람(name) : " + mr.getParameter("name") + "</h2>");
	out.println("<h2>파일제목(title) : " + mr.getParameter("title") + "</h2>");
	
	//업로드 파일관련 정보 처리
	Enumeration m = mr.getFileNames();
	while(m.hasMoreElements()) {
		String name = (String) m.nextElement();
		//파일정보표시
		out.println("<p>업로드 파라미터명 : " + name + "</p>");
		out.println("<p>원본파일명 : " + mr.getOriginalFileName(name) + "</p>");
		out.println("<p>저장파일명 : " + mr.getFilesystemName(name) + "</p>");
		out.println("<p>파일타입 : " + mr.getContentType(name) + "</p>");
		out.println("<p>---------------------------------</p>");
		
		//실제파일 정보 확인
		File file = mr.getFile(name);
		out.println("<h2>파일이름 : " + file.getName() + "</h2>");
		out.println("<h2>파일크기 : " + file.length() + " byte</h2>");
		
		//다운로드 링크 표시
		out.println("<h2>다운로드 :</h2>");
		out.println("<a href='download.jsp?path=upload&name=" 
			+ mr.getFilesystemName(name) +"'>" 
			+ mr.getOriginalFileName(name) +"</a>");
		out.println("<hr>");
		
	}
%>