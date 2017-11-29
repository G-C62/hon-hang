package com.honhang.model.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class UserDAOImpl implements UserDAO {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public void insertUser(UserVO user) {
		sqlSessionTemplate.insert("User.insert", user);
	}

	@Override
	public UserVO selectUser(String user_id) {
		return sqlSessionTemplate.selectOne("User.selectOne", user_id);
	}

	/*@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("User.selectAll");
	}*/
}
