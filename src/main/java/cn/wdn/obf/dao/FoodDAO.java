package cn.wdn.obf.dao;

import cn.wdn.obf.entity.Food;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FoodDAO {

	/**
	 * 添加菜品
	 * @param store
	 * @return
	 */
    int insertFood(Food food);
    /**
     * 更新菜品
     * @param store
     * @return
     */
    int updateFood(Food food);
    /**
     * 用id删除菜品
     * @param id
     * @return
     */
    int deleteFood(int id);
    /**
     * 查找所有菜品
     * @param id
     * @return
     */
    List<Food> queryAllFood();
    /**
     * 通过fid获得food
     * @param id
     * @return
     */
    Food queryFoodById(@Param(value="fId")int id);
}