package cn.wdn.obf.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import cn.wdn.obf.BaseTest;
import cn.wdn.obf.entity.Food;
import cn.wdn.obf.entity.Store;

public class FoodDaoTest extends BaseTest{
	@Autowired
    private FoodDAO dao;

   
    @Test
    public void testInsert() throws Exception {
    	Food food = new Food();
    	food.setfName("ddd");
    	food.setfSid(1);
    	int flag =dao.insertFood(food);   	
    	System.out.println("insert"+flag);
    }
    @Test
    public void testUpdate() throws Exception {
    	Food food = new Food();
    	food.setfId(3);
    	food.setfSid(1);
    	food.setfName("sss");
    	int flag =dao.updateFood(food);   	
    	System.out.println("update"+flag);
    }
    @Test
    public void testQuery() throws Exception {
    	List<Food> foods = dao.queryAllFood();
    	for(Food food :foods){
    		System.out.println(food.getfSid());
    	}
    }
    @Test
    public void testDelete() throws Exception {
    	int flag = dao.deleteFood(3);
    	System.out.println("delete:"+flag);
    }


}