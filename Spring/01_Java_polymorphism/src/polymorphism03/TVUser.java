package polymorphism03;

public class TVUser {

	public static void main(String[] args) {
		BeanFactory factory = new BeanFactory();
		
		//삼성 또는 엘지 TV 사용
		//TV tv = (TV) factory.getBean("samsung");
		//TV tv = (TV) factory.getBean("lg");
		
		TV tv = (TV) factory.getBean(args[0]);
		
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		

	}

}
