package com.bas.admin.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.bas.admin.service.AdminLeaveMasterInitService;
import com.bas.common.constant.NavigationConstant;
import com.bas.employee.service.BasFacultyService;
import com.bas.employee.web.controller.form.FaculityLeaveMasterVO;
import com.bas.employee.web.controller.form.ManualAttendanceVO;

/**
 * 
 * @author Sid
 * 
 */
@Controller
@Scope("request")
public class AdminLeaveMasterInitController {

	@Autowired
	@Qualifier("adminLeaveMasterInitImpl")
	private AdminLeaveMasterInitService adminLeaveMasterInitService;

	@Autowired
	@Qualifier("BasFacultyServiceImpl")
	private BasFacultyService basFacultyService;

	@RequestMapping(value = "/initLeaveMaster.htm", method = RequestMethod.GET)
	public String initLeaveMasterGet(Model model) {	
		FaculityLeaveMasterVO faculityLeaveMasterVO = new FaculityLeaveMasterVO();
		model.addAttribute("faculityLeaveMasterVO",faculityLeaveMasterVO);
		model.addAttribute("ButtonLabel","Save");		
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOslist= adminLeaveMasterInitService.findAllleaveBalance();
		model.addAttribute("faculityLeaveMasterVOslist",faculityLeaveMasterVOslist);
		//System.out.println(faculityLeaveMasterVO.hashCode());
		return NavigationConstant.ADMIN_PREFIX_PAGE+NavigationConstant.ADMIN_LEAVEMASTRINIT_PAGE;
	}	


	@RequestMapping(value = "/leaveMasterInitSubmit.htm", method = RequestMethod.POST)
	public String insertInitPost(@ModelAttribute("faculityLeaveMasterVO") FaculityLeaveMasterVO faculityLeaveMasterVO,@RequestParam(value = "buttonAction", required = false) String buttonAction,HttpServletRequest request, Model model) {

		if (buttonAction != null && buttonAction.equalsIgnoreCase("Save")) {			
			try{
				String result = adminLeaveMasterInitService.addLeaveInit(faculityLeaveMasterVO);
				model.addAttribute("ButtonLabel","Save");
				model.addAttribute("Message","Added Leave Successfully");
				String str = finaAllLeaveHistory(model);
				return str;

			}
			catch(DuplicateKeyException e)
			{
				String str = finaAllLeaveHistory(model);
				model.addAttribute("ButtonLabel","Save");
				model.addAttribute("Message","Duplicate Entry Attempted");
				return str;
			}		
		} else{
			String result = adminLeaveMasterInitService.editLeaveInit(faculityLeaveMasterVO);
			model.addAttribute("faculityLeaveMasterVO",faculityLeaveMasterVO);
			model.addAttribute("ButtonLabel","Save");
			model.addAttribute("Message","Updated Succesfully");
			String str = finaAllLeaveHistory(model);	
			return str;		

		}				

	}

	@RequestMapping(value = "/allEmployeeHistoryLeaveInit.htm", method = RequestMethod.GET)
	public String finaAllLeaveHistory(Model model) {
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOslist = adminLeaveMasterInitService.findAllleaveBalance();
		model.addAttribute("faculityLeaveMasterVOslist",faculityLeaveMasterVOslist);
		model.addAttribute("ButtonLabel","Save");
		return NavigationConstant.ADMIN_PREFIX_PAGE+NavigationConstant.ADMIN_LEAVEMASTRINIT_PAGE;
	}

	@RequestMapping(value = "/leaveApplicationPostSrch.htm", method = RequestMethod.POST)
	public String getSearch(HttpServletRequest request, Model model) {		
		FaculityLeaveMasterVO faculityLeaveMasterVO = new FaculityLeaveMasterVO();
		model.addAttribute("faculityLeaveMasterVO", faculityLeaveMasterVO);
		model.addAttribute("ButtonLabel","Save");
		String name = request.getParameter("searchFiled");
		if (name != null) {
			String tokens[] = name.split("-");
			String empid = tokens[1];
			 Calendar cal = Calendar.getInstance(); 
				int month = cal.get(cal.MONTH)+1;
				 String leaveMonth;
				 if(month<10)
				 {leaveMonth="0"+month;}
				 else
				 {leaveMonth=month+"";}
			try {
				faculityLeaveMasterVO = basFacultyService.findLeaveAppData(empid);
				model.addAttribute("faculityLeaveMasterVO", faculityLeaveMasterVO);
				model.addAttribute("ButtonLabel","Save");
			} catch (Exception e) {				
				model.addAttribute("faculityLeaveMasterVO", faculityLeaveMasterVO);	
				model.addAttribute("ButtonLabel","Save");
				e.printStackTrace();
				return NavigationConstant.ADMIN_PREFIX_PAGE+NavigationConstant.ADMIN_LEAVEMASTRINIT_PAGE;
			}
		}

		model.addAttribute("ButtonLabel","Save");
		model.addAttribute("faculityLeaveMasterVO", faculityLeaveMasterVO);
		return NavigationConstant.ADMIN_PREFIX_PAGE+NavigationConstant.ADMIN_LEAVEMASTRINIT_PAGE;

	}

	@RequestMapping(value = "/editLeaveInit.htm", method = RequestMethod.GET)
	public String editLeaveInitget(HttpServletRequest request, Model model) {
		String empno = request.getParameter("psno");
		String mdate = request.getParameter("pdate");
		//FaculityLeaveMasterVO faculityLeaveMasterVO2 = new FaculityLeaveMasterVO();
		FaculityLeaveMasterVO faculityLeaveMasterVO2 = adminLeaveMasterInitService.findemplist(empno,mdate);
		model.addAttribute("faculityLeaveMasterVO",faculityLeaveMasterVO2);
		model.addAttribute("ButtonLabel","Edit Leave");
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOslist = adminLeaveMasterInitService.findAllleaveBalance();
		model.addAttribute("faculityLeaveMasterVOslist",faculityLeaveMasterVOslist);
		return NavigationConstant.ADMIN_PREFIX_PAGE+NavigationConstant.ADMIN_LEAVEMASTRINIT_PAGE;	

	}

	@RequestMapping(value = "/deleteLeaveInit.htm", method = RequestMethod.GET)
	public String deleteLeaveHistory(@ModelAttribute("faculityLeaveMasterVO") FaculityLeaveMasterVO faculityLeaveMasterVO,HttpServletRequest request, Model model)throws ParseException {
		String empNo = request.getParameter("psno");
		String mdate = request.getParameter("pdate");
		//String sdate = request.getParameter("leaveStartDate");
		String str=adminLeaveMasterInitService.deleteLeaveInit(empNo,mdate);
		List<FaculityLeaveMasterVO> faculityLeaveMasterVOslist = adminLeaveMasterInitService.findAllleaveBalance();
		model.addAttribute("faculityLeaveMasterVOslist",faculityLeaveMasterVOslist);
		model.addAttribute("Message","Deleted Successfully");
		model.addAttribute("ButtonLabel","Save");
		return NavigationConstant.ADMIN_PREFIX_PAGE+NavigationConstant.ADMIN_LEAVEMASTRINIT_PAGE;
	}


	@RequestMapping(value = "/renderEmpImage3", method = RequestMethod.GET)
	public void renderPhoto(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		response.setContentType("image/jpg");
		byte[] image = basFacultyService.findEmpPhotoByName(name);
		if (image != null) {
			response.getOutputStream().write(image);
		}
	}

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
