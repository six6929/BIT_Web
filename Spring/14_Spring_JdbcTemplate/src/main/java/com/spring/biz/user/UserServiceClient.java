package com.spring.biz.user;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

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
		vo.setId("rhd1104");
		vo.setPw("1234");
		UserVO user = userService.getUser(vo);
		if(user != null) {
			System.out.println("[로그인성공]" + user.getName() + "님 환영합니다.");
		} else {
			System.out.println("[로그인실패]" +vo.getId() + "은 없는 아이디입니다.");
		}
		
		//2-2. 삽입
		/*vo.setId("rhd1104");
		vo.setPw("1234");
		vo.setName("신원호");
		vo.setRole("SW");
		userService.InsertUser(vo);*/
		
		
		//2-3. 수정
		/*//수정할 내용
		vo.setName("조재민");
		vo.setRole("Kor");
		
		//수정할 아이디
		vo.setId("test");
		userService.UpdateUser(vo);*/
		
		//2-4. 삭제 
		/*vo.setId("six6928");
		userService.DeleteUser(vo);*/
		
		//2-5. 전체 User 조회
		List<UserVO> userList = userService.getUserList(vo);
		for(UserVO uvo : userList) {
			System.out.println(uvo.toString());
		}
		
		
		//3.마무리
		container.close();
	}
}
