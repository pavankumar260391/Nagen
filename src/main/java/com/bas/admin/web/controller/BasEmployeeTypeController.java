package com.bas.admin.web.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bas.admin.service.EmployeeTypeService;
import com.bas.admin.web.controller.form.EmployeeTypeForm;
import com.bas.common.constant.NavigationConstant;
import com.bas.employee.service.BasFacultyService;
import com.bas.employee.utility.MonthUtility;
import com.bas.employee.web.controller.form.FacultyAttendStatusVO;
import com.bas.employee.web.controller.form.LoginForm;

/**
 * 
 * @author Amogh
 * 
 */
@Controller
public class BasEmployeeTypeController {
	
	@Autowired
	@Qualifier("EmployeeTypeServiceImpl")
	private EmployeeTypeService employeeTypeService;
	
	@Autowired
	@Qualifier("BasFacultyServiceImpl")
	private BasFacultyService basFacultyService;

	
	@RequestMapping(value = "/adminUpdateAttendance", method = RequestMethod.GET)
	public String adminUpdateAttendance(HttpServletRequest request, Model model) {
		MonthUtility monthUtility = new MonthUtility();
		FacultyAttendStatusVO facultyAttendStatusVO = new FacultyAttendStatusVO(); 
		monthUtility.setMonth(monthUtility.getDate());
		model.addAttribute("adminMonthUtility", monthUtility);
		model.addAttribute("EmptyfacultyAttendStatusVO", facultyAttendStatusVO);	
		model.addAttribute("adminMonthList", monthUtility.getMonthList(monthUtility.getDate()));
		
		System.out.println("Hello Admin");
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.ADMIN_ATTEND_UPDATE_PAGE;		
	}

	@RequestMapping(value = "/searchEmployee", method = RequestMethod.GET)
	public @ResponseBody List<String> showEmployee(HttpServletRequest request) {	
		System.out.println("Searching");
		return 	employeeTypeService.searchEmployee(request.getParameter("term"));
	}
	
	@RequestMapping(value="/retreiveEmployeeForAdmin",method=RequestMethod.POST)
	public @ResponseBody List<FacultyAttendStatusVO> showAttendStatus(@RequestParam(value="requiredData") String employeeName,HttpSession session,
			Model model)
	{	
		MonthUtility monthUtility = new MonthUtility();
		String[] names = employeeName.split(" ");
		String employeeId = employeeTypeService.getEmployeeId(names[0], names[1]);
		/*int inTimeStatus = employeeTypeService.getEmployeeLate(monthUtility.getDate(), employeeId, "intimestatus");
		int outTimeStatus = employeeTypeService.getEmployeeLate(monthUtility.getDate(), employeeId, "outtimestatus");*/
		LoginForm loginForm=(LoginForm)session.getAttribute(NavigationConstant.USER_SESSION_DATA);		
		List<FacultyAttendStatusVO> facultyAttendStatusVOlist=basFacultyService.findAttendStatus(employeeId,monthUtility.getDate());		
		//System.out.println(facultyAttendStatusVOlist.get(0));
		return facultyAttendStatusVOlist;
	}

	
	@RequestMapping(value="/retreiveEmployeeForAdminMonth",method=RequestMethod.POST)
	public @ResponseBody List<FacultyAttendStatusVO> showAttendStatus1(@RequestParam(value="requiredData") String monthVal,HttpSession session)
	{	
		LoginForm loginForm=(LoginForm)session.getAttribute(NavigationConstant.USER_SESSION_DATA);		
		List<FacultyAttendStatusVO> facultyAttendStatusVOlist=basFacultyService.findAttendStatus("801",Integer.parseInt(monthVal));		
	/*	System.out.println(facultyAttendStatusVOlist.get(0));*/
		return facultyAttendStatusVOlist;
	}

	
	@RequestMapping(value = "/updateEmployee", method = RequestMethod.POST)
	public @ResponseBody String editEmployeeType(@ModelAttribute(value="EmptyfacultyAttendStatusVO") FacultyAttendStatusVO facultyAttendStatusVO, 
			HttpServletRequest request,@RequestParam(value="additionalInfo") String monthInfo, Model model) {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		DateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		String newdate="";
		try {
			date = format.parse(monthInfo);
			newdate = newFormat.format(date);			
		} catch (ParseException e) {		
			e.printStackTrace();
		}						
		/*System.out.println(facultyAttendStatusVO);*/
		/*String abc = basFacultyService.insertAttendus(basFacultyService.insertData());
		System.out.println(abc);*/
		String message = basFacultyService.updateEmployee(facultyAttendStatusVO, "801",newdate);
		return message;		
	}
	
