package com.bas.employee.web.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.bas.employee.service.BasFacultyService;
import com.bas.employee.web.controller.form.FacultyForm;

@Controller
@Scope("request")
public class FacultyController {

	@Autowired
	@Qualifier("BasFacultyServiceImpl")
	private BasFacultyService basFacultyService;

	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String showRegistrationPage(Model model){
		//I am creating an instance of FacultyForm
		FacultyForm facultyForm=new FacultyForm();
		model.addAttribute("facultyCommand", facultyForm);
		return com.bas.common.constant.NavigationConstant.FACULTY_PREFIX_PAGE+com.bas.common.constant.NavigationConstant.FACULTY_REGISTRATION_PAGE;
	}

	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerFacultySubmit(@ModelAttribute("facultyCommand") FacultyForm facultyForm,Model model){
		basFacultyService.persistFaculty(facultyForm);
		return com.bas.common.constant.NavigationConstant.COMMON_PREFIX_PAGE+com.bas.common.constant.NavigationConstant.LOGIN_PAGE;
	}

	@RequestMapping(value="/showFaculty",method=RequestMethod.POST)
	//Model model = it is used to carry data from controller to the jsp
	public String showFacultyData(Model model){
		List<FacultyForm> facultyForms=basFacultyService.findAllFaculty();
		model.addAttribute("facultyData", facultyForms);
		return com.bas.common.constant.NavigationConstant.ADMIN_PREFIX_PAGE+com.bas.common.constant.NavigationConstant.SHOW_REGISTEREDFACULTY_PAGE;
	}

	@RequestMapping(value="/showFaculty",method=RequestMethod.GET)
	//Model model = it is used to carry data from controller to the jsp
	public String showFacultyDataGet(Model model){
		List<FacultyForm> facultyForms=basFacultyService.findAllFaculty();
		model.addAttribute("facultyData", facultyForms);
		return com.bas.common.constant.NavigationConstant.ADMIN_PREFIX_PAGE+com.bas.common.constant.NavigationConstant.SHOW_REGISTEREDFACULTY_PAGE;
	}

	@RequestMapping(value="/deleteFaculty",method=RequestMethod.GET)
	//Model model = it is used to carry data from controller to the jsp
	public String deleteFacultyDb(HttpServletRequest request,Model model){
		//delete the data from database as name comming from UI
		String name=request.getParameter("pname");
		basFacultyService.deletetFaculty(name);
		//Here I am fetching once again updated data
		/*List<FacultyEntity> facultyEntities=basFacultyDao.findAllFaculty();
		model.addAttribute("facultyData", facultyEntities);*/
		return "redirect:showFaculty";
	}




	//Model model = it is used to carry data from controller to the jsp
	//String name=request.getParameter("pname");
	@RequestMapping(value="/editFaculty",method=RequestMethod.POST)
	public String showEditFaculty(@ModelAttribute("facultyCommand") FacultyForm facultyForm,Model model){
		String result=basFacultyService.updateFaculty(facultyForm);
		return "redirect:showFaculty";
	}

	@RequestMapping(value="/editFaculty",method=RequestMethod.GET)
	public String showEditFaculty(@RequestParam("pname") String name,Model model){
		FacultyForm facultyForm=basFacultyService.findFacultyByName(name);
		model.addAttribute("facultyCommand", facultyForm);
		return com.bas.common.constant.NavigationConstant.FACULTY_PREFIX_PAGE+com.bas.common.constant.NavigationConstant.FACULTY_EDIT_PAGE;
	}


	@RequestMapping(value="/renderImage",method=RequestMethod.GET)
	public void renderPhoto(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String fname=request.getParameter("fname");
		response.setContentType("image/jpg");
		byte[] image=basFacultyService.findPhotoByName(fname);
		if(image!=null){
			response.getOutputStream().write(image);
		}
	}

	//It converts your upload file into byte array form after it
	//it is populated in customer java object

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// to actually be able to convert Multipart instance to byte[]
		// we have to register a custom editor
		binder.registerCustomEditor(byte[].class,
				new ByteArrayMultipartFileEditor());
		// now Spring knows how to handle multipart object and convert them
	}
	
	
	@InitBinder
	public void initBinder1(WebDataBinder binder) {
		// now Spring knows how to handle multipart object and convert them
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //Create a new CustomDateEditor
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
        //Register it as custom editor for the Date type
		binder.registerCustomEditor(Date.class, editor);
	}
	
	

}
