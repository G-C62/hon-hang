package com.honhang.model.follow;

import java.util.List;

public interface FollowDAO {
	public List selectFollowing(String user_id);
	public List selectFollower(String follow_user_id);	
	public String followingCount(String user_id);
	public String followerCount(String follow_user_id);
	public void insert(FollowVO follow);
	public void delete(FollowVO follow);	
}
