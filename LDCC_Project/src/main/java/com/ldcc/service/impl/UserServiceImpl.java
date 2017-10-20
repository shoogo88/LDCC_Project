package com.ldcc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ldcc.dao.UserDAO;
import com.ldcc.model.UserVO;
import com.ldcc.service.UserService;

@Service
public class UserServiceImpl  implements UserService{
	@Resource(name="UserDAO")
	private UserDAO dao;
	
	
	public List<UserVO> userList() throws Exception{
		return dao.userList();
	}
	public UserVO selectOne(String uId) throws Exception{
		return dao.selectOne(uId);
		
	
	}
	@Override
	public void registUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.registUser(vo);
	}
	
}
