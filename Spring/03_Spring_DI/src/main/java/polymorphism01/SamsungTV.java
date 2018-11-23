package polymorphism01;

public class SamsungTV implements TV {
	private SonySpeaker speaker;
	
	public SamsungTV() {
		System.out.println(">>> SamsungTV 생성");
		//필드에 있는 SonySpeaker를 생성자에서 주입
		speaker = new SonySpeaker();
	}
	public void powerOn() {
		System.out.println("SamsungTV - 전원 On");
	}
	public void powerOff() {
		System.out.println("SamsungTV - 전원 Off");
	}
	public void volumeUp() {
		System.out.println("SamsungTV - 소리크게");
		speaker.volumnUp();
	}
	public void volumeDown() {
		System.out.println("SamsungTV - 소리낮게");
		speaker.volumnDown();
	}
	//--------------------------------------------
	public void initMethod() {
		System.out.println("SamsungTV - initMethod() 실행!!");
	}
	public void destroyMethod() {
		System.out.println("SamsungTV - destroyMethod() 실행!!");
	}
}
