<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동적 검색 결과</title>
</head>
<body>

	<h1>동적검색 (${title }) 결과(searchList.jsp)</h1>
	<div>
		<ul>
			<c:forEach var="e" items="${list }">
				<li>
					${e.employee_id }, ${e.first_name }, ${e.last_name },${e.job_id }, ${e.department_id }
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>