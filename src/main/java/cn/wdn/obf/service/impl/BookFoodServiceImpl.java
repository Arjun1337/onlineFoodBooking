package cn.wdn.obf.service.impl;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wdn.obf.dao.CartDAO;
import cn.wdn.obf.dao.CommentDAO;
import cn.wdn.obf.dao.OrderDAO;
import cn.wdn.obf.dao.StoreDAO;
import cn.wdn.obf.entity.Cart;
import cn.wdn.obf.entity.Comment;
import cn.wdn.obf.entity.Order;
import cn.wdn.obf.entity.Store;
import cn.wdn.obf.service.BookFoodService;
@Service
public class BookFoodServiceImpl implements BookFoodService {
	@Autowired
	StoreDAO sDao;
	@Autowired
	CartDAO cDao;
	@Autowired
	OrderDAO oDao;
	@Autowired
	CommentDAO coDao;
	@Override
	public List<Store> queryAllStore() {
		
		return sDao.queryAllStore();
	}

	@Override
	public Store queryStoreById(int id) {
		return sDao.queryStoreById(id);
	}

	@Override
	public boolean addCart(Cart cart) {
		int flag =  cDao.insertCart(cart);
		if(flag!=0){
			return true;
		}
		return false;
	}

	@Override
	public List<Cart> queryCartById(int id) {
		return cDao.queryCartByUid(id);
	}

	@Override
	public boolean delCartById(int id) {
		int flag = cDao.deleteCart(id);
		if(flag!=0){
			return true;
		}
		return false;
	}

	@Override
	public boolean buy(int id,double allPrice,int sid) {
		Store store = sDao.queryOnlyStore(sid);
		List<Cart> carts = cDao.queryCartByUid(id);
		int allsale = 0;
		if(carts.size()==0){
			return false;
		}
		StringBuffer detail = new StringBuffer();
		for(int i=0 ;i<carts.size();i++){
			detail.append(carts.get(i).getFood().getfName()+":"+carts.get(i).getCaNumber()+"|");
			cDao.updateNumber(carts.get(i).getCaId());
			allsale += carts.get(i).getCaNumber();
		}
		store.setsAllsale(store.getsAllsale()+allsale);
		int flag0 = sDao.updateStore(store);
		System.out.println(detail);
		Order order = new Order();
		order.setoDetail(detail.toString());
		Date date = new Date();
		DateFormat df = DateFormat.getDateInstance(DateFormat.FULL, Locale.CHINA);
		order.setoDate(df.format(date));
		order.setoPrice(allPrice);
		order.setoUid(id);
		order.setoSid(carts.get(0).getFood().getfSid());
		order.setoStatus("0");
		System.out.println(order.toString());
		int flag = oDao.insertOrder(order);
		if(flag!=0&&flag0!=0){
			cDao.deleteCartByUid(id);
			return true;
		}
		
		return false;
	}

	@Override
	public List<Order> getUserOrder(int id) {
		return oDao.getUserOrder(id);
	}

	@Override
	public boolean addComment(Comment comment) {
		int flag = coDao.insertComment(comment);
		int oId = comment.getCoOid();
		Store store = oDao.getOrderById(oId).getStore();
		int point = store.getsPoint();
		point = (point + comment.getCoPoint())/2;
		store.setsPoint(point);
		int flag2 = sDao.updateStore(store);
		System.out.println("oldpoint:"+point+"-newpoint:"+comment.getCoPoint());		
		if(flag!=0&&flag2!=0){
			return true;
		}
		
		return false;
	}

	@Override
	public Store queryOnlyStore(int id) {
		return sDao.queryOnlyStore(id);
	}

	@Override
	public List<Double> queryUserOrderPrice(int id) {
		return oDao.getUserPrice(id);
	}

}
