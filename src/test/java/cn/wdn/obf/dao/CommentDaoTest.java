package cn.wdn.obf.dao;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import cn.wdn.obf.BaseTest;
import cn.wdn.obf.entity.Comment;
import cn.wdn.obf.entity.Store;

public class CommentDaoTest  extends BaseTest{
	@Autowired
    private CommentDAO dao;

   
    @Test
    public void testInsert() throws Exception {
    	Comment co = new Comment();
    	co.setCoUid(2);
    	co.setCoOid(1);
    	co.setCoDate(new Date().toString());
    	int flag =dao.insertComment(co);   	
    	System.out.println("insert"+flag);
    }
    @Test
    public void testUpdate() throws Exception {
    	Comment co = new Comment();
    	co.setCoId(2);
    	co.setCoUid(2);
    	co.setCoOid(1);
    	co.setCoDate(new Date().toString());
    	int flag =dao.updateComment(co);   	
    	System.out.println("update"+flag);
    }
    @Test
    public void testQuery() throws Exception {
    	List<Comment> comments = dao.queryAllComment();
    	for(Comment comment :comments){
    		System.out.println(comment.getUser().getuName());
    	}
    }
    @Test
    public void testDelete() throws Exception {
    	int flag = dao.deleteComment(2);
    	System.out.println("delete:"+flag);
    }


}
