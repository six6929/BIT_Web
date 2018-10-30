<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	 JSTL(JSP Standard Tag Library)
	 0. 라이브러리 다운
	 	다운로드 : https://tomcat.apache.org/download-taglibs.cgi
	 1. 라이브러리 등록
	 	WebContent/WEB-INF/lib/jar파일 등록
	 2. JSP 페이지 작성시 지시부에 사용을 위한 선언
	 	<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 --%>
 	
 	
 	<h2>JSTL 사용</h2>
	<%-- 
		 변수(속성) 선언태그(set) : setAttribute 역할 
		 <c:set var="속성이름" value="값" scope="범위">
		 scope : page | request | session | application
	--%>
 	<c:set var="test" value="Hello JSTL!!!" />
 	<c:set var="test" value="Hello JSTL!!!-request" scope="request" />
 	
 	<%-- 
 		데이터 출력태그(out) : 표현식이나 EL 역할
 		<c:out value="출력할 값 or 변수사용시 EL방식">
 	 --%>
 	
 	<p><c:out value="Hello World!!!"/></p>
 	<p><c:out value="${test }"></c:out></p>
 	<p>EL : ${test }</p>  
 	<p>EL(page) : ${pageScope.test }
	<p>EL(request) : ${requestScope.test }</p>
	
	<%--
		삭제태그(remove) : 선언된 변수 삭제(removeAttribute 역할주의 : scope 선언이 없으면 모든 scope 상에 있는 것은 삭제 
		<c:remove var="변수명" scope="범위"></c:remove>
	--%>
	<c:remove var="test" scope="page"/>
	<p>test 삭제 결과 확인 : ${test }</p>
	
	<c:remove var="test"/>
	<p>test 삭제(scope선언없이) 결과 확인 : ${test }</p>
	
	<%-- =================================== --%>
	<%-- Java 코드의 if문에 해당하는 태그(if)
		 - test 속성 값이 true면 if태그내에 있는 문장이 실행
		 - var 변수에는 test 결과값 저장
		 주의 : JSTL if태그에는 else가 없음
		<c:if test="조건식(EL사용가능)" var="변수명" scope="범위"></c:if>
	--%>
	<h2>if태그의 test 값</h2>
	<c:if test="true"><p>true인 경우 실행</p></c:if>
	<c:if test="false"><p>false인 경우 실행안됨</p></c:if>
	<c:if test="${20 > 10 }"><p>20 > 10 true인 경우 실행</p></c:if>
	
	
	<%--======================================================= --%>
	<%-- 
		Java 코드의 if문에 해당하는 태그(if)
		주의 : JSTL if태그에는 else가 없음 
		- test속성 값이 true면 
		<c:if test="조건식(EL사용가능)" var="변수명" scope="범위"></c:if>
	--%>
	<h2>if 태그</h2>
	<c:set var="n1" value="10"/>
	<c:set var="n2" value="20"/>
	
	<%-- if문 --%>
	<c:if test="${n1 > n2 }" var="k">
		<p>if문 결과 n1(${n1 })이 n2(${n2 })보다 큽니다.</p>
		<p>var k : ${k }</p>
	</c:if>
	
	<%-- else에 해당하는 if문 --%>
	<c:if test="${n1 <= n2 }" var="k">
		<p>if문 결과 n1(${n1 })이 n2(${n2 })보다 작거나 같습니다.</p>
		<p>var k : ${k }</p>
	</c:if>
	
	<%-- 비교값이 false인 경우 : if문 내의 문장 실행 안됨 --%>
	<c:if test="${5 == 6 }" var="k2">
		<p>if \${5 == 6 } 의 결과 : ${k2 }, <c:out value="${k2 }"/></p>
	</c:if>
	<p>if문의 var="k2" 값 : ${k2 }</p>
	<hr>
	
	<h2>choose문 : 자바의 switch문과 유사(if~ else 처리 가능)</h2>
	<%--
		<c:choose>
			<c:when test="조건식(EL)">실행할문장</c:when>
			<c:when test="조건식(EL)">실행할문장</c:when>
			<c:when test="조건식(EL)">실행할문장</c:when>
			<c:otherwise>
				위의 조건을 만족하지 않으면 실행할 문장
			</c:otherwise>
		</c:choose>
	--%>
	<%-- 합격, 불합격 판정 : 점수가 60이상이면 합격 미만이면 불합격 --%>
	<c:set var="jumsu" value="60"/>
	<c:if test="${jumsu >= 60 }">
		<p>판정결과(${jumsu }점) : <c:out value="합격"/></p>
	</c:if>
	<c:if test="${jumsu < 60 }">
		<p>판정결과(${jumsu }점) : <c:out value="불합격"/></p>
	</c:if>
	<hr>
	
	<c:choose>
		<c:when test="${jumsu >= 60 }" > 판정결과(${jumsu }점) : 합격 </c:when>
		<c:otherwise>판정결과(${jumsu }점) : 불합격 </c:otherwise>
	</c:choose>
	<hr>
	
	<h3>choose문으로 학점표시(실습)</h3>
	<%--
		choose문을 사용하고 평가결과를 저장한 testResult가 
		90이상 A학점, 80이상 B학점, 70이상 C학점, 70미만 재수강 출력 
	--%>
	<c:choose>
		<c:when test="${jumsu >= 90}"> 판정결과(${jumsu }점) : A학점</c:when>
		<c:when test="${jumsu >= 80}"> 판정결과(${jumsu }점) : B학점</c:when>
		<c:when test="${jumsu >= 70}"> 판정결과(${jumsu }점) : C학점</c:when>
		<c:otherwise>판정결과(${jumsu }점) : F학점</c:otherwise>
	</c:choose>
	
	<%--================================================--%>
	<%--
		<c:forEach var="변수명" begin="시작값" end="끝값" step="증감">
		</c:forEach>
	--%>
	<h2>반복문 : forEach문</h2>
	<p>1~10까지의 숫자 출력</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }&nbsp;&nbsp;
	</c:forEach>
	<hr>
	
	
	<p>forEach문 밖에서 \${i } 출력 : ${i }</p>
	
	<p>1~10까지의 수 중에 짝수 출력(실습 step="1" 사용)</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i % 2 == 0 }">
			${i }&nbsp;
		</c:if>
	</c:forEach>
	
	<p>1~10까지의 수 중에 짝수 출력(실습 step="2" 사용)</p>
	<c:forEach var="i" begin="2" end="10" step="2">
		${i }&nbsp;
	</c:forEach>
	<hr>
	
	<hr><hr>
	<%--========================== --%>
	<h2>스크립트릿으로 배열값 출력</h2>
	<%
		String[] arr = {"홍길동", "일지매", "임꺽정", "둘리"};
		for (String name : arr) {
			out.print(name + ", ");
		}
	%>
	<%-- 
		<c:forEach var="변수" items="${배열명}"></c:forEach>
	--%>
	<hr>
	<h3>forEach문으로 배열값 출력(속성설정전)</h3>
	<c:forEach var="name" items="${arr }">
		${name }&nbsp;&nbsp;
	</c:forEach>
	
	<h3>forEach문으로 배열값 출력(page 영역에 속성설정후)</h3>
<%-- 	
<%
	pageContext.setAttribute("attr_name", arr);
%>
--%>
	<c:set var="attr_name" value="<%=arr %>"/>
	<c:forEach var="name" items="${attr_name }">
		${name }&nbsp;&nbsp;
	</c:forEach>
	
	<%-- ========================================== --%>
	<h2>문자열 자르기 : forTokens</h2>
	<%
	String strs = "홍길동/김유신/일지매,임꺽정/마루치,둘리,고길동";
	pageContext.setAttribute("attr_strs", strs);
	%>
	<p>attr_strs : ${attr_strs }</p>
	
	<h3>forTokens 구분자 / 지정</h3>
	<c:forTokens var="str" items="${attr_strs }" delims="/">
		<p>${str }</p>
	</c:forTokens>
	
	<hr>
	
	<h3>forTokens 구분자 / 와 , 지정</h3>
	<c:forTokens var="str" items="${attr_strs }" delims="/,">
		<p>${str }</p>
	</c:forTokens>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>