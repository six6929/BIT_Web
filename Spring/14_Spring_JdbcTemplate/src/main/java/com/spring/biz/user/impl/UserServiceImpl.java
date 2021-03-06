package com.spring.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	//private UserDAO userDAO;
	private UserDAOSpring userDAO;
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
	
	@Override
	public void InsertUser(UserVO vo) {
		userDAO.InsertUser(vo);
	}

	@Override
	public void UpdateUser(UserVO vo) {
		userDAO.UpdateUser(vo);
	}
	
	@Override
	public void DeleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}
	
	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}
	
}
