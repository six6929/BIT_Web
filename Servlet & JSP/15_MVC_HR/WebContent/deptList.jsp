<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서직원 목록</title>
</head>
<body>
	<h1>부서 직원 목록</h1>
	<div>
		<ul>
			<c:forEach var="e" items="${d_list }">
				<li>
					${e.employee_id }, ${e.first_name }, ${e.job_id }, ${e.department_id }
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>