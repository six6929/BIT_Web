package com.spring.biz.user;

import java.util.List;

public interface UserService {
	UserVO getUser(UserVO vo);

	void InsertUser(UserVO vo);
	
	void UpdateUser(UserVO vo);

	void DeleteUser(UserVO vo);
	
	List<UserVO> getUserList(UserVO vo);
}
