package cn.wdn.obf.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import cn.wdn.obf.entity.Comment;
import cn.wdn.obf.entity.Food;
import cn.wdn.obf.entity.Order;
import cn.wdn.obf.entity.Store;
import cn.wdn.obf.entity.StoreResult;
import cn.wdn.obf.entity.User;
import cn.wdn.obf.service.FoodManagerService;
@Controller
public class FoodManagerController {
	Gson gson = new Gson();
	@Autowired
	FoodManagerService service;
	/**
	 * 获取用户所属店铺
	 * @param user
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getUserStore", method = RequestMethod.GET)
	@ResponseBody
	public Object getUserStore(@ModelAttribute User user,HttpSession session) throws Exception {
		
		int uId = Integer.parseInt(session.getAttribute("userId").toString());
		
		List<Store> list = service.getUserStore(uId);
		String json =  gson.toJson(list);
		System.out.println(json);
		return json;
	}
	/**
	 * 删除菜品
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delFood", method = RequestMethod.GET)
	@ResponseBody
	public boolean delFood(@RequestParam("fId") int id) throws Exception {
		boolean flag = service.delFood(id);
		if(flag){
			return true;
		}
		return false;
	}
	/**
	 * 通过菜品对象更新菜品图片
	 * @param food
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modifyFoodImg",method = RequestMethod.POST)
	@ResponseBody
	public boolean modifyFoodImg(@RequestParam("fId") int id,@RequestParam(value="Img",required=false) MultipartFile file,  
            HttpServletRequest request) throws Exception {
		Food food = service.getFoodById(id);
		//获得物理路径webapp所在路径  
        String pathRoot = request.getSession().getServletContext().getRealPath("");  
        String path="";  
        if(!file.isEmpty()){  
            //生成uuid作为文件名称  
            String uuid = UUID.randomUUID().toString().replaceAll("-","");  
            //获得文件类型（可以判断如果不是图片，禁止上传）  
            String contentType=file.getContentType();  
            //获得文件后缀名称  
            String imageName=contentType.substring(contentType.indexOf("/")+1);  
            path="resources/images/store/"+uuid+"."+imageName; 
            File newFile = new File(pathRoot+path);
            if(!newFile.exists()){
            	newFile.mkdirs();
            }
            file.transferTo(newFile);  
        }  
        System.out.println(path);
        food.setfImg(path);
		boolean flag = service.modifyFood(food);
		if(flag){
			return true;
		}
		return false;
	}
	/**
	 * 添加菜品
	 * @param food
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addFood", method = RequestMethod.POST)
	@ResponseBody
	public boolean addFood(@ModelAttribute Food food,@RequestParam(value="Img",required=false) MultipartFile file,  
            HttpServletRequest request) throws Exception {
		 //获得物理路径webapp所在路径  
        String pathRoot = request.getSession().getServletContext().getRealPath("");  
        String path="";  
        if(!file.isEmpty()){  
            //生成uuid作为文件名称  
            String uuid = UUID.randomUUID().toString().replaceAll("-","");  
            //获得文件类型（可以判断如果不是图片，禁止上传）  
            String contentType=file.getContentType();  
            //获得文件后缀名称  
            String imageName=contentType.substring(contentType.indexOf("/")+1);  
            path="resources/images/store/"+uuid+"."+imageName; 
            File newFile = new File(pathRoot+path);
            if(!newFile.exists()){
            	newFile.mkdirs();
            }
            file.transferTo(newFile);  
        }  
        System.out.println(path);
        food.setfImg(path);
		boolean flag = service.addFood(food);
		if(flag){
			return true;
		}
		return false;
	}
	/**
	 * 获取店铺下订单
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getStoreOrder", method = RequestMethod.GET)
	@ResponseBody
	public Object getStoreOrder(HttpSession session,@RequestParam("sId") int id) throws Exception {
		
		List<Order> list = service.getStoreOrder(id);
		String json =  gson.toJson(list);
		System.out.println(json);
		return json;
	}
	/**
	 * 查询用户所属店铺的所有订单
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getAllOrder", method = RequestMethod.GET)
	@ResponseBody
	public Object getStoreOrder(HttpSession session) throws Exception {
		int uId = Integer.parseInt(session.getAttribute("userId").toString());
		List<Order> list = service.getAllStoreOrder(uId);
		String json =  gson.toJson(list);
		System.out.println(json);
		return json;
	}
	/**
	 * 改变订单状态
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/changeStatus", method = RequestMethod.GET)
	@ResponseBody
	public boolean changeStatus(@RequestParam("oId") int id,@RequestParam("status") String status) throws Exception {
		System.out.println(status);
		boolean flag = service.changeStatus(status, id);
		if(flag){
			return true;
		}
		return false;
	}
	/**
	 * 获得店铺评论
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getStoreComment", method = RequestMethod.GET)
	@ResponseBody
	public Object getStoreComment(@RequestParam("sId") int id)  {
		
		List<Comment> list = service.getStoreComment(id);
		String json =  gson.toJson(list);
		System.out.println("com"+json);
		return json;
	}
	/**
	 * 修改店铺资料
	 * @param store
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modifyStore", method = RequestMethod.POST)
	@ResponseBody
	public Object modifyStore(@ModelAttribute Store store) throws Exception {
		Store dbStore = service.getStoreById(store.getsId());
		dbStore.setsName(store.getsName());
		dbStore.setsDesc(store.getsDesc());
		dbStore.setsAddress(store.getsAddress());
		dbStore.setsStarttime(store.getsStarttime());
		dbStore.setsEndtime(store.getsEndtime());
		boolean flag = service.modifyStore(dbStore);
		return flag;
	}
	/**
	 * 修改food
	 * @param food
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modifyFood", method = RequestMethod.POST)
	@ResponseBody
	public Object modifyFood(@ModelAttribute Food food) throws Exception {
		Food dbFood = service.getFoodById(food.getfId());
		dbFood.setfDesc(food.getfDesc());
		dbFood.setfName(food.getfName());
		dbFood.setfNumber(food.getfNumber());
		dbFood.setfPrice(food.getfPrice());
		dbFood.setfSid(food.getfSid());
		boolean flag = service.modifyFood(dbFood);
		return flag;
	}
	/**
	 * 修改店铺图片
	 * 
	 * @param sId
	 * @param file
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modifyStoreImg", method = RequestMethod.POST)
	@ResponseBody
	public boolean modifyStoreImg(@RequestParam("sId") int sId, @RequestParam(value="Img",required=false) MultipartFile file,  
            HttpServletRequest request) throws Exception {
		
		Store store = service.getStoreById(sId);
		//获得物理路径webapp所在路径  
        String pathRoot = request.getSession().getServletContext().getRealPath("");  
        String path="";  
        if(!file.isEmpty()){  
            //生成uuid作为文件名称  
            String uuid = UUID.randomUUID().toString().replaceAll("-","");  
            //获得文件类型（可以判断如果不是图片，禁止上传）  
            String contentType=file.getContentType();  
            //获得文件后缀名称  
            String imageName=contentType.substring(contentType.indexOf("/")+1);  
            path="resources/images/store/"+uuid+"."+imageName; 
            File newFile = new File(pathRoot+path);
            if(!newFile.exists()){
            	newFile.mkdirs();
            }
            file.transferTo(newFile);  
        }  
        System.out.println(path);
        store.setsImg(path);
//        store.setsName(sName);
//        store.setsDesc(sDesc);
		boolean flag = service.modifyStore(store);
		if(flag){
			return true;
		}
		return false;
	}
	/**
	 * 修改店铺状态
	 * @param id
	 * @param status
	 * @return
	 */
	@RequestMapping(value = "/changeStoreStatus", method = RequestMethod.GET)
	@ResponseBody
	public boolean changeStoreStatus(@RequestParam("sId") int id,@RequestParam(value="sStatus") int status )  {
		
		boolean flag = service.changeStoreStatus(id, status);
		if(flag){
			return true;
		}
		return false;
	}
	@RequestMapping(value = "/getUserStoreAllSaler", method = RequestMethod.POST)
	@ResponseBody
	public Object getUserStoreAllSaler(HttpSession session)  {
		int uId = Integer.parseInt(session.getAttribute("userId").toString());
		List<StoreResult> sr = service.getUserStoreAllsaler(uId);
		return gson.toJson(sr);
		
	}
	/**
	 * 添加店铺
	 * @param store
	 * @param status
	 * @param file
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value = "/addStore", method = RequestMethod.POST)
	@ResponseBody
	public boolean addStore(@ModelAttribute Store store, @RequestParam(value="Img",required=false) MultipartFile[] file,  
            HttpServletRequest request ,HttpSession session) throws IllegalStateException, IOException  {
        String pathRoot = request.getSession().getServletContext().getRealPath("");  
        String path="";
        List<String> listImagePath=new ArrayList<String>();
        for (MultipartFile mf : file) {  
        	if(!mf.isEmpty()){  
        		String uuid = UUID.randomUUID().toString().replaceAll("-","");  
        		String contentType=mf.getContentType();  
        		String imageName=contentType.substring(contentType.indexOf("/")+1);  
        		path="resources/images/store/"+uuid+"."+imageName; 
        		File newFile = new File(pathRoot+path);
        		if(!newFile.exists()){
        			newFile.mkdirs();
        		}
        		mf.transferTo(newFile); 
        		listImagePath.add(path);  
        	}  
        }
        int uId = Integer.parseInt(session.getAttribute("userId").toString());
        store.setsUid(uId);
        store.setsCertimg(listImagePath.get(0));
        store.setsImg(listImagePath.get(1));
        store.setsStatus(0);
        store.setsAllsale(0.0);
        boolean flag = service.addStore(store);
		if(flag){
			return true;
		}
		return false;
	}
}
