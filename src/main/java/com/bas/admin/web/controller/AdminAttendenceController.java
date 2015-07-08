package com.bas.admin.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bas.common.constant.NavigationConstant;
import com.bas.employee.service.BasFacultyService;
import com.bas.employee.web.controller.form.FacultyAttendStatusVO;
import com.bas.employee.web.controller.form.ManualAttendanceVO;
/**
 * 
 * @author Kushal
 * 
 */

@Controller
@Scope("request")
public class AdminAttendenceController {


@Autowired
@Qualifier("BasFacultyServiceImpl")
private BasFacultyService basFacultyService;
	
@RequestMapping(value = "/adminAttendenceView.htm", method = RequestMethod.GET)
public String adminAttendanceSubmitGet(HttpServletRequest request, Model model) {
	return NavigationConstant.ADMIN_PREFIX_PAGE
			+ NavigationConstant.ADMIN_ATTENDANCE_PAGE;
	
}

@RequestMapping(value = "/adminAttendenceView.htm", method = RequestMethod.POST)
public String adminAttendanceSubmit(HttpServletRequest request, Model model) {
	String name = request.getParameter("searchFiled");
	if (name != null) {
		String tokens[] = name.split("-");
		String empid = tokens[1];
		List<FacultyAttendStatusVO> facultyAttendStatusVOs = basFacultyService
				.findAttendStatus(empid,06);
ManualAttendanceVO manualAttendanceVO=basFacultyService.findEmployeeDataForAttendance(empid);
model.addAttribute("manualAttendanceVO", manualAttendanceVO);
model.addAttribute("facultyAttendStatusVOs", facultyAttendStatusVOs);
	
}

	return NavigationConstant.ADMIN_PREFIX_PAGE
			+ NavigationConstant.ADMIN_ATTENDANCE_PAGE;
}
	
	
}
