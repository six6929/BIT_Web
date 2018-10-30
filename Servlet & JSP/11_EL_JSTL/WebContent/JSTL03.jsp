<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="com.bc.vo.GuestDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 반복문</title>
</head>
<body>
	<h2>객체에 값 설정(VO 객체)</h2>
	<jsp:useBean id="person" class="com.bc.vo.PersonVO"/>
	<c:set target="${person }" property="name" value="홍길동"/>
	<c:set target="${person }" property="age" value="27"/>
	
	<p>person : <c:out value="${person }"/></p>
	<p>person.name : 
		<c:out value="${person.name }" default="이름없음"/>
	</p>
	<p>person.age : ${person.age }</p>
	<p>person.gender : ${person.gender }</p>
	<p>person.gender : 
		<c:out value="${person.gender }" default="설정값없음"/>
	</p>
	<hr><hr>
	
	<h1>JSTL : forEach 반복문</h1>
	<h2>Array 출력</h2>
	<p>출력대상 : {"a", "ab", "abc", "abcd"}</p>
	<%
	String[] strs = {"a", "ab", "abc", "abcd"};
	pageContext.setAttribute("arr", strs);
	%>
	<c:forEach var="str" items="${arr }">
		<p>${str }</p>
	</c:forEach>
	<hr>
	
	<h3>배열의 일부 값만 출력(2, 3번째 데이타 : 1,2번 인덱스)</h3>
	<ul>
		<c:forEach var="str" items="${arr }" begin="1" end="2">
			<li>${str }</li>
		</c:forEach>
	</ul>
	<hr><hr>
	
	<%-- ======================= --%>
	<h2>ArrayList 출력</h2>
	<%
	ArrayList<Integer> list = new ArrayList<>();
	list.add(123);
	list.add(45);
	list.add(678);
	list.add(90);
	pageContext.setAttribute("alist", list);
	%>
	<ul>
		<c:forEach items="${alist }" var="listItem">
			<li>${listItem }</li>
		</c:forEach>
	</ul>
	<hr><hr>
	
	<%-- ================================ --%>
	<h2>Bean 객체 출력</h2>
	<%
	ArrayList<GuestDTO> listBean = new ArrayList<>();
	listBean.add(new GuestDTO(1111, "admin", new Date(), 1000));
	listBean.add(new GuestDTO(2222, "root", new Date(), 2000));
	listBean.add(new GuestDTO(3333, "guest", new Date(), 3000));
	listBean.add(new GuestDTO(4444, null, new Date(), 4000));
	
	pageContext.setAttribute("alistBean", listBean);
	%>
	<ul>
		<c:forEach var="bean" items="${alistBean }">
			<li>
				${bean.sabun },
				${bean.name },
				${bean.nalja },
				${bean.pay }
				---
				${bean.getPay() }
			</li>
		</c:forEach>
	</ul>
	<hr><hr>
	
	<%--================================== --%>
	<h2>Map 데이타 조회</h2>
	<%
	HashMap<String, String> map = new HashMap<>();
	map.put("k1", "a");
	map.put("k2", "ab");
	map.put("k3", "abc");
	map.put("k4", "abcd");
	pageContext.setAttribute("hmap", map);
	%>
	<c:forEach var="map" items="${hmap }">
		<p>${map.key } - ${map.value }</p>
	</c:forEach>
	<hr><hr>
	
	<%-- ====================================== --%>
	<h2>forEach 속성값 조회(varStatus: count, index, first, last)</h2>
	<c:forEach var="listItem" items="${alist }">
		${listItem }, 
	</c:forEach>
	
	<%-- 123, 45, 678, 90 --%>
	<c:forEach var="listItem" items="${alist }"
			begin="1" end="10" step="2"
			varStatus="status">
		<p>
		var="listItem" 값 : ${listItem }<br>
		current : ${status.current }<br>
		count : ${status.count }<br><%--처리되는 데이타 건수 --%>
		index : ${status.index }<br><%--데이타 인덱스값 --%>
		first : ${status.first }<br><%--첫번째 데이타 여부(true/false) --%>	
		last : ${status.last }<br><%--마지막 데이타 여부(true/false) --%>
		
		begin : ${status.begin }<br><%--begin 속성값 --%>	
		end : ${status.end }<br><%--end 속성값 --%>	
		step : ${status.step }<br><%--step 속성값 --%>	
		</p>
	</c:forEach>
	
	
	<br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br>
</body>
</html>










