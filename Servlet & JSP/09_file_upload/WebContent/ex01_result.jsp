<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일 업로드 결과 표시 --%>
<%
	//한글처리를 위한 UTF-8 설정
	request.setCharacterEncoding("UTF-8");
	
	//form 태그에 enctype="multipart/form-data" 사용시
	//request 객체를 통한 파라미터 값 조회 안됨
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	System.out.println("name: " + name + ", title: " + title);
	
	//----------------------------------------
	//실제 파일을 upload 폴더에 저장하기 위해 저장위치정보 확인
	ServletContext sc = this.getServletContext();
	String path = sc.getRealPath("/upload");
	System.out.println("/upload : " + path);
	
	//MultipartRequest 사용해서 처리
	//MultipartRequest에는 기본생성자 없음
	MultipartRequest mr = new MultipartRequest(
			request, //MultipartRequest에서 request 정보 사용
			path, //실제 파일을 저장하기 위한 경로
			10 * 1024 * 1024, //업로드 파일의 최대용량(byte 단위)
			"UTF-8", //인코딩 타입
			new DefaultFileRenamePolicy() //파일이름 중복처리
			);
	/* MultipartRequest 주요 메소드 
	getParameter(문자열) : String 리턴
	getParameterValues(문자열) : String[] 리턴
	getOriginalFileName(문자열) : 업로드 할 때 사용한 파일 이름
	getFilesystemName(문자열) : 저장된 파일 이름(실제 물리적으로)
	getContentType(문자열) : 업로드된 파일 타입
	getFile(문자열) : File 리턴 - 업로드된 파일 객체
	*/
	out.println("<h1>파일 업로드 결과 보기</h1>");
	out.println("<h2>올린사람(name) : " + mr.getParameter("name") + "</h2>");
	out.println("<h2>파일제목(title) : " + mr.getParameter("title") + "</h2>");
	out.println("<h2>파일(f_name) : " + mr.getParameter("f_name") + "</h2>");
	out.println("<h2>원본파일명 : " + mr.getOriginalFileName("f_name") + "</h2>");
	out.println("<h2>저장파일명 : " + mr.getFilesystemName("f_name") + "</h2>");
	out.println("<h2>파일타입 : " + mr.getContentType("f_name") + "</h2>");
	out.println("<hr>");
	
	//파일 객체 생성 - 파일 정보 확인
	File file = mr.getFile("f_name");
	out.println("<h2>파일이름 : " + file.getName() + "</h2>");
	out.println("<h2>파일크기 : " + file.length() + " byte</h2>");
	//----------------------------
	
	//다운로드 링크 작성
	out.println("<h2>파일위치 : "+ file.getPath() +"</h2>");
	//<a href='download.jsp?path=upload&name=file.jpg'>file.jsp</a>
	out.println("<h2>다운로드 :</h2>");
	out.println("<a href='download.jsp?path=upload&name=" 
			+ mr.getFilesystemName("f_name") +"'>" 
			+ mr.getOriginalFileName("f_name") +"</a>");
	
	
%>
<br><br><br><br><br><br><br><br><br>








