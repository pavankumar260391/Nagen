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
import org.springframework.web.bind.annotation.RequestParam;

import com.bas.admin.service.DesignationService;
import com.bas.admin.web.controller.form.CategoryForm;
import com.bas.admin.web.controller.form.DepartmentForm;
import com.bas.admin.web.controller.form.DesignationForm;
import com.bas.common.constant.NavigationConstant;

/**
 * 
 * @author Amogh
 * 
 */
@Controller
public class BasDesignationController {
	@Autowired
	@Qualifier("DesignationServiceImpl")
	private DesignationService designationService;

	@RequestMapping(value = "/addDesignation", method = RequestMethod.GET)
	public String showAddDesignation(Model model) {
		DesignationForm designationForm = new DesignationForm();
		model.addAttribute("designationForm", designationForm);
//		model.addAttribute("buttonLable", "Add Designation");
//		List<DesignationForm> designationForms = designationService.findDesignations();
//	model.addAttribute("designationForms", designationForms);
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.ADD_DESIGNATION_PAGE;
	}
	
	
	
	@RequestMapping(value = "/addDesignationTodb", method = RequestMethod.POST)
	public String AddDesignation(@ModelAttribute(value="designation") DesignationForm designationform ,Model model) {
	
	String message = designationService.addDesignation(designationform);
	model.addAttribute("message", message);
	return NavigationConstant.ADMIN_PREFIX_PAGE
			+ NavigationConstant.ADD_DESIGNATION_PAGE;
}

//	@RequestMapping(value = "/addDesignation.htm", method = RequestMethod.POST)
//	public String submitAddDepartment(
//			@ModelAttribute("designationForm") DesignationForm designationForm,
//			@RequestParam(value = "buttonAction", required = false) String buttonAction,
//			Model model) {
//		if (buttonAction != null && buttonAction.equals("Update Designation")) {
//
//			designationService.updateDesignation(designationForm);
//			System.out.println("Contr : " + designationForm);
//		} else {
//			designationService.addDesignation(designationForm);
//		}
//
//		List<DesignationForm> designationForms = designationService.findDesignations();
//		model.addAttribute("buttonLable", "Add Designation");
//
//		// We are creating a blank form so that we can show blank value
//		DesignationForm ndesignationForm = new DesignationForm();
//		model.addAttribute("designationForm", ndesignationForm);
//
//		model.addAttribute("designationForms", designationForms);
//		System.out.println(designationForms);
//		return NavigationConstant.ADMIN_PREFIX_PAGE
//				+ NavigationConstant.ADD_DESIGNATION_PAGE;
//	}

	@RequestMapping(value = "/deleteDesignation.htm", method = RequestMethod.GET)
	public String deleteDesignation(HttpServletRequest request, Model model) {
		Integer desigId = Integer.parseInt(request.getParameter("designationId"));
		System.out.println("desigId" + desigId);
		designationService.deleteDesignation(desigId);
		return "redirect:addDesignation.htm";
	}

	@RequestMapping(value = "/editDesignation.htm", method = RequestMethod.GET)
	public String editDesignation(HttpServletRequest request, Model model) {
		Integer desigId = Integer.parseInt(request.getParameter("designationId"));
		DesignationForm designationForm = designationService
				.findDesignationById(desigId);
		model.addAttribute("designationForm", designationForm);
		List<DesignationForm> designationForms = designationService
				.findDesignations();
		model.addAttribute("buttonLable", "Update Designation");
		model.addAttribute("designationForms", designationForms);
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.ADD_DESIGNATION_PAGE;
	}
}
