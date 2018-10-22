<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1. 넘겨받은 데이터(파리미터 값) 추출
	int coffee = Integer.parseInt(request.getParameter("coffee"));
	int quantity = Integer.parseInt(request.getParameter("su")); // 수량
	int intMoney = Integer.parseInt(request.getParameter("money")); //입금액
	
	//선택메뉴에 따른 단가 설정(커피종류, 단가확인)
	String coffeeName = "";
	int price = 0;
	int sumMoney = 0;
	int change = 0;
	
	sumMoney = price * quantity;
	change = intMoney - sumMoney;
	
	switch (coffee) {
	case 1 : coffeeName = "아메리카노"; price = 3000; break;
	case 2 : coffeeName = "카페모카"; price = 3500; break;
	case 3 : coffeeName = "에스프레소"; price = 2500; break;
	case 4 : coffeeName = "카페라떼"; price = 4000; break;
	}
	
	sumMoney = price * quantity;
	change = intMoney - sumMoney;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피주문 결과</title>
</head>
<body>
	<%-- 
	커피종류 : 커피명
	단가 : XXXX
	수량 : xx
	총금액 : XXXX (단가 * 수량)
	----------------------
	입금액 : ~~~
	잔돈 : 입금액 - 총금액
	 --%>
	<h2>주문 계산 결과</h2>
	<ul>
		<li>커피종류 : <%=coffeeName %></li>
		<li>단가 : <%=price %></li>
		<li>수량 : <%=quantity %></li>
		<li>총금액 : <%=sumMoney %></li>
		<p>---------------------------</p>
		<li>입금액 : <%=intMoney %></li>
		<li>잔돈 : <%=change %></li>

	</ul>
</body>
</html>