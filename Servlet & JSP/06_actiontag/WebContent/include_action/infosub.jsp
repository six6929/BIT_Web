<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터 값 추출
	String type = request.getParameter("type");
%>

<br>
<table border="1" width="500px">
	<tr>
		<td>제품타입</td>
		<td><%=type %></td>
	</tr>
	<tr>
		<td>제품특징</td>
		<td>
<%
	if (type.equalsIgnoreCase("A")) {
		out.print("튼튼하고 단단한 재질");
	} else if (type.equalsIgnoreCase("B")) {
		out.print("세련된 디자인과 색상");
	}
%>	
		</td>		
	</tr>
</table>
