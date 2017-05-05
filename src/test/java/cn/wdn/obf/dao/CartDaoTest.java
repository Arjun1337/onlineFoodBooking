package cn.wdn.obf.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import cn.wdn.obf.BaseTest;
import cn.wdn.obf.entity.Cart;
import cn.wdn.obf.entity.Store;

public class CartDaoTest extends BaseTest{
	@Autowired
    private CartDAO dao;

   
    @Test
    public void testInsert() throws Exception {
    	Cart cart = new Cart();
    	cart.setCaFid(1);
    	cart.setCaUid(2);
    	cart.setCaNumber(222);
    	int flag =dao.insertCart(cart);   	
    	System.out.println("insert"+flag);
    }
    @Test
    public void testUpdate() throws Exception {
    	Cart cart = new Cart();
    	cart.setCaId(2);
    	cart.setCaFid(1);
    	cart.setCaUid(2);
    	cart.setCaNumber(22332);
    	int flag =dao.updateCart(cart);  
    	System.out.println("update"+flag);
    }
    @Test
    public void testQuery() throws Exception {
    	List<Cart> carts = dao.queryAllCart();
    	for(Cart cart :carts){
    		System.out.println(cart.getFood().getfName());
    	}
    }
    @Test
    public void testDelete() throws Exception {
    	int flag = dao.deleteCart(4);
    	System.out.println("delete:"+flag);
    }


}