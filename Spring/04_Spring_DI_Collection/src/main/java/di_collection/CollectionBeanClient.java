package di_collection;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanClient {

	public static void main(String[] args) {
		// 1. 스프링컨테이너 구동
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");

		// 2. 필요객체 사용
		System.out.println("--- List 타입 ---");
		CollectionBean bean = (CollectionBean) factory.getBean("collectionBean");
		List<String> addressList = bean.getAddressList();
		for (String address : addressList) {
			System.out.println("address : " + address);
		}

		System.out.println("-----------------------------------");
		
		System.out.println("--- Set 타입 ---");
		Set<String> addressSet = bean.getAddressSet();
		System.out.println("addressSet : " + addressSet);
		
		System.out.println("-----------------------------------");
		
		System.out.println("--- Map 타입 ---");
		Map<String, String> addressMap = bean.getAddressMap();
		System.out.println("addressMap : " + addressMap);
		
		System.out.println("-----------------------------------");
		
		System.out.println("--- Properties 타입 ---");
		Properties addressProp = bean.getAddressProps();
		System.out.println("addressProp : " + addressProp);
		// 3. 컨테이너 종료
		factory.close();

	}
}
