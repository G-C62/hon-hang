package com.honhang.model.schedule;

import java.util.Date;

public class ScheduleVO {
	private int id;
	private String user_id;
	private int category_id;
	private String title;
	private String content;
	private Date registDate;
	private int count;
	private int clickCount;

	// default 생성자
	public ScheduleVO() {
	}

	public ScheduleVO(int id, String user_id, int category_id, String title, String content,
			Date registDate, int count, int clickCount) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.category_id = category_id;
		this.title = title;
		this.content = content;
		this.registDate = registDate;
		this.count = count;
		this.clickCount = clickCount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

}
