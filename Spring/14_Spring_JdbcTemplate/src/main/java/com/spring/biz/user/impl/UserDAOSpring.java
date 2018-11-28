package com.spring.biz.user.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.spring.biz.common.JDBCUtil;
import com.spring.biz.user.UserVO;

@Repository("userDAOSpring")
public class UserDAOSpring {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String USER_GET
		= "SELECT * FROM USERS WHERE ID = ? AND PASSWORD = ?";
	
	private final String USER_INSERT
		= "INSERT INTO USERS(ID, PASSWORD, NAME, ROLE) "
		+ "			  VALUES(?, ?, ?, ?) ";
	
	private final String USER_UPDATE
		= "UPDATE USERS "
		+ "SET NAME = ?, ROLE = ? WHERE ID = ? ";
	
	private final String USER_DELETE
		= "DELETE FROM USERS WHERE ID = ?";
	
	private final String USER_LIST
		= "SELECT * FROM USERS ";
	
	//유저찾기
	public UserVO getUser(UserVO vo) {
		System.out.println("객체 생성");
		Object[] args = {vo.getId(), vo.getPw()};
		return jdbcTemplate.queryForObject(USER_GET, args ,new UserRowMapper());
	}
	
	//입력
	public void InsertUser(UserVO vo) {
		jdbcTemplate.update(USER_INSERT, vo.getId(), vo.getPw(), vo.getName(), vo.getRole());
	}
	
	public void UpdateUser(UserVO vo) {
		jdbcTemplate.update(USER_UPDATE, vo.getName(), vo.getRole(), vo.getId());
		
	}

	public void deleteUser(UserVO vo) {
		jdbcTemplate.update(USER_DELETE, vo.getId());
	}
	
	public List<UserVO> getUserList(UserVO vo) {
		return jdbcTemplate.query(USER_LIST, new UserRowMapper());
	}
}
