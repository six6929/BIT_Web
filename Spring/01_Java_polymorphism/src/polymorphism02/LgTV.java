package polymorphism02;

public class LgTV implements TV {
	
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
}
