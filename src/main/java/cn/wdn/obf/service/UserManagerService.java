package cn.wdn.obf.service;

import cn.wdn.obf.entity.User;

public interface UserManagerService {
	/**
	 * 通过用户id获取用户
	 * @param id
	 * @return
	 */
	User getUserById(int id);
	/**
	 * 修改用户资料
	 * @param user
	 * @return
	 */
	boolean modifyUser(User user);
	/**
	 * 通过旧密码验证账号，判断为true更改为新密码
	 * @param oPwd
	 * @param nPwd
	 * @return
	 */
	boolean modifyPwd(String oPwd,String nPwd,int id );
}
