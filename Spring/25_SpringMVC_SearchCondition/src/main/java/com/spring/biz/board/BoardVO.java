package com.spring.biz.board;

import java.sql.Date;

/*
	CREATE TABLE BOARD (
		SEQ NUMBER(5) PRIMARY KEY,
		TITLE VARCHAR2(200),
		WRITER VARCHAR2(20),
		CONTENT VARCHAR2(2000),
		REGDATE DATE DEFAULT SYSDATE,
		CNT NUMBER(5) DEFAULT 0
	);
*/

//검색조건용 필드 추가
public class BoardVO {
	//필드선언
	private int seq;
	private String title;
	private String writer;
	private String Content;
	private Date regdate;
	private int cnt;
	
	//검색조건용 필드 추가
	private String searchCondition;
	private String searchKeyword;
	
	//get,set 메소드
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	//toString 호출
	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", title=" + title + ", writer=" + writer + ", Content=" + Content + ", regdate="
				+ regdate + ", cnt=" + cnt + "]";
	}

}


