package com.bas.employee.service;

import java.util.Date;
import java.util.List;

import com.bas.employee.web.controller.form.FaculityLeaveMasterVO;
import com.bas.employee.web.controller.form.FaculityTimeForm;
import com.bas.employee.web.controller.form.FacultyAttendStatusVO;
import com.bas.employee.web.controller.form.FacultyForm;
import com.bas.employee.web.controller.form.FacultySalaryMasterVO;
import com.bas.employee.web.controller.form.ManualAttendanceVO;

/**
 * 
 * @author Sid
 * 
 */
public interface BasFacultyService {
	public String persistFaculty(FacultyForm facultyForm);

	public String updateFaculty(FacultyForm facultyForm);

	public String deletetFaculty(String name);

	public FacultyForm findFacultyByName(String name);

	public List<FacultyForm> findAllFaculty();

	public byte[] findPhotoByName(String name);

	public FaculityLeaveMasterVO findLeaveBalance(String empid);

	public List<FaculityLeaveMasterVO> findLeaveHistory(String empid);

	public List<FacultyAttendStatusVO> findAttendStatus(String fid,int month);

	public List<FacultySalaryMasterVO> findSalaryHistory(String empid);

	public ManualAttendanceVO findEmployeeDataForAttendance(String empid);
	
	public String addEmployeeManulAttendance(ManualAttendanceVO manualAttendanceVO);

	public byte[] findEmpPhotoByName(String name);

	public String enterLeaveHistory(FaculityLeaveMasterVO faculityLeaveMasterVO);

	public List<FaculityLeaveMasterVO> findAllLeaveHistory();

	public List<FaculityLeaveMasterVO> findAllEmpDb();

	String deleteLeaveHistory(String name, String date);

	public List<FaculityLeaveMasterVO> findAllPendingLeaveHistory();

	void updateLeaveHistory(String empNo, String date, String lstatus);

	public List<FaculityLeaveMasterVO> getReportingManagerList();

	public List<FaculityLeaveMasterVO> getCCToList();

	public String enterRmLeaveHistory(FaculityLeaveMasterVO faculityLeaveMasterVO);

	public List<FaculityLeaveMasterVO> findAllRmPendingLeaveHistory();

	public FaculityLeaveMasterVO findLeaveAppData(String empid/*, String leaveMonth*/);

	public void addLeaveEntry(FaculityLeaveMasterVO faculityLeaveMasterVO);

	public String updateEmployee(FacultyAttendStatusVO dfaAttendStatusVO, String fid,
			String monthInfo);

	public String deleteAttendus(String employeeId, String attndDate);

//	public FaculityLeaveMasterVO findLeavesAppData(String string);
	
	

}