	@RequestMapping(value = "/deleteAttendus", method = RequestMethod.GET)
	public @ResponseBody String deleteAttendus(HttpServletRequest request,@RequestParam(value="employeeName") String employeeName,
			 @RequestParam(value="attndDate") String attndDate) {		
		String[] names = employeeName.split(" ");
		String employeeId = employeeTypeService.getEmployeeId(names[0], names[1]);
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		DateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		String newdate="";
		try {
			date = format.parse(attndDate);
			newdate = newFormat.format(date);			
		} catch (ParseException e) {		
			e.printStackTrace();
		}		
		System.out.println(employeeId);
		System.out.println(newdate);
		String message = basFacultyService.deleteAttendus(employeeId,newdate);
		
		return message;
	}


	/*@RequestMapping(value = "/adminUpdateAttendance1", method = RequestMethod.POST)
	public String showAttendance(HttpServletRequest request, Model model) {
		MonthUtility monthUtility = new MonthUtility();
		String employeeName = request.getParameter("employeeName");
		String[] names = employeeName.split(" ");
		String employeId = employeeTypeService.getEmployeeId(names[0], names[1]);
		List<FacultyAttendStatusVO> facultyAttendStatusVOlist=basFacultyService.findAttendStatus(employeId,monthUtility.getDate());
		model.addAttribute("facultyAttendStatusVOlist", facultyAttendStatusVOlist);	
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.ADMIN_ATTEND_UPDATE_PAGE;		
	}
	*/
	
	@RequestMapping(value = "/addEmployeeType.htm", method = RequestMethod.GET)
	public String showAddEmploymentType(Model model) {
		EmployeeTypeForm employeeTypeForm = new EmployeeTypeForm();
		model.addAttribute("employeeTypeForm", employeeTypeForm);
		model.addAttribute("buttonLable", "Add EmployeeType");
		List<EmployeeTypeForm> employeeTypeForms = employeeTypeService
				.findEmployeeTypes();
		model.addAttribute("employeeTypeForms", employeeTypeForms);
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.ADD_EMPLOYEE_TYPE;
	}

	@RequestMapping(value = "/addEmployeeType.htm", method = RequestMethod.POST)
	public String submitAddEmployee(
			@ModelAttribute("employeeTypeForm") EmployeeTypeForm employeeTypeForm,
			@RequestParam(value = "buttonAction", required = false) String buttonAction,
			Model model) {
		if (buttonAction != null && buttonAction.equals("Update LeaveReason")) {

			employeeTypeService.updateEmployeeType(employeeTypeForm);
			System.out.println("Contr : " + employeeTypeForm);
		} else {
			employeeTypeService.addEmployeeType(employeeTypeForm);
		}
		List<EmployeeTypeForm> employeeTypeForms = employeeTypeService.findEmployeeTypes();
		model.addAttribute("buttonLable", "Add EmployeeType");
		EmployeeTypeForm nemployeeTypeForm = new EmployeeTypeForm();
		model.addAttribute("employeeTypeForm", nemployeeTypeForm);
		model.addAttribute("employeeTypeForms", employeeTypeForms);
		System.out.println(employeeTypeForms);
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.ADD_EMPLOYEE_TYPE;
	}
	

	@RequestMapping(value = "/deleteEmployeeType.htm", method = RequestMethod.GET)
	public String deleteEmployeeType(HttpServletRequest request, Model model) {
		Integer empId = Integer.parseInt(request.getParameter("employeeTypeId"));
		System.out.println("empId" + empId);
		employeeTypeService.deleteEmployeeType(empId);
		return "redirect:addEmployeeType.htm";
	}
}