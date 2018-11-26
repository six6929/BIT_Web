package com.spring.biz.common;

import org.aspectj.lang.JoinPoint;

import com.spring.biz.user.UserVO;

public class AfterReturningAdvice {
	/*
	public void afterReturnLog() {
		System.out.println("[사후처리-AfterReturningAdvice.afterReturnLog]"
				+ "비즈니스 로직 정상수행 후 로그");
	}
	*/
	
	//returnObj 추가 바인드 변수 사용시에는 스프링 설정파일에 추가
	public void afterReturnLog(JoinPoint jp, Object returnObj) {
		String methodName = jp.getSignature().getName();
		
		if (returnObj != null && returnObj instanceof UserVO) {
			UserVO vo = (UserVO) returnObj;
			if (vo.getRole().equalsIgnoreCase("Admin")) {
				System.out.println(vo.getName() + " 로그인(Admin)");
			} else {
				System.out.println(vo.getName() + " 로그인");
			}
		}
		
		System.out.println("[사후처리]"
				+ methodName + "메소드"
				+ ", 리턴값: " + returnObj.toString());
	}
	
}
