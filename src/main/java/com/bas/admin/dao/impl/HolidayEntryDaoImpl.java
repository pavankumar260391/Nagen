package com.bas.admin.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.bas.admin.dao.HolidayEntryDao;
import com.bas.admin.dao.entity.DesignationEntity;
import com.bas.admin.dao.entity.HolidayEntryEntity;

@Repository("HolidayEntryDaoImpl")
@Scope("singleton")
public class HolidayEntryDaoImpl extends JdbcDaoSupport implements
		HolidayEntryDao {
	@Autowired
	@Qualifier("sdatasource")
	public void setDataSourceInSuper(DataSource dataSource) {
		super.setDataSource(dataSource);
	}

	@Override
	public String addHolidayEntry(HolidayEntryEntity holidayEntryEntity) {
		String sql = "insert into holiday_entry_tbl values(?,?,?,?,?)";
		Object[] data = new Object[] { holidayEntryEntity.getHolidayDate(),
				holidayEntryEntity.getWorking(),
				holidayEntryEntity.getHoliday(),
				holidayEntryEntity.getWeekend(),
				holidayEntryEntity.getDescription() };
		// firing the query
		super.getJdbcTemplate().update(sql, data);
		return "Added";
	}

	@Override
	public String editHolidayEntry(HolidayEntryEntity holidayEntryEntity) {
		String query = "update holiday_entry_tbl set working=?,holiday=?,weekend=?, description=? where cdate=?";
		Object[] data = new Object[] {
				holidayEntryEntity.getWorking(),
				holidayEntryEntity.getHoliday(),
				holidayEntryEntity.getWeekend(),
				holidayEntryEntity.getDescription(),
				 holidayEntryEntity.getHolidayDate()};
		super.getJdbcTemplate().update(query, data);
		return "updated";

		
	}

	@Override
	public String deleteHolidayEntry(String date) {
		String query = "delete from holiday_entry_tbl where cdate=?";
		Object data[] = new Object[] { date };
		super.getJdbcTemplate().update(query, data);
		return "deleted";
	}

	@Override
	public List<HolidayEntryEntity> findHolidayEntry() {
		String query = "select cdate as holidayDate,working,holiday,weekend,description from holiday_entry_tbl";
		List<HolidayEntryEntity> holidayEntryEntities = super.getJdbcTemplate()
				.query(query,new BeanPropertyRowMapper(HolidayEntryEntity.class));
		return holidayEntryEntities;
	}

	@Override
	public HolidayEntryEntity findHolidayEntryByDate(String date) {
		String query = "select cdate as holidayDate, working,holiday,weekend,description from holiday_entry_tbl where cdate="+date;
		HolidayEntryEntity holidayEntryEntity = super.getJdbcTemplate()
				.queryForObject(query,
						new BeanPropertyRowMapper(HolidayEntryEntity.class));
		return holidayEntryEntity;
	}

}
