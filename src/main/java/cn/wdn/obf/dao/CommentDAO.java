package cn.wdn.obf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.wdn.obf.entity.Comment;

public interface CommentDAO {
	/**
	 * 添加评论
	 * @param comment
	 * @return
	 */
    int insertComment(Comment comment);
    /**
     * 更新评论
     * @param comment
     * @return
     */
    int updateComment(Comment comment);
    /**
     * 用id删除评论
     * @param id
     * @return
     */
    int deleteComment(int id);
    /**
     * 查找所有评论
     * @param id
     * @return
     */
    List<Comment> queryAllComment();
    /**
     * 通过订单id找评论
     * @param id
     * @return
     */
    List<Comment> queryCommentByOid(@Param(value="oId") int id);
    /**
     * 查找店铺下所有评论
     * @param id
     * @return
     */
    List<Comment> queryCommentBySid(@Param(value="sId") int id);
}