package com.spring.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StopWatch;

public class AroundAdvice {
	/*
	 * public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable { //핵심메소드
	 * 실행전 System.out.println("[Around BEFORE] 비즈니스 메소드 실행전 시키기"); Object returnObj
	 * = pjp.proceed(); //실행할 메소드 동작 시키기
	 * 
	 * //핵심메소드 실행 후 System.out.println("[Around AFTER] 비즈니스 메소드 실행후 시키기"); return
	 * returnObj; }
	 */

	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		String methodName = pjp.getSignature().getName();

		StopWatch stopWatch = new StopWatch();
		stopWatch.start();

		// 핵심메소드 실행전
		System.out.println("[Around BEFORE] 비즈니스 메소드 실행전 시키기");
		Object returnObj = pjp.proceed(); // 실행할 메소드 동작 시키기

		// 핵심메소드 실행 후
		System.out.println("[Around AFTER] 비즈니스 메소드 실행후 시키기");
		stopWatch.stop();
		System.out.println("[around] + " + methodName + "()메소드" + ", 실행시간 : " + stopWatch.getTotalTimeMillis() + "초(ms)");
		return returnObj;
	}
}
