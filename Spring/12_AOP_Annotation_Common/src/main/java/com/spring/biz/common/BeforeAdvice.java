package com.spring.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service //객체 생성
@Aspect // 포인트컷 + 어드바이스
public class BeforeAdvice {
	
	//어드바이스에 동작시점 설정 + 적용한 포인트컷
	@Before("PointcutCommon.getPointcut()")
	public void beforeLog(JoinPoint jp) {//어드바이스 메소드
		String methodName = jp.getSignature().getName(); //실행될 메소드명
		Object[] args = jp.getArgs(); //메소드에 전달된 값. 매개변수(인자-argument, 파라미터-parameter)
		
		System.out.println("[사전처리] " + methodName + "() 메소드"
				+ ", args정보: " + args[0].toString());
		
	}
}
