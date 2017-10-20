package com.ldcc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import com.ldcc.dao.ProductDAO;
import com.ldcc.model.ProductVO;
import com.ldcc.service.ProductService;

@Service
public class ProductServiceImpl  implements ProductService{
	@Resource(name="ProductDAO")
	private ProductDAO dao;
	
	
	public List<ProductVO> productList() throws Exception{
		return dao.productList();
	}
	@Override
	public ProductVO selectOne(String pId) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOneProduct(pId);
	}
	 @Override
	public void insertProduct(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		 dao.insertList(vo);
	}
	 @Override
	public void modifyProduct(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		 dao.modifyList(vo);
	}
	 @Override
	public void deleteProduct(int  pId) throws Exception {
		// TODO Auto-generated method stub
		 dao.deleteList(pId);
	}
}
