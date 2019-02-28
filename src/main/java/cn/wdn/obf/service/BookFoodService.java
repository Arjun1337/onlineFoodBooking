package cn.wdn.obf.service;

import java.util.List;

import cn.wdn.obf.entity.Cart;
import cn.wdn.obf.entity.Comment;
import cn.wdn.obf.entity.Order;
import cn.wdn.obf.entity.Store;
public interface BookFoodService {
	/**
	 * 查询所有店铺
	 * @return 所有店铺
	 */
	List<Store> queryAllStore();
	/**
	 * 通过id查找店铺包含菜品
	 * @param id
	 * @return
	 */
	Store queryStoreById(int id);
	/**
	 * 添加到购物车
	 * @param cart
	 * @return
	 */
	boolean addCart(Cart cart);
	/**
	 * 通过用户id查所属的购物车
	 * @param id
	 * @return
	 */
	List<Cart> queryCartById(int id);
	/**
	 * 通过购物车id删除购物车项
	 * @param id
	 * @return
	 */
	boolean delCartById(int id);
	/**
	 * 结算购物车
	 * @param id
	 * @return
	 */
	boolean buy(int id,double allPrice,int sid);
	/**
	 * 通过用户id获取所属订单
	 * @param id
	 * @return
	 */
	List<Order> getUserOrder(int id);
	/**
	 * 添加评论
	 * @param comment
	 * @return
	 */
	boolean addComment(Comment comment);
	/**
	 * 仅查找店铺
	 * @param id
	 * @return
	 */
	Store queryOnlyStore(int id);
	/**
	 * 通过用户id查找用户所有订单的价格数组
	 * @param id
	 * @return
	 */
	List<Double> queryUserOrderPrice(int id);
}
