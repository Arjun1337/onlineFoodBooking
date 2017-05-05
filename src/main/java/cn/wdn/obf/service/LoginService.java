package cn.wdn.obf.service;

import cn.wdn.obf.entity.User;

public interface LoginService {
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public boolean register(User user);
	/**
	 * 检查用户登录
	 * @param user
	 * @return
	 */
	public boolean checkLogin(User user);
	/**
	 * 检查商家登陆
	 * @param user
	 * @return
	 */
	public boolean checkSalerLogin(User user);
	/**
	 * 找回密码 未实现
	 * @param email
	 * @return
	 */
	public boolean findPwd(String email);
	/**
	 * 获取用户id
	 * @param account
	 * @return
	 */
	public int getUserId(String account);
	/**
	 * 检查管理员登陆
	 * @param user
	 * @return
	 */
	public boolean checkAdminLogin(User user);
	User getUserById(int id);
}
