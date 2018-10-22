package com.bc.mybatis;

public class GuestBookVO {
	//변수선언
	private String name, subject, content, email, pwd, idx, regdate;

	//생성자 호출
	public GuestBookVO() {
		
	}
	
	public GuestBookVO(String name, String subject, String content, String email, String pwd, String idx,
			String regdate) {
		super();
		this.name = name;
		this.subject = subject;
		this.content = content;
		this.email = email;
		this.pwd = pwd;
		this.idx = idx;
		this.regdate = regdate;
	}

	//get,set 선언
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	//toString 선언
	@Override
	public String toString() {
		return "GuestBookVO [name=" + name + ", subject=" + subject + ", content=" + content + ", email=" + email
				+ ", pwd=" + pwd + ", idx=" + idx + ", regdate=" + regdate + "]";
	}
	
	
}
