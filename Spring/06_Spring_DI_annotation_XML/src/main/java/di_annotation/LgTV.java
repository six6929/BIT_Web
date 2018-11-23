package di_annotation;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component //이름지정 안하면 클래스명의 첫 글자 소문자인 이름사용
public class LgTV implements TV {
	//@Resource : @Autowired + @Qualifier
	//@Resource : name 속성 값 필수
	//@Resource(name="sony")
	@Autowired
	private Speaker speaker;
	
	public LgTV() {
		System.out.println(">>> LgTV 생성");
	}
	public void powerOn() {
		System.out.println("LgTV - 전원 ON");
	}

	public void powerOff() {
		System.out.println("LgTV - 전원 OFF");
	}

	public void volumeUp() {
		System.out.println("LgTV - 소리 크게");
		speaker.volumnUp();
	}

	public void volumeDown() {
		System.out.println("LgTV - 소리 작게");
		speaker.volumnDown();
	}
	
	//--------------------------------------------
	public void initMethod() {
		System.out.println("LgTV2 - initMethod() 실행!!");
	}
	public void destroyMethod() {
		System.out.println("LgTV2 - destroyMethod() 실행!!");
	}
}
