package com.spring.biz.user;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.BoardService;

public class UserServiceClient {
	public static void main(String[] args) {
		//1. 스프링컨테이너 가동
		AbstractApplicationContext container 
			= new GenericXmlApplicationContext("applicationContext.xml");
		
		//2. 필요한 객체 사용
		//Board 테이블에 데이터 입력,수정,삭제,조회
		UserService userService =
			(UserService) container.getBean("userService");
		
		//2-1. 조회
		UserVO vo = new UserVO();
		vo.setId("six6928");
		vo.setPw("12345");
		UserVO user = userService.getUser(vo);
		if(user != null) {
			System.out.println("[로그인성공]" + user.getName() + "님 환영합니다.");
		} else {
			System.out.println("[로그인실패]" +vo.getId() + "은 없는 아이디입니다.");
		}
		
		//2-2. 삽입
		/*vo.setId("six6928");
		vo.setPw("12345");
		vo.setName("신원호1");
		vo.setRole("Gag1");
		userService.InsertUser(vo);*/
		
		
		/*//2-3.
		vo.setName("신원호1");
		vo.setRole("Gag2");
		vo.setId("six6928");
		userService.UpdateUser(vo);*/
		
		//3.마무리
		container.close();
	}
}
