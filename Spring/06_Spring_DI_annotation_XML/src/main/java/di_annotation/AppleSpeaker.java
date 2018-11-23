package di_annotation;

import org.springframework.stereotype.Component;

//@Component 설정하면 객체 생성시 클래스명으로 객체 생성
//별도로 명칭 부여 가능
//@Component의 의미는
//<bean id="apple" class="di_annotation.AppleSpeaker"/>
//@Component("apple")
public class AppleSpeaker implements Speaker {
	public AppleSpeaker() {
		System.out.println("-->> AppleSpeaker - 생성");
	}

	public void volumnUp() {
		System.out.println("AppleSpeaker - 소리크게");
	}

	public void volumnDown() {
		System.out.println("AppleSpeaker - 소리작게");
	}
}
