package cn.wdn.obf.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cn.wdn.obf.entity.Cart;
import cn.wdn.obf.entity.Comment;
import cn.wdn.obf.entity.Food;
import cn.wdn.obf.entity.Order;
import cn.wdn.obf.entity.Store;
import cn.wdn.obf.entity.User;
import cn.wdn.obf.service.BookFoodService;

@Controller
public class BookFoodController {
	@Autowired
	BookFoodService service;
	Gson gson = new Gson();
	@RequestMapping(value = "/AllStore", method = RequestMethod.GET)
	public String AllStore() throws Exception {
		return "AllStore";
	}
	@RequestMapping(value = "/StoreManager", method = RequestMethod.GET)
	public String StoreManager() throws Exception {
		return "StoreManager";
	}
	/**
	 * 获取所有店铺
	 * @param user
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getAllStore", method = RequestMethod.GET)
	@ResponseBody
	public Object getAllStore(@ModelAttribute User user,HttpSession session) throws Exception {
		List<Store> list = service.queryAllStore();
		String json =  gson.toJson(list);
		System.out.println(json);
		return json;
	}
	/**
	 * 根据店铺id获取食物
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getFoodByStoreId", method = RequestMethod.GET)
	@ResponseBody
	public Object getFoodByStoreId(@RequestParam("sId") int id) throws Exception {
		Store store = service.queryStoreById(id);
//		List<Food> foods = null;
//		try{
//		foods = store.getFoods();
//		}catch(NullPointerException e){
//			return "false";
//		}
//		return gson.toJson(foods);
		if(store==null){
			System.out.println("only");
			return gson.toJson(service.queryOnlyStore(id));
		}
		System.out.println("store");

		return gson.toJson(store);
		
		
	}
	/**
	 * 添加到购物车
	 * @param cart
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addCart", method = RequestMethod.GET)
	@ResponseBody
	public boolean addCart(@ModelAttribute Cart cart,HttpSession session) throws Exception {
		int uId = Integer.parseInt(session.getAttribute("userId").toString());
		cart.setCaUid(uId);
		boolean flag = service.addCart(cart);
		if(flag){
			return true;
		
		}
		return false;
	}  
	/**
	 * 获取购物车内容
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getCart", method = RequestMethod.GET)
	@ResponseBody
	public Object getCart(HttpSession session) throws Exception {
		int uId = Integer.parseInt(session.getAttribute("userId").toString());
		List<Cart> carts = service.queryCartById(uId);
		String json = gson.toJson(carts);
		System.out.println(json);
		return json;
			
	}  
	/**
	 * 删除购物车内容
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delCart", method = RequestMethod.GET)
	@ResponseBody
	public boolean delCart(@RequestParam("caId") int id) throws Exception {
		boolean flag = service.delCartById(id);
		if(flag){
			
			return true;
		
		}
		return false;
	} 
	/**
	 * 购买
	 * @param session
	 * @param allPrice
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buy", method = RequestMethod.GET)
	@ResponseBody
	public boolean buy(HttpSession session,@RequestParam("allPrice") double allPrice,@RequestParam("sId") int sid) throws Exception {
		System.out.println("buy");
		int uId = Integer.parseInt(session.getAttribute("userId").toString());
		boolean flag = service.buy(uId, allPrice,sid);
		if(flag){
			return true;
		}
		return false;
	} 
	/**
	 * 鑾峰緱鐢ㄦ埛鎵�灞炶鍗�
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getUserOrder", method = RequestMethod.GET)
	@ResponseBody
	public Object getUserOrder(HttpSession session) throws Exception {
		int uId = Integer.parseInt(session.getAttribute("userId").toString());
		List<Order> list = service.getUserOrder(uId);
		String json = gson.toJson(list);
		System.out.println(json);
		return json;
	}
	/**
	 * 添加评论
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addComment", method = RequestMethod.POST)
	@ResponseBody
	public Object addComment(@ModelAttribute Comment comment) throws Exception {
		boolean flag = service.addComment(comment);
		if(flag){
			
			return true;
		
		}
		return false;
	}
	/**
	 * 获取店铺信息
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getStoreInfo", method = RequestMethod.POST)
	@ResponseBody
	public Object getStoreInfo(@RequestParam("sId") int id) throws Exception {
		Store store = service.queryOnlyStore(id);
		return gson.toJson(store);
	}
	/**
	 * 获取用户订单价格
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getUserOrderPrice", method = RequestMethod.POST)
	@ResponseBody
	public Object getUserOrderPrice(HttpSession session) throws Exception {
		int uId = Integer.parseInt(session.getAttribute("userId").toString());
		List<Double> prices = new ArrayList<Double>();
		prices = service.queryUserOrderPrice(uId);
		return gson.toJson(prices);
	}
}
