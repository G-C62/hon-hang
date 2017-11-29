package com.honhang.model.schedule;

import java.util.List;

public interface ScheduleDAO {
	public List selectAll(String user_id);
	public List selectCategory(int category_id);
	public ScheduleVO selectOne(int id);
	public void insert(ScheduleVO schedule);
	public void delete(ScheduleVO schedule);
	public void update(ScheduleVO schedule);
}
