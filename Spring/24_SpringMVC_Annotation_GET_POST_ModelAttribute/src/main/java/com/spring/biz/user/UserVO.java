package com.spring.biz.user;

/*	CREATE TABLE USERS (
		ID VARCHAR2(8) PRIMARY KEY,
		PASSWORD VARCHAR2(8),
		NAME VARCHAR2(20),
		ROLE VARCHAR2(5)
	);*/
public class UserVO {
	//변수선언
	private String id;
	private String pw;
	private String name;
	private String role;
	
	//get,set 선언
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	//toString 선언
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", name=" + name + ", role=" + role + "]";
	}
	
}
