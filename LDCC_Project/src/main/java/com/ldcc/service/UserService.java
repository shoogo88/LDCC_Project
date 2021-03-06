package com.ldcc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ldcc.model.UserVO;

public interface UserService {
	@Autowired(required =false)

	public List<UserVO> userList() throws Exception;
	public UserVO selectOne(String uId) throws Exception;
	public void registUser(UserVO vo) throws Exception;
	public void insertBasket(String pId) throws Exception;
	public void modifyBasket(String pId, int count) throws Exception;
	public void deleteBasket(String pId) throws Exception;
	public void searchID(String uMail) throws Exception;
	public void searchPW(String uMail, String callNum) throws Exception;
	
	public UserVO login(UserVO vo) throws Exception;
	
	
	
}
