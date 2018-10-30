<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- EL 사용해서 전달받은 파라미터 값 표시 --%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 사용 form 데이타 처리</title>
</head>
<body>
<%-- EL 사용시 파라미터 값은 scope에 저장하지 않음
	EL 내장객체 중 param, paramValues 사용처리
--%>
	<h2>결과보기 : EL사용(param, paramValues)</h2>
	<div>
		<p>이름(\${param.name }) : ${param.name }</p>
		<p>나이 : ${param.age }</p>
		<p>성별 : ${param.gender }</p>
		<p>취미(param) : ${param.hobby }</p>
		<p>취미(\${paramValues.hobby[0] }..) :
			${paramValues.hobby[0] }
			${paramValues.hobby[1] }
			${paramValues.hobby[2] }
			${paramValues.hobby[3] }
		</p>
		<p>거주지 : ${param.addr }</p>
		<p>애완동물(param) : ${param.ani }</p>
		<p>애완동물(paramValues) : 
			${paramValues.ani[0] }
			${paramValues.ani[1] }
			${paramValues.ani[2] }
			${paramValues.ani[3] }
		</p>
		<hr>
		<p>취미 출력2(\${paramValues["hobby"][0] }..) : 
			${paramValues["hobby"][0] }
			${paramValues["hobby"][1] }
			${paramValues["hobby"][2] }
			${paramValues["hobby"][3] }
		</p>
		<p>애완동물 출력2(\${paramValues["ani"][0] }..) :
			${paramValues["ani"][0] }
			${paramValues["ani"][1] }
			${paramValues["ani"][2] }
			${paramValues["ani"][3] }
		</p>
		<hr>
		<% pageContext.setAttribute("paramName", "ani"); %>
		<p>파라미터 값 출력 :
			${paramValues[paramName][0] }
			${paramValues[paramName][1] }
			${paramValues[paramName][2] }
			${paramValues[paramName][3] }
			
			${paramValues.paramName[0] }
		</p>
		
		
		
		
	</div>
	
</body>
</html>


















