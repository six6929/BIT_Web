package com.spring.biz.common;

public class AfterReturningAdvice {
	public void afterReturnLog() {
		System.out.println("[사후처리-AfterReturningAdvice.afterReturnLog]"
				+ "비즈니스 로직 정상수행 후 로그");
	}
}
