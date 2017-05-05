package cn.wdn.obf.dao;

import cn.wdn.obf.entity.User;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserDAO {
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
    int insertUser(User user);
    /**
     * 更新用户
     * @param user
     * @return
     */
    int updateUser(User user);
    /**
     * 用id删除用户
     * @param id
     * @return
     */
    int deleteUser(int id);
    /**
     * 查找所有用户
     * @param id
     * @return
     */
    List<User> queryAllUser();
    /**
     * 通过ID查找用户
     * @param id
     * @return
     */
    User queryUserById(int id);
    /**
     * 仅查询用户 不带外键
     * @param id
     * @return
     */
    User queryOnlyUserById(@Param(value = "uId") int id);
    /**
     * 通过账号查找用户
     * @param account
     * @return
     */
    User queryUserByAc(String account);
    /**
     * 更改密码
     * @param id
     * @param pwd
     * @return
     */
    int updatePwd(@Param(value="uId")int id,@Param(value="uPwd") String pwd);
    /**
     * 通过sid查用户
     * @param id
     * @return
     */
    User queryUserBySid(@Param(value="sId")int id);
}