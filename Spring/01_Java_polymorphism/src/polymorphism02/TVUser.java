package polymorphism02;

public class TVUser {

	public static void main(String[] args) {
		//삼성 TV 사용
		//SamsungTV tv = new SamsungTV();
		
		//LgTV 사용
		TV tv = new LgTV();
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		

	}

}
