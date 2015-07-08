package com.bas.admin.service;

import java.util.List;

import com.bas.admin.web.controller.form.FaculityAttendanceReportVO;
import com.bas.employee.web.controller.form.ManualAttendanceVO;

/**
 *
 * @author hiet
 *
 */
public interface AdminBasReportService {

	 public List<ManualAttendanceVO> findFaculityAttendanceForToday();
	 public List<FaculityAttendanceReportVO> findAllAttendanceByEmpId(int empid);
             
}
