<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON 데이타 요청 처리</title>
</head>
<body>
	<h1>JSON 데이타 요청 처리</h1>
	
<script>
	//1. 객체생성(XMLHttpRequest)
	var request = new XMLHttpRequest();
	
	//결과 처리
	request.onreadystatechange = function(){
		//데이타를 모두 받고, 정상 처리된 경우
		if (request.readyState == 4 && request.status == 200) {
			//받은 데이타에 대한 처리
			//eval(내용) : 내용을 자바스크립트 형식으로 변경처리
			//보안취약점 : 전달값에 JavaScript 코드를 삽입해서 공격하는 경우
			//var json = eval('(' + request.responseText + ')');
			
			//JSON.parse 사용이 안전함
			var json = JSON.parse(request.responseText);
			alert("json: " + json);
			
			var output = "";
			for (var i=0; i<json.length; i++) {
				output += "<p>";
				for (var key in json[i]) {
					alert("key: " + key 
							+ ", json[i][key]: " + json[i][key]);
					output += json[i][key] + ", "
				}
				
				output += "</p>";
			}
			document.body.innerHTML += output;
		}
	};
	
	//2. open
	request.open("GET", "data.json", true);
	
	//3. send() : 실행
	request.send();
	
</script>	

</body>
</html>








