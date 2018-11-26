package com.spring.biz.common;

import org.aspectj.lang.JoinPoint;

public class BeforeAdvice {
//	public void beforeLog() {
//		System.out.println("[사전처리-BeforeAdvice.beforeLog]"
//				+ "비즈니스 로직 수행전 로그");
//		
//	}
	
	public void beforeLog(JoinPoint jp) {
		String methodName = jp.getSignature().getName(); //실행될 메소드명
		Object[] args = jp.getArgs(); //메소드에 전달된 값. 매개변수(인자-argument, 파라미터-parameter)
		
		System.out.println("[사전처리] " + methodName + "() 메소드"
				+ ", args정보: " + args[0].toString());
		
	}
}
