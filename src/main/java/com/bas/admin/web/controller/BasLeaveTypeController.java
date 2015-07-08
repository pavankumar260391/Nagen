package com.bas.admin.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bas.admin.service.LeaveTypeService;
import com.bas.admin.web.controller.form.LeaveTypeForm;
import com.bas.common.constant.NavigationConstant;

/**
 * 
 * @author Amogh
 * 
 */
@Controller
public class BasLeaveTypeController {

	@Autowired
	@Qualifier("LeaveTypeServiceImpl")
	private LeaveTypeService leaveTypeService;

//	@RequestMapping(value = "/addLeaveType.htm", method = RequestMethod.GET)
//	public String showAddLeaveTypes(Model model) {
//		LeaveTypeForm leaveTypeForm = new LeaveTypeForm();
//		model.addAttribute("leaveTypeForm", leaveTypeForm);
//		List<LeaveTypeForm> leaveTypeForms = leaveTypeService.findLeaveType();
//		model.addAttribute("buttonLable", "Add LeaveType");
//		model.addAttribute("leaveTypeForms", leaveTypeForms);
//		return NavigationConstant.ADMIN_PREFIX_PAGE
//				+ NavigationConstant.LEAVE_TYPE;
//	}
	
	@RequestMapping(value = "/addLeaveType", method = RequestMethod.GET)
	public String showAddLeaveType(Model model) {
		LeaveTypeForm leaveTypeForm = new LeaveTypeForm();
		List<LeaveTypeForm> leaveTypeForms = leaveTypeService.findLeaveType();
		model.addAttribute("leaveTypeForm", leaveTypeForm);
		model.addAttribute("listOfLeaveType", leaveTypeForms);
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.LEAVE_TYPE;
	}
	
	@RequestMapping(value = "/addLeaveTypeTodb", method = RequestMethod.POST)
	public @ResponseBody String submitAddLeaveType(
			@ModelAttribute("leaveTypeForm") LeaveTypeForm leaveTypeForm,Model model) { 
		System.out.println("Hello Rama g");
		System.out.println(leaveTypeForm);
		String message= leaveTypeService.addLeaveType(leaveTypeForm);
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		
		
		return sdf.format(new Date());
	}
		

	@RequestMapping(value = "/addLeaveType.htm", method = RequestMethod.POST)
	public String submitAddLeaveTypes(
			@ModelAttribute("leaveTypeForm") LeaveTypeForm leaveTypeForm,
			@RequestParam(value = "buttonAction", required = false) String buttonAction,
			Model model) {
		if (buttonAction != null && buttonAction.equals("Update LeaveType")) {
			leaveTypeService.updateLeaveType(leaveTypeForm);
			System.out.println("Contr : " + leaveTypeForm);
		} else {
			leaveTypeService.addLeaveType(leaveTypeForm);
		}
		List<LeaveTypeForm> leaveTypeForms = leaveTypeService.findLeaveType();
		model.addAttribute("buttonLable", "Add LeaveType");
		LeaveTypeForm nleaveTypeForm = new LeaveTypeForm();
		model.addAttribute("leaveTypeForm", nleaveTypeForm);
		model.addAttribute("leaveTypeForms", leaveTypeForms);
		System.out.println(leaveTypeForms);
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.LEAVE_TYPE;
	}

	@RequestMapping(value = "/editLeaveType.htm", method = RequestMethod.GET)
	public String editLeaveType(HttpServletRequest request, Model model) {
		Integer leavId = Integer.parseInt(request.getParameter("leaveTypeId"));
		LeaveTypeForm leaveTypeForm = leaveTypeService
				.findLeaveTypeById(leavId);
		model.addAttribute("leaveTypeForm", leaveTypeForm);
		List<LeaveTypeForm> leaveTypeForms = leaveTypeService.findLeaveType();
		model.addAttribute("buttonLable", "Update LeaveType");
		model.addAttribute("leaveTypeForms", leaveTypeForms);
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.LEAVE_TYPE;
	}

	@RequestMapping(value = "/deleteLeaveType.htm", method = RequestMethod.GET)
	public String deleteLeaveType(HttpServletRequest request, Model model) {
		Integer lvId = Integer.parseInt(request.getParameter("leaveTypeId"));
		System.out.println("lvId" + lvId);
		leaveTypeService.deleteLeaveType(lvId);
		return "redirect:addLeaveType.htm";
	}
}
