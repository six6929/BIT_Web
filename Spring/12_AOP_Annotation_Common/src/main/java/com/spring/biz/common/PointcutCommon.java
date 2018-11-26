package com.spring.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class PointcutCommon {

	// 포인트컷설정
	@Pointcut("execution(* com.spring.biz..*Impl.*(..))")
	public void allPointcut() {
	}

	@Pointcut("execution(* com.spring.biz..*Impl.get*(..))")
	public void getPointcut() {
	}
}
