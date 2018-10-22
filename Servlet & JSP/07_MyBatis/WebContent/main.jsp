<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script>
	function sel_all(frm) {
		frm.action = "selectAll.jsp"; //전체 데이타 검색
		frm.submit();
	}
	function sel_one(frm) {
		frm.action = "selectOne.jsp";//ID값으로 검색
		frm.submit();
	}
	function add_go(frm) {
		//ID는 필수 입력
		if (frm.id.value.trim() == "") {
			alert("아이디(ID)는 필수 입력항목입니다.\n 입력하세요.")
			frm.id.value = "";
			frm.id.focus();
			return false;
		}
		frm.action = "insertMember.jsp"; //입력
		frm.submit();
	}	
	function del_go(frm) {
		//ID는 필수 입력
		if (frm.id.value.trim() == "") {
			alert("삭제할 아이디(ID) 입력하세요.")
			frm.id.value = "";
			frm.id.focus();
			return false;
		}
		
		frm.action = "deleteMember.jsp"; //삭제
		frm.submit();
	}
</script>
</head>
<body>
<form>
	<table border="1">
	<thead>
		<tr><th colspan="2">회원 정보</th></tr>
	</thead>
	<tbody>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="number" name="age" value="0"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address"></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2">
				<input type="button" value="전체검색" onclick="sel_all(this.form)">
				<input type="button" value="검색(ID)" onclick="sel_one(this.form)">
				<input type="button" value="입력" onclick="add_go(this.form)">
				<input type="button" value="삭제(ID)" onclick="del_go(this.form)">
				<input type="reset" value="취소">
			</td>
		</tr>
	</tfoot>	
	</table>
</form>
<br>
<hr>
</body>
</html>