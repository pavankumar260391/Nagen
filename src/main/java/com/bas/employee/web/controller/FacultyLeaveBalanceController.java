package com.bas.employee.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bas.common.constant.NavigationConstant;
import com.bas.employee.service.BasFacultyService;
import com.bas.employee.web.controller.form.FaculityLeaveMasterVO;
import com.bas.employee.web.controller.form.LoginForm;

@Controller
public class FacultyLeaveBalanceController {
	
	@Autowired
	@Qualifier("BasFacultyServiceImpl")
	private BasFacultyService basFacultyService;

	@RequestMapping(value="/leaveBalance",method=RequestMethod.GET)
	public String showLeaveBalance(Model model,HttpSession session) {
		LoginForm loginForm=(LoginForm)session.getAttribute(NavigationConstant.USER_SESSION_DATA);
	//	FaculityLeaveMasterVO faculityLeaveMasterVO=basFacultyService.findLeaveBalance(loginForm.getEid());
		FaculityLeaveMasterVO faculityLeaveMasterVO=basFacultyService.findLeaveBalance("555");
		model.addAttribute("faculityLeaveMasterVO", faculityLeaveMasterVO);
	//	return NavigationConstant.FACULTY_PREFIX_PAGE+NavigationConstant.LEAVE_BALANCE_PAGE;
		return NavigationConstant.LMS_PREFIX_PAGE+NavigationConstant.LEAVE_BALANCE_PAGE;
	}

}
