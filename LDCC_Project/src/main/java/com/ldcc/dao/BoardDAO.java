package com.ldcc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ldcc.model.BoardVO;
import com.ldcc.model.ProductVO;

@Repository("BoardDAO")
public class BoardDAO {
	@Autowired(required=false)
	private SqlSession sqlSession;

	// selectProducts
	@SuppressWarnings("unchecked")
	public List<BoardVO> productList() throws Exception{
		
		return sqlSession.selectList("BoardDAO.selectBoard");
	}
	@SuppressWarnings("unchecked")
	public BoardVO selectOne(String bId) throws Exception{
		
		return sqlSession.selectOne("BoardDAO.selectOneBoard",Integer.parseInt( bId));
	}
	public void writeBoard(BoardVO vo) {
		sqlSession.insert("BoardDAO.writeBoard", vo);
		// TODO Auto-generated method stub
		
	}
	public void addHit(String bId) {
		sqlSession.update("BoardDAO.addHit", bId);
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
