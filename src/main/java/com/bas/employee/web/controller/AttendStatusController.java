package com.bas.employee.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bas.common.constant.NavigationConstant;
import com.bas.employee.service.BasFacultyService;
import com.bas.employee.utility.MonthUtility;
import com.bas.employee.web.controller.form.FacultyAttendStatusVO;
import com.bas.employee.web.controller.form.LoginForm;

/**
 * 
 * @author nagendra
 * 
 * This is controller which will give 
 * you attandance status for the faculty.
 *
 */
@Controller
public class AttendStatusController {

	@Autowired
	@Qualifier("BasFacultyServiceImpl")
	private BasFacultyService basFacultyService;


	@RequestMapping(value="/attendanceStatus",method=RequestMethod.GET)
	public String showAttendStatus( Model model,HttpSession session)
	{
		MonthUtility monthUtility = new MonthUtility();
		monthUtility.setMonth(monthUtility.getDate());
		model.addAttribute("monthUtility", monthUtility);		
		model.addAttribute("monthList", monthUtility.getMonthList(monthUtility.getDate()));
		List<FacultyAttendStatusVO> facultyAttendStatusVOlist=basFacultyService.findAttendStatus("801",monthUtility.getDate());
		model.addAttribute("facultyAttendStatusVOlist", facultyAttendStatusVOlist);		
		return NavigationConstant.EMPLOYEE_PREFIX_PAGE+NavigationConstant.ATTEND_STATUS_PAGE;
	}

	@RequestMapping(value="/retreiveEmployeeInfo/{monthVal}",method=RequestMethod.POST)
	public @ResponseBody List<FacultyAttendStatusVO> showAttendStatus(@PathVariable(value="monthVal") String monthVal,HttpSession session)
	{	
		LoginForm loginForm=(LoginForm)session.getAttribute(NavigationConstant.USER_SESSION_DATA);		
		List<FacultyAttendStatusVO> facultyAttendStatusVOlist=basFacultyService.findAttendStatus("801",Integer.parseInt(monthVal));		
	/*	System.out.println(facultyAttendStatusVOlist.get(0));*/
		return facultyAttendStatusVOlist;
	}


	/*@RequestMapping(value="/attendanceStatus1",method=RequestMethod.POST)
	public String showAttendStatus(@ModelAttribute("monthUtility") MonthUtility monthsList, Model model,HttpSession session) {	
		System.out.println("Helooo "+monthsList.getMonth());
		LoginForm loginForm=(LoginForm)session.getAttribute(NavigationConstant.USER_SESSION_DATA);		
		List<FacultyAttendStatusVO> facultyAttendStatusVOlist=basFacultyService.findAttendStatus("801",monthsList.getMonth());
		model.addAttribute("facultyAttendStatusVOlist", facultyAttendStatusVOlist);		
		model.addAttribute("monthList", monthsList.getMonthList(monthsList.getMonth()));
		return NavigationConstant.EMPLOYEE_PREFIX_PAGE+NavigationConstant.ATTEND_STATUS_PAGE;
	}*/


}
