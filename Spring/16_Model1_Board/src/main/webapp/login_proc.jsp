<%@page import="com.spring.biz.user.impl.UserDAO"%>
<%@page import="com.spring.biz.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- id, password ���� �޾Ƽ� DB�� �ִ��� Ȯ�� �� �α��� ó�� --%>
<%
	//1. ����ڰ� �Է��� ������(����) ����
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//2. DB����ó��(id, password ����Ȯ��)
	UserVO vo = new UserVO();
	vo.setId(id);
	vo.setPw(password);
	
	UserDAO userDAO = new UserDAO();
	UserVO user = userDAO.getUser(vo);
	
	//3. ȭ�� �׺���̼�(ȭ���̵�)
	if(user != null) { //����ڰ� �����ϴ� ���
		//System.out.println(vo.getId() + "�� ȯ���մϴ�");
		response.sendRedirect("getBoardList.jsp");
	} else { //����ڰ� ���� ���
		//System.out.println("ȸ�������� �����ϴ�.");
		response.sendRedirect("login.jsp");
	}
%>