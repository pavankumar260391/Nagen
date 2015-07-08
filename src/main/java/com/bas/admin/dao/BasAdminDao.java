package com.bas.admin.dao;

import java.util.Date;
import java.util.List;

import com.bas.admin.dao.entity.AdminSalaryMasterEntity;
import com.bas.employee.dao.entity.FaculityLeaveMasterEntity;
import com.bas.employee.dao.entity.FacultyAttendStatusEntity;
import com.bas.employee.dao.entity.FacultyEntity;
import com.bas.employee.dao.entity.FacultySalaryMasterEntity;
import com.bas.employee.web.controller.form.FaculityLeaveMasterVO;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

/**
 * 
 * @author Sid
 *
 */
public interface BasAdminDao {

	public List<AdminSalaryMasterEntity> findSalaryHistory(String empid);
	public List<FacultyEntity> findallSalInfo();
	public byte[] findEmpPhotoByEid(int eid);
	public List<AdminSalaryMasterEntity> findSpecificSal(String eid);
	public List<AdminSalaryMasterEntity> findWrkDays(String department,String value);

}
