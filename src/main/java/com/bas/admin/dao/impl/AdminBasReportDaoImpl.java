package com.bas.admin.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.bas.admin.dao.AdminBasReportDao;
import com.bas.admin.web.controller.form.FaculityAttendanceReportVO;
import com.bas.common.util.DateUtils;
import com.bas.employee.web.controller.form.ManualAttendanceVO;

@Repository("AdminBasReportDaoImpl")
public class AdminBasReportDaoImpl extends JdbcDaoSupport implements AdminBasReportDao {

	@Autowired
	@Qualifier("sdatasource")
	public void setDataSourceInSuper(DataSource dataSource) {
		super.setDataSource(dataSource);
	}
	
    @Override
    public List<ManualAttendanceVO> findFaculityAttendanceForToday(){
    	String currentDate=DateUtils.getCurrentCalendarDate();
    	//String dquery="select  f.id as eid,f.name,f.department,f.designation,cdate,s.detail,s.intime,s.intimestatus,s.outtime,s.outtimestatus  from emp_db as f,faculity_att_tab as s where f.id=s.fid and cdate='+2013-09-20'";
    	String dquery="select  f.id as eid,f.name,f.department,f.designation,cdate,s.detail,s.intime,s.intimestatus,s.outtime,s.outtimestatus  from emp_db as f,faculity_att_tab as s where f.id=s.fid and cdate='"+currentDate+"'";
    	 List<ManualAttendanceVO> manualAttendanceVOs=getJdbcTemplate().query(dquery,new BeanPropertyRowMapper<ManualAttendanceVO>(ManualAttendanceVO.class));
        return manualAttendanceVOs;
    }

	@Override
	public List<FaculityAttendanceReportVO> findAllAttendanceByEmpId(int empid) {
		 String dquery="select s.cdate,s.intime,s.intimestatus,s.outtime,s.outtimestatus,s.status,s.detail  from faculity_att_tab as s   where s.fid="+empid+"  order by s.cdate asc";
		 List<FaculityAttendanceReportVO> employeeAttendanceSummaryVOs=getJdbcTemplate().query(dquery,new BeanPropertyRowMapper<FaculityAttendanceReportVO>(FaculityAttendanceReportVO.class));
		 return employeeAttendanceSummaryVOs;
	}

}
