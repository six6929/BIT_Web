<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
<style>
	#container {
		width : 700px;
		margin : auto;
	}
	
	h1 {
		text-align : center;
	}
	
	table {
		border-collapse: collapse;
	}
	
	table,th,td {
		border : 1px solid black;
		margin : 0 auto;
	}
	th {
		background-color : teal;
		color : white;
	}
	.center {
		text-align : center;
	}
</style>
</head>
<body>
	<div id="container">
		<h1>�α���</h1>
		<hr>
		<form action="login.do" method="post">
			<table>
				<tr>
					<th>���̵�</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>�н�����</th>
					<td><input type="text" name="password"></td>
				</tr>
				<tr>
					<td colspan="2" class="center"><input type="submit"
						value="�α���"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>