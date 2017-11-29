package com.honhang.model.follow;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class FollowDAOImpl implements FollowDAO{
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List selectFollowing(String user_id) {
		return sqlSessionTemplate.selectList("Follow.selectFollowing", user_id);
	}
	
	@Override
	public List selectFollower(String follow_user_id) {
		return sqlSessionTemplate.selectList("Follow.selectFollower", follow_user_id);
	}	

	@Override
	public String followingCount(String user_id) {
		return sqlSessionTemplate.selectOne("Follow.followingCount", user_id);
	}

	@Override
	public String followerCount(String follow_user_id) {
		return sqlSessionTemplate.selectOne("Follow.followerCount", follow_user_id);
	}
	
	@Override
	public void insert(FollowVO follow) {
		sqlSessionTemplate.insert("Follow.insert", follow);
	}

	@Override
	public void delete(FollowVO follow) {
		sqlSessionTemplate.insert("Follow.delete", follow);		
	}
}
