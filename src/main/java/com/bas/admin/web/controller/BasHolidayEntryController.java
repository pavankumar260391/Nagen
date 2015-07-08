package com.bas.admin.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bas.admin.service.HolidayEntryService;
import com.bas.admin.web.controller.form.DesignationForm;
import com.bas.admin.web.controller.form.HolidayEntryForm;
import com.bas.common.constant.NavigationConstant;

/**
 * 
 * @author Amogh
 * 
 */
@Controller
public class BasHolidayEntryController {
	@Autowired
	@Qualifier("HolidayEntryServiceImpl")
	private HolidayEntryService holidayEntryService;

	@RequestMapping(value = "/holidayEntries.htm", method = RequestMethod.GET)
	public String findHolidayEntry(Model model) {
		List<HolidayEntryForm> holidayEntryForms = holidayEntryService
				.findHolidayEntry();
		model.addAttribute("holidayEntryForms", holidayEntryForms);
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.ADD_HOLIDAY_ENTRY;
	}

	
	
	
	
	
	@RequestMapping(value = "/holidayEntry.htm", method = RequestMethod.GET)
	public String setHolidayEntry(Model model) {
		HolidayEntryForm holidayEntryForm = new HolidayEntryForm();
		model.addAttribute("holidayEntryForm", holidayEntryForm);
		model.addAttribute("buttonLabel", "Add Holiday Entry");
		String str = findHolidayEntry(model);
		return str;

	}

	@RequestMapping(value = "/holidayEntry.htm", method = RequestMethod.POST)
	public String submitHolidayEntry(
			@ModelAttribute("holidayEntryForm") HolidayEntryForm holidayEntryForm,
			@RequestParam(value ="buttonAction", required = false) String buttonAction,
			Model model) {
		if (buttonAction != null && buttonAction.equals("Update Entry")) {
			holidayEntryService.editHolidayEntry(holidayEntryForm);
		} else {
			try{
			holidayEntryService.addHolidayEntry(holidayEntryForm);
			}
			catch(DuplicateKeyException e)
			{
			model.addAttribute("alertMessage", "Entry for This Date Already Exists");	
			}
		}
		HolidayEntryForm holidayEntryForm2 = new HolidayEntryForm();
		model.addAttribute("holidayEntryForm", holidayEntryForm2);
		model.addAttribute("buttonLabel", "Add Holiday Entry");
		String str = findHolidayEntry(model);
		return str;
	}

	@RequestMapping(value = "/deleteHolidayEntry.htm", method = RequestMethod.POST)
	public String deleteHolidayEntry(HttpServletRequest request, Model model) {
		String date = request.getParameter("holidayDate");
		holidayEntryService.deleteHolidayEntry(date);
		setHolidayEntry(model);
		String str = findHolidayEntry(model);
		return str;
	}

	@RequestMapping(value = "/editHolidayEntry.htm", method = RequestMethod.GET)
	public String editHolidayEntry(HttpServletRequest request, Model model) {
		String date = request.getParameter("holidayDate");
		HolidayEntryForm holidayEntryForm = holidayEntryService
				.findHolidayEntryByDate(date);
		model.addAttribute("holidayEntryForm", holidayEntryForm);
		List<HolidayEntryForm> holidayEntryForms = holidayEntryService
				.findHolidayEntry();
		model.addAttribute("buttonLabel","Update Entry");
		model.addAttribute("holidayEntryForms", holidayEntryForms);
		return NavigationConstant.ADMIN_PREFIX_PAGE
				+ NavigationConstant.ADD_HOLIDAY_ENTRY;

	}
//Read
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// now Spring knows how to handle multipart object and convert them
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //Create a new CustomDateEditor
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        //Register it as custom editor for the Date type
		binder.registerCustomEditor(Date.class, editor);
	}
	
	
	
	
}
