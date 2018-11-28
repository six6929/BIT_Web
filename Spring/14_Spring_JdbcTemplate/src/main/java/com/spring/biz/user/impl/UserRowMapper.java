package com.spring.biz.user.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.spring.biz.user.UserVO;

public class UserRowMapper implements RowMapper<UserVO>{

	@Override
	public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserVO uvo = new UserVO();
		uvo = new UserVO();
		uvo.setId(rs.getString("ID"));
		uvo.setPw(rs.getString("PASSWORD"));
		uvo.setName(rs.getString("NAME"));
		uvo.setRole(rs.getString("ROLE"));
		return uvo;
	}
	
}
