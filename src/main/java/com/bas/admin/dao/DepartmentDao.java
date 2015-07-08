package com.bas.admin.dao;

import java.util.List;

import com.bas.admin.dao.entity.DepartmentEntity;

/**
 * @author nagendra.yadav
*
 */
public interface DepartmentDao {
	
	public String addDepartment(DepartmentEntity departmentEntity);
	public String editDepartment(DepartmentEntity departmentEntity);
	public String deleteDepartment(int departmentId);
	public List<DepartmentEntity> findDepartments();
	public DepartmentEntity findDepartmentById(int deptId);
	public String updateDepartment(DepartmentEntity departmentEntity);

}
