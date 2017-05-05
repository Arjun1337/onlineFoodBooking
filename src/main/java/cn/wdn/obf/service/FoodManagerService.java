package cn.wdn.obf.service;

import java.util.List;

import cn.wdn.obf.entity.Comment;
import cn.wdn.obf.entity.Food;
import cn.wdn.obf.entity.Order;
import cn.wdn.obf.entity.Store;
import cn.wdn.obf.entity.StoreResult;

public interface FoodManagerService {
	/**
	 * 获取用户的所有店铺
	 * @param id
	 * @return
	 */
	List<Store> getUserStore(int id);
	/**
	 * 通过菜品id删除菜品
	 * @param fId
	 * @return
	 */
	boolean delFood(int fId);
	/**
	 * 通过菜品id修改菜品
	 * @param fId
	 * @return
	 */
	boolean modifyFood(Food food);
	/**
	 * 添加菜品
	 * @param sId
	 * @return
	 */
	boolean addFood(Food food);
	/**
	 * 通过店铺id获取订单
	 * @param id
	 * @return
	 */
	List<Order> getStoreOrder(int id);
	/**
	 * 获取用户下属店铺所有订单
	 * @return
	 */
	List<Order> getAllStoreOrder(int uId);
	/**
	 * 通过订单id递增status
	 * @param stauts
	 * @param id
	 * @return
	 */
	boolean changeStatus(String status,int id);
	/**
	 * 获得订单的评论
	 * @param sid
	 * @return
	 */
	List<Comment> getOrderComment(int oid);
	/**
	 * 获取店铺所有评论
	 * @param sid
	 * @return
	 */
	List<Comment> getStoreComment(int sid);
	/**
	 * 通过id获得store
	 * @param id
	 * @return
	 */
	Store getStoreById(int id);
	/**
	 * 修改店铺
	 * @param store
	 * @return
	 */
	boolean modifyStore(Store store);
	/**
	 * 通过id修改状态为status
	 * @param sid
	 * @param sStatus
	 * @return
	 */
	boolean changeStoreStatus(int sid,int sStatus);
	/**
	 * 添加店铺
	 * @param store
	 * @return
	 */
	boolean addStore(Store store);
	/**
	 * 通过用户id获得所属店铺所有销量
	 * @param id
	 * @return
	 */
	List<StoreResult> getUserStoreAllsaler(int id);
	/**
	 * 通过fid获得food
	 * @param id
	 * @return
	 */
	Food getFoodById(int id);
}
