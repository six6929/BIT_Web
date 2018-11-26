package com.spring.biz.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service // 객체 생성
@Aspect
public class AfterAdvice {

	@After("PointcutCommon.getPointcut()")
	public void afterLog() {
		System.out.println("[사후처리-AfterAdvice.afterLog]" + "비즈니스 로직 수행후 로그(언제나)");
	}
}
