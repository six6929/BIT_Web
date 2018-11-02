<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XML 데이타 요청 처리</title>
</head>
<body>
	<h1>XML 데이타 요청 처리</h1>
	
<script>
	//1. 객체생성(XMLHttpRequest)
	var request = new XMLHttpRequest();
	
	//결과 처리
	request.onreadystatechange = function(){
		//데이타를 모두 받고, 정상 처리된 경우
		if (request.readyState == 4 && request.status == 200) {
			//XML데이타를 받았을 때 처리
			//파싱(자료를 분석하고 해체해서 원하는 자료로 변경)
			//XML 자료를 HTML형태로 변경(DOM 방식)
			var xml = request.responseXML;
			alert("xml : " + xml);
			var names = xml.getElementsByTagName("name");
			var prices = xml.getElementsByTagName("price");
			
			for (var i=0; i<names.length; i++) {
				var name = names[i].childNodes[0].nodeValue;
				var price = prices[i].childNodes[0].nodeValue;
				
				document.body.innerHTML 
					+= "<h2>"+ name +" : "+ price +"</h2>";
			}
			
		}
	};
	
	//2. open
	request.open("GET", "data.xml", true);
	
	//3. send() : 실행
	request.send();
	
</script>	

</body>
</html>
</body>
</html>