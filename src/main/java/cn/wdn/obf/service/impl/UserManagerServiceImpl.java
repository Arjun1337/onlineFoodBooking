package cn.wdn.obf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wdn.obf.dao.UserDAO;
import cn.wdn.obf.entity.User;
import cn.wdn.obf.service.UserManagerService;
@Service
public class UserManagerServiceImpl implements UserManagerService{
	@Autowired
	UserDAO uDao;
	@Override
	public User getUserById(int id) {
		return uDao.queryOnlyUserById(id);
	}
	@Override
	public boolean modifyUser(User user) {
		int flag = uDao.updateUser(user);
		if(flag!=0){
			return true;
		}
		return false;
	}
	@Override
	public boolean modifyPwd(String oPwd, String nPwd,int id) {
		User user = uDao.queryOnlyUserById(id);
		if(user.getuPwd().equals(oPwd)){
			int flag = uDao.updatePwd(id, nPwd);
			if(flag!=0){
				return true;
			}
			return false;
		}
		return false;
	}

}
