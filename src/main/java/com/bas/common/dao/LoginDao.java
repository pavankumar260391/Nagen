package com.bas.common.dao;

import com.bas.employee.dao.entity.LoginEntity;

public interface LoginDao {
	
	public LoginEntity validateUser(String username,String password);

}
