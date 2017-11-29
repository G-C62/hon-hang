package com.honhang.model.schedule;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ScheduleDAOImpl implements ScheduleDAO{

	private SqlSessionTemplate sqlSessionTemplate; 
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List selectAll(String user_id) {
		return sqlSessionTemplate.selectList("Schedule.selectAll",user_id);
	}

	@Override
	public List selectCategory(int category_id) {
		return sqlSessionTemplate.selectList("Schedule.selectCategory",category_id);
	}

	@Override
	public ScheduleVO selectOne(int id) {
		return sqlSessionTemplate.selectOne("Schedule.selectOne", id);
	}

	@Override
	public void insert(ScheduleVO schedule) {
		sqlSessionTemplate.insert("Schedule.insert", schedule);
	}

	@Override
	public void delete(ScheduleVO schedule) {
		sqlSessionTemplate.delete("Schedule.delete", schedule);
	}

	@Override
	public void update(ScheduleVO schedule) {
		sqlSessionTemplate.update("Schedule.update", schedule);
	}
	
}
