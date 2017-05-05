package cn.wdn.obf.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wdn.obf.entity.User;
import cn.wdn.obf.service.LoginService;
@Controller
public class LoginController {
	@Autowired
	LoginService service;
/**
 * 找回密码 未实现
 * @param email
 * @return
 */
@RequestMapping(value = "/findpwd", method = RequestMethod.POST, produces = {
		"application/json; charset=utf-8" })
@ResponseBody
	private  Map<String,Object> loginsssss(@RequestBody String email) {
		boolean flag = service.findPwd(email);
		Map<String,Object> map = new HashMap<String,Object>();
		if(flag){
			
			map.put("result", "ok");
		}else{
			map.put("result", "fail");
		}
		return map;
	}
/**
 * 退出
 * @param session
 * @return
 * @throws Exception
 */
@RequestMapping("/logout")
public String logout(HttpSession session) throws Exception {
   // 清除session
	System.out.println("logout");
   session.invalidate();
   return "LoginHTML";
}  
/**
 * 登陆
 * @param user
 * @param session
 * @return
 * @throws Exception
 */
@RequestMapping(value = "/checkUser", method = RequestMethod.POST)
@ResponseBody
public boolean  checkUser(@ModelAttribute User user,HttpSession session) throws Exception {
	boolean flag = service.checkLogin(user);
	if(flag){
		int uId = service.getUserId(user.getuAccount());
		User dbUser = service.getUserById(uId);
		session.setAttribute("userId", uId);
		System.out.println(dbUser);
		session.setAttribute("userName", dbUser.getuName());
		return flag;
	}
	return flag;
} 
/**
 * 商家登陆
 * @param user
 * @param session
 * @return
 * @throws Exception
 */
@RequestMapping(value = "/salerLogin", method = RequestMethod.POST)
@ResponseBody
public boolean salerLogin(@ModelAttribute User user,HttpSession session) throws Exception {
	boolean flag = service.checkSalerLogin(user);
	System.out.println("controller flag:"+flag);
	if(flag){
		int uId = service.getUserId(user.getuAccount());
		User dbUser = service.getUserById(uId);
		session.setAttribute("userId", uId);
		System.out.println(dbUser);
		session.setAttribute("userName", dbUser.getuName());
		return flag;
	}
	return flag;
}
/**
 * 管理员登陆
 * @param user
 * @param session
 * @return
 * @throws Exception
 */
@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
@ResponseBody
public boolean adminLogin(@ModelAttribute User user,HttpSession session) throws Exception {
	boolean flag = service.checkAdminLogin(user);
	if(flag){
		int uId = service.getUserId(user.getuAccount());
		User dbUser = service.getUserById(uId);
		session.setAttribute("userId", uId);
		System.out.println(dbUser);
		session.setAttribute("userName", dbUser.getuName());
		return flag;
	
	}
	return flag;
}
/**
 * 注册 
 * @param user
 * @return
 * @throws Exception
 */
@RequestMapping(value = "/register", method = RequestMethod.POST)
@ResponseBody
public boolean register(@ModelAttribute User user) throws Exception {
	boolean flag = service.register(user);
	return flag;
} 
/**
 * 登陆界面
 * @param user
 * @param session
 * @return
 * @throws Exception
 */
@RequestMapping(value = "/LoginUI", method = RequestMethod.GET)
public String LoginUI(@ModelAttribute User user,HttpSession session) throws Exception {
		System.out.println("loginUI");
		return "LoginHTML";
}
}
