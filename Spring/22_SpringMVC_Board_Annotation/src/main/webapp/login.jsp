<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
<style>
#container {
	width: 700px;
	margin: 250px auto;
}

h1 {
	text-align: center;
}


table {
	border-collapse: collapse;
}

table, th, td {
	margin: auto;
}

.center {
	text-align: center;
}

input[type="text"], input[type="password"] {
	border: none;
}

input[type=submit] {
	border: none;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>
	<div id="container">
		<h1>로그인</h1>
		<hr>
		<form action="login.do" method="post">
			<table class="table table-bordered table-hover">
				<tr>
					<th class="table-danger">아이디</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th class="table-danger">패스워드</th>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td colspan="2" class="center"><input type="submit"
						value="로그인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>