package com.honhang.model.user;

import java.util.List;

public interface UserDAO {
	public void insertUser(UserVO user);
	public UserVO selectUser(String user_id);
//	public List selectAll();
}
