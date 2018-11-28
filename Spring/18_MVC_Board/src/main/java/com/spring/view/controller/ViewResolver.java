package com.spring.view.controller;

//ViewResolver 클래스는 Controller가 리턴한 View 이름에
//접두어(prefix - 파일위치)와 접미어(suffix - 파일속성)를 결합해서
//응답 처리할 파일의 위치와 속성값을 붙여서 응답할 정보로 리턴
//DispatcherServlet 최초 구동시에 ViewResolver 객체 생성
public class ViewResolver {
	private String prefix;
	private String suffix;
	
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	
	//완성된 ViewName을 리턴하는 메소드
	//prefix : "./", suffix : ".jsp"
	//login.jsp : 입력값 login -->  "./" + "login" + ".jsp"
	public String getView(String viewName) {
		return prefix + viewName + suffix;
	}
	
}
