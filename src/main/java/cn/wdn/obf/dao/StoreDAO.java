package cn.wdn.obf.dao;

import cn.wdn.obf.entity.Store;
import cn.wdn.obf.entity.StoreResult;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface StoreDAO {
	/**
	 * 添加商家
	 * @param store
	 * @return
	 */
    int insertStore(Store store);
    /**
     * 更新商家
     * @param store
     * @return
     */
    int updateStore(Store store);
    /**
     * 用id删除商家
     * @param id
     * @return
     */
    int deleteStore(int id);
    /**
     * 查找所有商家
     * @param 
     * @return
     */
    List<Store> queryAllStore();
    /**
     * 通过店铺id查找店铺包含菜品
     * @param id
     * @return
     */
    Store queryStoreById(int id);
    /**
     * 通过用户id查找所属店铺
     * @param id
     * @return
     */
    List<Store> queryUserStore(@Param(value = "uId") int id );
    /**
     * 通过店铺id修改店铺状态
     * @param id
     * @param status
     * @return
     */
    int changeStoreStatus(@Param(value="sId")int id,@Param(value="sStatus") int status);
    /**
     * 仅查询店铺
     * @param id
     * @return
     */
    Store queryOnlyStore(@Param(value="sId") int id);
    /**
     * 用uId查询店铺销量
     * @param id
     * @return
     */
    List<StoreResult> getUserStoreAllsaler(@Param(value="uId")int id);
}