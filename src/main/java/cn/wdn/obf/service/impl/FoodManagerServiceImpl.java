package cn.wdn.obf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wdn.obf.dao.CommentDAO;
import cn.wdn.obf.dao.FoodDAO;
import cn.wdn.obf.dao.OrderDAO;
import cn.wdn.obf.dao.StoreDAO;
import cn.wdn.obf.dao.UserDAO;
import cn.wdn.obf.entity.Comment;
import cn.wdn.obf.entity.Food;
import cn.wdn.obf.entity.Order;
import cn.wdn.obf.entity.Store;
import cn.wdn.obf.entity.StoreResult;
import cn.wdn.obf.entity.User;
import cn.wdn.obf.service.FoodManagerService;
@Service
public class FoodManagerServiceImpl implements FoodManagerService {
	@Autowired
	StoreDAO sDao;
	@Autowired
	FoodDAO fDao;
	@Autowired
	OrderDAO oDao;
	@Autowired
	CommentDAO coDao;
	@Autowired
	UserDAO uDao;
	@Override
	public List<Store> getUserStore(int id) {
		return sDao.queryUserStore(id);
	}
	@Override
	public boolean delFood(int fId) {
		int flag = fDao.deleteFood(fId);
		if(flag!=0){
			return true;
		}
		return false;
	}
	@Override
	public boolean modifyFood(Food food) {
		int flag = fDao.updateFood(food);
		if(flag!=0){
			return true;
		}
		return false;
	}
	@Override
	public boolean addFood(Food food) {
		int flag = fDao.insertFood(food);
		if(flag!=0){
			return true;
		}
		return false;
	}
	@Override
	public List<Order> getStoreOrder(int id) {
		return oDao.queryOrderBySid(id);
	}
	@Override
	public boolean changeStatus(String status, int id) {
		int istatus = Integer.parseInt(status);
		istatus++;
		int flag = oDao.changeStatus(id, String.valueOf(istatus));
		if(flag!=0){
			return true;
		}
		return false;
	}
	@Override
	public List<Comment> getOrderComment(int oid) {
		return coDao.queryCommentByOid(oid);
	}
	@Override
	public List<Order> getAllStoreOrder(int uId) {
		
		return oDao.queryAllStoreOrder(uId);
	}
	@Override
	public List<Comment> getStoreComment(int sid) {
		return coDao.queryCommentBySid(sid);
	}
	@Override
	public Store getStoreById(int id) {
		return sDao.queryOnlyStore(id);
	}
	@Override
	public boolean modifyStore(Store store) {
		
		int flag = sDao.updateStore(store);
		if(flag!=0){
			return true;
		}
		return false;
	}
	@Override
	public boolean changeStoreStatus(int sid,int sStatus) {
		User user = uDao.queryUserBySid(sid);
		if(sStatus==1&&user.getuPower()==1){
			user.setuPower(2);
			uDao.updateUser(user);
		}
		int flag = sDao.changeStoreStatus(sid, sStatus);
		if(flag!=0){
			return true;
		}
		return false;
	}
	@Override
	public boolean addStore(Store store) {
		int flag = sDao.insertStore(store);
		if(flag!=0){
			return true;
		}
		return false;
	}
	@Override
	public List<StoreResult> getUserStoreAllsaler(int id) {
		return sDao.getUserStoreAllsaler(id);
	}
	@Override
	public Food getFoodById(int id) {
		return fDao.queryFoodById(id);
	}

}
