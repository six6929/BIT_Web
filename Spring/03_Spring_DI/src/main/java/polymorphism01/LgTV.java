package polymorphism01;

public class LgTV implements TV {
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
	}

	public void volumeDown() {
		System.out.println("LgTV - 소리 작게");
	}
	
	//--------------------------------------------
	public void initMethod() {
		System.out.println("LgTV2 - initMethod() 실행!!");
	}
	public void destroyMethod() {
		System.out.println("LgTV2 - destroyMethod() 실행!!");
	}
}
