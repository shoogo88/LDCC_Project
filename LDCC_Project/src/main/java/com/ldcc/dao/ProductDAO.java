package com.ldcc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ldcc.model.ProductVO;

@Repository("ProductDAO")
public class ProductDAO {
	@Autowired(required=false)
	private SqlSession sqlSession;

	// selectProducts
	@SuppressWarnings("unchecked")
	public List<ProductVO> productList() throws Exception{
		return sqlSession.selectList("ProductDAO.selectProduct");
	}
	
	public ProductVO selectOneProduct(String pId) throws Exception{
		return sqlSession.selectOne("ProductDAO.selectOne",Integer.parseInt(pId));
	}
	
	//insertProduct
	@SuppressWarnings("unchecked")
	public void insertList(ProductVO vo) throws Exception{
		
		
		sqlSession.insert("ProductDAO.insertProduct",vo);
	}
	
	//updateProdcut
	@SuppressWarnings("unchecked")
	public void modifyList(ProductVO vo) throws Exception{
		
		sqlSession.update("ProductDAO.updateProduct",vo);
	}
	
	//deleteProduct
	@SuppressWarnings("unchecked")
	public void deleteList(int  pId) throws Exception{
		sqlSession.update("ProductDAO.deleteProduct",pId);
	}
	
	
}
