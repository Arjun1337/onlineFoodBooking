package cn.wdn.obf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wdn.obf.dao.UserDAO;
import cn.wdn.obf.entity.User;
import cn.wdn.obf.service.LoginService;
@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	UserDAO dao;
	@Override
	public boolean register(User user) {
		int flag = dao.insertUser(user);
		if(flag==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean checkLogin(User user) {
		User dbUser;
		try{
			dbUser= dao.queryUserByAc(user.getuAccount());
		
		if(dbUser.getuAccount().equals(user.getuAccount())&&user.getuPwd().equals(dbUser.getuPwd())){
			return true;
		}
		}catch (NullPointerException e){
			return false;
		}
		return false;
	}

	@Override
	public boolean findPwd(String email) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getUserId(String account) {
		User dbUser;
		try{
			dbUser= dao.queryUserByAc(account);
		}catch (NullPointerException e){
			return -1;
		}
		return dbUser.getuId();
	}

	@Override
	public boolean checkSalerLogin(User user) {
		User dbUser;
		System.out.println("user:"+user.toString());
		try{
			dbUser= dao.queryUserByAc(user.getuAccount());
		System.out.println("dbUser:"+dbUser.toString());
		if(dbUser.getuAccount().equals(user.getuAccount())&&user.getuPwd().equals(dbUser.getuPwd())&&dbUser.getuPower()==2){
			System.out.println("checkSalerLogin true");
			return true;
		}
		return false;
		}catch (NullPointerException e){
			return false;
		}
	}

	@Override
	public boolean checkAdminLogin(User user) {
		User dbUser;
		System.out.println(user.toString());
		try{
			dbUser= dao.queryUserByAc(user.getuAccount());
		System.out.println(dbUser.toString());
		if(dbUser.getuAccount().equals(user.getuAccount())&&user.getuPwd().equals(dbUser.getuPwd())&&dbUser.getuPower()==0){
			return true;
		}
		return false;
		}catch (NullPointerException e){
			return false;
		}
	}

	@Override
	public User getUserById(int id) {
		return dao.queryOnlyUserById(id);
	}

}
