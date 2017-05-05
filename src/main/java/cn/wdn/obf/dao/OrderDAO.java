package cn.wdn.obf.dao;

import cn.wdn.obf.entity.Order;
import cn.wdn.obf.entity.Store;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OrderDAO {
	/**
	 * 添加订单
	 * @param order
	 * @return
	 */
    int insertOrder(Order order);
    /**
     * 更新订单
     * @param order
     * @return
     */
    int updateOrder(Order order);
    /**
     * 用id删除订单
     * @param id
     * @return
     */
    int deleteOrder(int id);
    /**
     * 查找所有订单
     * @param id
     * @return
     */
    List<Order> queryAllOrder();
    /**
     * 查询用户所属的店铺的订单
     * @param id
     * @return
     */
    List<Order> queryAllStoreOrder(@Param(value="uId") int id);
    /**
     * 通过店铺id查找所属订单
     * @param id
     * @return
     */
    List<Order> queryOrderBySid( @Param(value = "sId") int id);
    /**
     * 通过订单id改变订单状态
     * @param id
     * @param status
     * @return
     */
    int changeStatus(@Param(value="oId") int id ,@Param(value="oStatus") String status);
    /**
     * 通过用户id获取所属订单
     * @param id
     * @return
     */
    List<Order> getUserOrder(@Param(value="uId") int id );
    /**
     * 通过订单id找到该订单
     * @param id
     * @return
     */
    Order getOrderById(@Param(value="oId")int id);
    /**
     * 通过用户id查用户的订单的价格
     * @param id
     * @return
     */
    List<Double> getUserPrice(@Param(value="uId")int id);
}