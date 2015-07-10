package com.bas.employee.dao;

import java.util.Date;
import java.util.List;

import com.bas.admin.dao.entity.CategoryEntity;
import com.bas.employee.dao.entity.FaculityLeaveMasterEntity;
import com.bas.employee.dao.entity.FaculityTimeEntity;
import com.bas.employee.dao.entity.FacultyAttendStatusEntity;
import com.bas.employee.dao.entity.FacultyEntity;
import com.bas.employee.dao.entity.FacultySalaryMasterEntity;
import com.bas.employee.dao.entity.ManualAttendanceEntity;
import com.bas.employee.web.controller.form.FaculityLeaveMasterVO;
import com.bas.employee.web.controller.form.ManualAttendanceVO;

/**
 * 
 * @author sssss
 *
 */
public interface BasFacultyDao {
	public String persistFaculty(FacultyEntity facultyEntity);
	public String updateFaculty(FacultyEntity facultyEntity);
	public String deletetFaculty(String name);
	public FacultyEntity findFacultyByName(String name);
	public List<FacultyEntity> findAllFaculty();
	public byte[] findPhotoByName(String name);
	public FaculityLeaveMasterEntity findLeaveBalance(String empid);
	public List<FacultyAttendStatusEntity> findAttendStatus(String fid,int month);
	public List<FaculityLeaveMasterEntity> findLeaveHistory(String empid);
	public List<FacultySalaryMasterEntity> findSalaryHistory(String empid);
	public byte[] findPhotoByEmpName(String name);
	public String enterLeaveHistory(FaculityLeaveMasterVO faculityLeaveMasterVO);
	public List<FaculityLeaveMasterEntity> findAllLeaveHistory();
	public List<FaculityLeaveMasterEntity> findAllEmpDb();
	public String deleteLeaveHistory(String name, String date);
	public ManualAttendanceEntity findEmployeeDataForAttendance(String empid);
	public String addEmployeeManulAttendance(ManualAttendanceEntity manualAttendanceEntity);
	public List<FaculityLeaveMasterEntity> findAllPendingLeaveHistory();
	public void updateLeaveHistory(String empNo, String date, String lstatus);
	public List<FaculityLeaveMasterEntity> getReportingManagerList();
	public List<FaculityLeaveMasterEntity> getCCToList();
	public String enterRmLeaveHistory(FaculityLeaveMasterVO faculityLeaveMasterVO);
	public List<FaculityLeaveMasterEntity> findAllRmPendingLeaveHistory();
	public FaculityLeaveMasterEntity findLeaveAppData(String empid/*, String leaveMonth*/);
	public void addLeaveEntry(FaculityLeaveMasterEntity faculityLeaveMasterEntity);
	public String updateEmployee(FacultyAttendStatusEntity facultyAttendStatusEntity,
			String fid, String monthInfo);
	public String deleteAttendus(String employeeId, String attndDate);

}
