<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaScript Ajax</title>
</head>
<body>
	<script>
		//JavaScript에서 Ajax를 사용할 때 XMLHttpRequest 사용
		//1. XMLHttpRequest 객체 생성
		var request = new XMLHttpRequest();
		
		//XMLHttpRequest.readyState : 데이터 전달 결과 상태를 표시
		//0 : 객체 생성, open 안 한 상태
		//1 : open 상태, send 안 한 상태
		//2 : send 한 상태, 데이터가 발견되지 않은 상태
		//3 : 일부 데이터만 받은 경우(데이터를 받는 중)
		//4 : 데이터를 전부 받음
		
		//XMLHttpRequest.status
		//200(성공), 4xx(클라이언트 오류), 5xx(서버 오류 - 개발자 실수)
		var cnt = 1;
		request.onreadystatechange = function() {
				if(request.readyState == 4 && request.status == 200) {
				//4. 응답 데이터 처리 (서버쪽으로부터 전달받은 데이터 처리)	
				document.body.innerHTML == request.responseText;
			}
					
		};
		
		
		//2. open("전송방식", "요청정보", "비동기여부")
		request.open("GET", "data.html", false);
	
		
		//3. send() : 실행
		request.send();
	
		//4. 응답 데이터 처리(서버쪽으로부터 전달받은 데이터 처리)
		alert("request.responseText : \n" + request.responseText);
		document.body.innerHTML += request.responseText;
		
	</script>
</body>
</html>