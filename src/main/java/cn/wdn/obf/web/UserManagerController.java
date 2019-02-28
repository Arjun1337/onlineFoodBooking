package cn.wdn.obf.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cn.wdn.obf.entity.Food;
import cn.wdn.obf.entity.User;
import cn.wdn.obf.service.UserManagerService;

@Controller
public class UserManagerController {
	Gson gson = new Gson();
	@Autowired
	UserManagerService service;
	/**
	 * 获取用户信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public Object getUserInfo(@RequestParam("uId") int id) throws Exception {
		
		User user = service.getUserById(id);
		String json =  gson.toJson(user);
		System.out.println("user"+json);
		return json;
	}
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modifyUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public Object modifyUserInfo(@ModelAttribute User user) throws Exception {
		
		boolean flag = service.modifyUser(user);
		return flag;
	}
	/**
	 * 修改密码
	 * @param session
	 * @param oPwd
	 * @param nPwd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modifyPwd", method = RequestMethod.POST)
	@ResponseBody
	public Object modifyPwd(HttpSession session,@RequestParam("oPwd") String oPwd,@RequestParam("nPwd") String nPwd) throws Exception {
		int id = Integer.parseInt(session.getAttribute("userId").toString());
		boolean flag = service.modifyPwd(oPwd, nPwd, id);
		return flag;
	}
}
