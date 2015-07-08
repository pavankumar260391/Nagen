package com.bas.admin.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bas.admin.service.DepartmentService;
import com.bas.admin.web.controller.form.DepartmentForm;
import com.bas.common.constant.NavigationConstant;

/**
 * 
 * @author nagendra.yadav
 * 
 */
@Controller
public class BasDepartmentController {

	@Autowired
	@Qualifier("DepartmentServiceImpl")
	private DepartmentService departmentService;

	@RequestMapping(value = "/addDepartment", method = RequestMethod.GET)
		public String showAddDepartment(Model model) {
		DepartmentForm addDepartment = new DepartmentForm();
		model.addAttribute("department", addDepartment);
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.ADD_DEPARTMENT_PAGE;
	}
	
	@RequestMapping(value = "/addDepartmentTodb", method = RequestMethod.POST)
	public String AddDepartment(@ModelAttribute(value="department") DepartmentForm departmentForm ,Model model) {
	
	String message = departmentService.addDepartment(departmentForm);
	return NavigationConstant.ADMIN_PREFIX_PAGE
			+ NavigationConstant.ADD_DEPARTMENT_PAGE;
}
	
	
//	@RequestMapping(value = "/addDepartment.htm", method = RequestMethod.GET)
//	public String showAddDepartment(Model model) {
//		DepartmentForm departmentForm = new DepartmentForm();
//		model.addAttribute("departmentForm", departmentForm);
//		List<DepartmentForm> departmentForms = departmentService
//				.findDepartments();
//		model.addAttribute("buttonLable", "Add Department");
//		model.addAttribute("departmentForms", departmentForms);
//		return NavigationConstant.ADMIN_PREFIX_PAGE
//				+ NavigationConstant.ADD_DEPARTMENT_PAGE;
//	}
//	
//	@RequestMapping(value = "/addDepartment.htm", method = RequestMethod.POST)
//	public String submitAddDepartment(
//			@ModelAttribute("departmentForm") DepartmentForm departmentForm,
//			@RequestParam(value = "buttonAction", required = false) String buttonAction,
//			Model model) {
//		if (buttonAction != null && buttonAction.equals("Update Department")) {
//
//			departmentService.updateDepartment(departmentForm);
//			System.out.println("Contr : " + departmentForm);
//		} else {
//			departmentService.addDepartment(departmentForm);
//		}
//
//		List<DepartmentForm> departmentForms = departmentService
//				.findDepartments();
//		model.addAttribute("buttonLable", "Add Department");
//
//		// We are creating a blank form so that we can show blank value
//		DepartmentForm ndepartmentForm = new DepartmentForm();
//		model.addAttribute("departmentForm", ndepartmentForm);
//
//		// This is to show list of the departments
//		model.addAttribute("departmentForms", departmentForms);
//		System.out.println(departmentForms);
//		return NavigationConstant.ADMIN_PREFIX_PAGE
//				+ NavigationConstant.ADD_DEPARTMENT_PAGE;
//	}
//
	@RequestMapping(value = "/editDepartment.htm", method = RequestMethod.GET)
	public String editDepartment(HttpServletRequest request, Model model) {
		Integer deptId = Integer.parseInt(request.getParameter("departmentId"));
		// List<DepartmentForm>
		// departmentEntities=departmentService.findDepartments();
		DepartmentForm departmentForm = departmentService
				.findDepartmentById(deptId);
		model.addAttribute("departmentForm", departmentForm);
		List<DepartmentForm> departmentForms = departmentService
				.findDepartments();
		model.addAttribute("buttonLable", "Update Department");
		model.addAttribute("departmentForms", departmentForms);
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.ADD_DEPARTMENT_PAGE;
	}

	@RequestMapping(value = "/deleteDepartment.htm", method = RequestMethod.GET)
	public String deleteDepartment(HttpServletRequest request, Model model) {
		Integer depId = Integer.parseInt(request.getParameter("departmentId"));
		System.out.println("depId" + depId);
		departmentService.deleteDepartment(depId);
		return "redirect:addDepartment.htm";
	
	}
}
