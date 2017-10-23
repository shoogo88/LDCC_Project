package com.ldcc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.ldcc.model.ProductVO;
import javax.servlet.http.*;


public interface ProductService {
	@Autowired(required =false)

	public List<ProductVO> productList() throws Exception;
	public ProductVO selectOne(String pId) throws Exception;
	public void modifyProduct(ProductVO vo) throws Exception;
	public void deleteProduct(int  pId) throws Exception;
	public void insertProduct(ProductVO vo) throws Exception;
	
}
