package com.ldcc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ldcc.model.UserVO;

@Repository("UserDAO")
public class UserDAO {
	@Autowired(required=false)
	private SqlSession sqlSession;

	// selectMember
	@SuppressWarnings("unchecked")
	public List<UserVO> userList() throws Exception{
		return sqlSession.selectList("UserDAO.selectUserList");
	}
	
	 public UserVO selectOne(String uId) throws Exception{
			return sqlSession.selectOne("userDAO.selectUserOne", uId);
	 }
	 
	 
		@SuppressWarnings("unchecked")
	 public void registUser(UserVO vo) throws Exception{


		 sqlSession.insert("UserDAO.registUser", vo);
	 }
		
	 public void insertBasket(String pId) throws Exception{
		 sqlSession.insert("UserDAO", pId);
	 }
	 
	 public void modifyBasket(String pId, int count) throws Exception{
		 sqlSession.update("userDAO", pId);
	 }
	 
	 public void deleteBasket(String pId, int count) throws Exception{
		 sqlSession.update("userDAO", pId);
	 }
	 
	 public UserVO login(UserVO vo) throws Exception{
		
		 
		 return sqlSession.selectOne("UserDAO.loginCheck",vo );
		 
		
	 }
	 
}
