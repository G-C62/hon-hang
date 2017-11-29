package com.honhang.model.follow;

public class FollowVO {
	private String user_id;
	private String follow_user_id;
	
	public FollowVO(){
	}

	public FollowVO(String user_id, String follow_user_id) {
		super();
		this.user_id = user_id;
		this.follow_user_id = follow_user_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFollow_user_id() {
		return follow_user_id;
	}

	public void setFollow_user_id(String follow_user_id) {
		this.follow_user_id = follow_user_id;
	}
	
	
}
