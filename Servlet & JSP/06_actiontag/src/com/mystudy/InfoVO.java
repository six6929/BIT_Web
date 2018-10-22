package com.mystudy;

public class InfoVO {
	private String name;
	private String age;
	
	//useBean 액션 태그 사용시 기본생성자 반드시 작성
	public InfoVO() {} 
	
	public InfoVO(String name, String age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "InfoVO [name=" + name + ", age=" + age + "]";
	}
	
}
