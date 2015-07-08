package com.bas.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bas.admin.dao.AdminBasReportDao;
import com.bas.admin.service.AdminBasReportService;
import com.bas.admin.web.controller.form.FaculityAttendanceReportVO;
import com.bas.employee.web.controller.form.ManualAttendanceVO;

/**
 * 
 * @author hiet
 * 
 */
@Transactional
@Service("AdminBasReportServiceImpl")
public class AdminBasReportServiceImpl implements AdminBasReportService {

	@Autowired
	@Qualifier("AdminBasReportDaoImpl")
	private AdminBasReportDao adminBasReportDao;

	@Override
	public List<ManualAttendanceVO> findFaculityAttendanceForToday() {
		return adminBasReportDao.findFaculityAttendanceForToday();
	}

	@Override
	public List<FaculityAttendanceReportVO> findAllAttendanceByEmpId(int empid) {
		return adminBasReportDao.findAllAttendanceByEmpId(empid);
	}
	
}
