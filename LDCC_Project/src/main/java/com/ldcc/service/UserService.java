package com.ldcc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ldcc.model.UserVO;

public interface UserService {
	@Autowired(required =false)

	public List<UserVO> userList() throws Exception;
	public UserVO selectOne(String uId) throws Exception;
	public void registUser(UserVO vo) throws Exception;
}
