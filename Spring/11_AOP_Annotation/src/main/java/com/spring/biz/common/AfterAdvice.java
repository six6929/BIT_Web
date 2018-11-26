package com.spring.biz.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service // 객체 생성
@Aspect
public class AfterAdvice {

	// 포인트컷설정
	@Pointcut("execution(* com.spring.biz..*Impl.*(..))")
	public void allPointcut() {
	}

	@Pointcut("execution(* com.spring.biz..*Impl.get*(..))")
	public void getPointcut() {
	}

	@After("getPointcut()")
	public void afterLog() {
		System.out.println("[사후처리-AfterAdvice.afterLog]" + "비즈니스 로직 수행후 로그(언제나)");
	}
}
