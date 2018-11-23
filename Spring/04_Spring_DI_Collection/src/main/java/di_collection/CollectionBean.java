package di_collection;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class CollectionBean {
	// List타입
	private List<String> addressList;

	// Set타입
	private Set<String> addressSet;

	// Map타입 : key, value
	private Map<String, String> addressMap;

	// Properties 타입
	private Properties addressProps;

	public CollectionBean() {
		System.out.println("CollectionBean() - 객체생성");
	}

	// get,set List
	public List<String> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<String> addressList) {
		this.addressList = addressList;
	}

	// get,set Set
	public Set<String> getAddressSet() {
		return addressSet;
	}

	public void setAddressSet(Set<String> addressSet) {
		this.addressSet = addressSet;
	}

	// get,set Map
	public Map<String, String> getAddressMap() {
		return addressMap;
	}

	public void setAddressMap(Map<String, String> addressMap) {
		this.addressMap = addressMap;
	}

	// get, set Properties
	public Properties getAddressProps() {
		return addressProps;
	}

	public void setAddressProps(Properties addressProps) {
		this.addressProps = addressProps;
	}

}
