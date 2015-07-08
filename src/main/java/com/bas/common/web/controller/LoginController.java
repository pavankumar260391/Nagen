package com.bas.common.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bas.common.constant.NavigationConstant;
import com.bas.common.dao.LoginDao;
import com.bas.employee.dao.entity.LoginEntity;
import com.bas.employee.web.controller.form.LoginForm;

@Controller //@Component
@Scope("request")
public class LoginController {
	
	@Autowired
	@Qualifier("LoginDaoImpl")
	private LoginDao loginDao;
	
	@RequestMapping(value="/adminHome",method=RequestMethod.GET)
	public String adminHome(){
		return NavigationConstant.ADMIN_PREFIX_PAGE+NavigationConstant.ADMIN_HOME_PAGE;
	}
	
	
	@RequestMapping(value="/employeeHome",method=RequestMethod.GET)
	public String employeeHome(){
		return NavigationConstant.EMPLOYEE_PREFIX_PAGE+NavigationConstant.EMPLOYEE_HOME_PAGE;
	}
	
	@RequestMapping(value="/facultyHome",method=RequestMethod.GET)
	public String facultyHome(){
		return NavigationConstant.FACULTY_PREFIX_PAGE+NavigationConstant.FACULTY_HOME_PAGE;
	}
	
		
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session,Model model){
		session.invalidate();
		model.addAttribute("error","You have successfully logout from application!!!");
		return NavigationConstant.COMMON_PREFIX_PAGE+NavigationConstant.LOGIN_PAGE;
	}
	
	@RequestMapping(value="/bashome",method=RequestMethod.GET)
	public String showHomePage(){	
		return NavigationConstant.COMMON_PREFIX_PAGE+NavigationConstant.COMMON_HOME_PAGE;		
	}
	
	@RequestMapping(value="/auth",method=RequestMethod.GET)
	public String showLoginPage(){	
		return NavigationConstant.COMMON_PREFIX_PAGE+NavigationConstant.LOGIN_PAGE;
	}	

	@RequestMapping(value="/auth",method=RequestMethod.POST)
	public String validateUser(HttpServletRequest request,HttpSession session,Model model){
		//ApplicationContext applicationContext=new ClassPathXmlApplicationContext("bas-att-spring-context.xml");
		//LoginDao loginDao=(LoginDao)applicationContext.getBean("LoginDaoImpl");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println("__user name ___ " +username);
		System.out.println("__password ___ " +password);
		LoginEntity loginEntity=loginDao.validateUser(username, password);
		if(loginEntity!=null){
			LoginForm form=new LoginForm();
			BeanUtils.copyProperties(loginEntity, form);
			if(loginEntity!=null &&  loginEntity.getRole()!=null && "user".equals(loginEntity.getRole())){
				session.setAttribute(NavigationConstant.USER_SESSION_DATA, form);
				return NavigationConstant.FACULTY_PREFIX_PAGE+NavigationConstant.FACULTY_HOME_PAGE;
			}else if(loginEntity!=null &&  loginEntity.getRole()!=null && "admin".equals(loginEntity.getRole())){
				session.setAttribute(NavigationConstant.USER_SESSION_DATA, form);
				return NavigationConstant.ADMIN_PREFIX_PAGE+NavigationConstant.ADMIN_HOME_PAGE;
		    }else if(loginEntity!=null &&  loginEntity.getRole()!=null && "userRM".equals(loginEntity.getRole())){
		    	session.setAttribute(NavigationConstant.USER_SESSION_DATA, form);
		    	model.addAttribute("role", "userRM");
				return NavigationConstant.FACULTY_PREFIX_PAGE+NavigationConstant.FACULTY_HOME_PAGE;
		    }
		    else{
		    	session.setAttribute(NavigationConstant.USER_SESSION_DATA, form);
				return NavigationConstant.FACULTY_PREFIX_PAGE+NavigationConstant.FACULTY_HOME_PAGE;
		    }
		   
		}else {
			model.addAttribute("error","Username and password are not valid!!!");
			return NavigationConstant.COMMON_PREFIX_PAGE+NavigationConstant.LOGIN_PAGE;
		}
	}
}

