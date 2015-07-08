package com.bas.admin.service;

import java.util.List;

import com.bas.admin.dao.entity.DepartmentEntity;
import com.bas.admin.web.controller.form.DepartmentForm;

/**
 * @author nagendra.yadav
*
 */
public interface DepartmentService {
	
	public String addDepartment(DepartmentForm departmentForm);
	public String editDepartment(DepartmentForm departmentForm);
	public String deleteDepartment(int departmentId);
	public List<DepartmentForm> findDepartments();
	public DepartmentForm findDepartmentById(int deptId);
	public String updateDepartment(DepartmentForm departmentForm);
}
