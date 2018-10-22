<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<!--  HTML 주석 : 소스보기에서 볼 수 있음 -->
	<%-- JSP 주석 : 소스보기에서 볼 수 없음 --%>
	
	<%-- JSP 구성 : 디렉티브, 선언부, 스크립트릿, 표현식
	1. 디렉티브(<%@ %>)
		- page : JSP 페이지에 대한 정보 지정
		- taglib : 사용할 태그 라이브러리 지어(JSTL 사용)
		- include : 특정영역에 다른 문서를 포함 할 때
		
	2. 선언부(<%! %>) : 전역 변수 또는 메소드 선언할 때 사용
	3. 스크립트릿(<% %>) : 자바코드를 작성할 때 사용
		- service 메소드에서 실행될 코드
	4. 표현식(<%= %>) : 값을 출력(변수, 메소드 결과 표시할 때)
		- out 객체를 사용 
	--%>
</body>
</html>