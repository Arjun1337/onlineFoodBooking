package cn.wdn.obf.dao;

import cn.wdn.obf.entity.Cart;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CartDAO {
	/**
	 * 添加购物车
	 * @param cart
	 * @return
	 */
    int insertCart(Cart cart);
    /**
     * 更新购物车
     * @param cart
     * @return
     */
    int updateCart(Cart cart);
    /**
     * 用id删除购物车
     * @param id
     * @return
     */
    int deleteCart( @Param(value = "caId") int id);
    /**
     * 查找所有购物车
     * @param id
     * @return
     */
    List<Cart> queryAllCart();
    /**
     * 通过用户id查找所属购物车
     * @param id
     * @return
     */
    List<Cart> queryCartByUid(@Param(value = "caId") int id);
    /**
     * 用用户id删除购物车
     * @param id
     * @return
     */
    int deleteCartByUid( @Param(value = "uId") int id);
    /**
     * 更新food总量通过购物车id
     * @param id
     * @return
     */
    boolean updateNumber(@Param(value = "caId") int id);
}