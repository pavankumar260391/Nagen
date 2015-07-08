package com.bas.employee.web.controller;

import java.util.List;

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
public class FacultyLeaveHistoryController {

	@Autowired
	@Qualifier("BasFacultyServiceImpl")
	private BasFacultyService basFacultyService;

	@RequestMapping(value="/leaveHistory",method=RequestMethod.GET)
	public String showLeaveHistory(Model model,HttpSession session) {
		LoginForm loginForm=(LoginForm)session.getAttribute(NavigationConstant.USER_SESSION_DATA);
//		List<FaculityLeaveMasterVO> faculityLeaveMasterVOslist=basFacultyService.findLeaveHistory(loginForm.getEid());
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOslist=basFacultyService.findLeaveHistory("555");
		model.addAttribute("faculityLeaveMasterVOslist", faculityLeaveMasterVOslist);
//		return NavigationConstant.FACULTY_PREFIX_PAGE+NavigationConstant.LEAVE_HISTORY_PAGE;
		return NavigationConstant.LMS_PREFIX_PAGE+NavigationConstant.LEAVE_HISTORY_PAGE;

	
	}
	
}
