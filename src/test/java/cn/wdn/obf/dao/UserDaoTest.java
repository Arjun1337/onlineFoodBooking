package cn.wdn.obf.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import cn.wdn.obf.BaseTest;
import cn.wdn.obf.entity.User;

public class UserDaoTest extends BaseTest{
	@Autowired
    private UserDAO userDao;

   
    @Test
    public void testInsert() throws Exception {
    	User user = new User();
    	user.setuAccount("test");
    	user.setuPwd("123");
    	user.setuName("t");
    	user.setuAddress("address");
    	user.setuPhone("phone");
    	user.setuStreet("street");
    	user.setuPower(1);
    	int flag =userDao.insertUser(user);   	
    	System.out.println("insert"+flag);
    }
    @Test
    public void testUpdate() throws Exception {
    	User user = new User();
    	user.setuAccount("testUp");
    	user.setuPwd("123");
    	user.setuName("t");
    	user.setuAddress("address");
    	user.setuPhone("phone");
    	user.setuStreet("street");
    	user.setuPower(1);
    	user.setuId(1);
    	int flag =userDao.updateUser(user);   	
    	System.out.println("update"+flag);
    }
    @Test
    public void testQuery() throws Exception {
    	List<User> users = userDao.queryAllUser();
    	for(User user :users){
    		System.out.println(user.getComments().get(0).getCoContent());
    	}
    }
    @Test
    public void testDelete() throws Exception {
    	int flag = userDao.deleteUser(1);
    	System.out.println("delete:"+flag);
    }
}
