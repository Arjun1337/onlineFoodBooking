package cn.wdn.obf.dao;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import cn.wdn.obf.BaseTest;
import cn.wdn.obf.entity.Order;
import cn.wdn.obf.entity.Store;

public class OrderDaoTest  extends BaseTest{
	@Autowired
    private OrderDAO dao;

   
    @Test
    public void testInsert() throws Exception {
    	Order order = new Order();
    	order.setoUid(2);
//    	order.setoFid(1);
//    	order.setoNumber(222);
    	order.setoDate(new Date().toString());
    	int flag =dao.insertOrder(order);   	
    	System.out.println("insert"+flag);
    }
    @Test
    public void testUpdate() throws Exception {
    	Order order = new Order();
    	order.setoId(2);
    	order.setoUid(2);
//    	order.setoFid(1);
//    	order.setoNumber(222333);
    	order.setoDate(new Date().toString());
    	int flag =dao.updateOrder(order);   	
    	System.out.println("update"+flag);
    }
    @Test
    public void testQuery() throws Exception {
    	List<Order> orders = dao.queryAllOrder();
    	for(Order order :orders){
    		System.out.println(order.getUser().getuId());
    	}
    }
    @Test
    public void testDelete() throws Exception {
    	int flag = dao.deleteOrder(7);
    	System.out.println("delete:"+flag);
    }


}

