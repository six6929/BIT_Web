package com.spring.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import com.spring.biz.user.UserVO;

@Service // 객체 생성
@Aspect
public class AfterReturningAdvice {

	// 포인트컷설정
	@Pointcut("execution(* com.spring.biz..*Impl.get*(..))")
	public void getPointcut() {
	}
	
	@AfterReturning(pointcut="getPointcut()", returning="returnObj")
	// returnObj 추가 바인드 변수 사용시에는 스프링 설정파일에 추가
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

		System.out.println("[사후처리]" + methodName + "메소드" + ", 리턴값: " + returnObj.toString());
	}

}
