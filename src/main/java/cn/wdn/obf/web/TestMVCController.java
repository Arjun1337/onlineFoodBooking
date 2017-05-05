package cn.wdn.obf.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class TestMVCController implements Controller  {
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
System.out.println("testMVCController");
		ModelAndView mv = new ModelAndView();
		mv.addObject("message","hello world");
		mv.setViewName("TestMVC");
		return mv;
	}
	

	

}
