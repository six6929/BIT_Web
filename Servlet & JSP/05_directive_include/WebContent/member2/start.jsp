<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script>
	function sel_all(frm) {
		frm.action = "selectAll.jsp";
		frm.submit();
	}
	
	function sel_one(frm) {
		frm.action = "selectOneID.jsp"; //ID값으로 검색
		frm.submit();
	}
	
	function add_go(frm) {
		
		if(frm.id.value.trim() == "") {
			alert("아이디(ID)는 필수항목입니다.\n입력하세요.");
			frm.id.value = "";
			frm.id.focus();
			return false;
			
		}
		
		if(frm.pw.value.trim() == "") {
			alert("패스워드(pw)는 필수항목입니다.\n입력하세요");
			frm.pw.value = "";
			frm.pw.focus();
			return false;
		}
		
		frm.action = "insertMember.jsp"; //입력
		frm.submit();
	}
	
	function del_go(frm) {
		
		if(frm.id.value.trim() == "") {
			alert("삭제할 아이디(ID) 입력하세요.");
			frm.id.value = "";
			frm.id.focus();
			return false;
		}
		frm.action = "deleteMember.jsp"; //삭제(ID)
		frm.submit();
	}
	

</script>
</head>
<body>
	<form>
		<table border="1">
			<thead>
				<tr><th colspan="2">회원정보</th></tr>
			</thead>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="전체검색" onclick="sel_all(this.form)">
						<input type="button" value="검색(ID)" onclick="sel_one(this.form)">
						<input type="button" value="입력" onclick="add_go(this.form)"> 
						<input type="button" value="삭제(ID)" onclick="del_go(this.form)">
						<input type="reset" value="초기화">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>