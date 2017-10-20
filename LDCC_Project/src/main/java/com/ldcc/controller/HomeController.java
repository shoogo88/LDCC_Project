package com.ldcc.controller;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;

import com.ldcc.model.ProductVO;
import com.ldcc.model.UserVO;
import com.ldcc.service.ProductService;
import com.ldcc.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired(required =false)
	private UserService uService;
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		List<UserVO> userList = uService.userList();
		
		model.addAttribute("userList", userList);
		
		return "test";
	}

	@Autowired(required =false)
	private ProductService pService; 
	
	@RequestMapping(value = "/product", method = {RequestMethod.GET, RequestMethod.POST})
	public String product(Locale locale, Model model) throws Exception {
		
		List<ProductVO> productList = pService.productList();
		model.addAttribute("productList", productList);
		
		return "memberList";
	}
	
	//productDetail Page
	 @RequestMapping("/productDetail")
	    public String  productDetail(HttpServletRequest request, Model model) throws Exception {
		 ProductVO oneProduct = pService.selectOne(String.valueOf(request.getParameter("pId")));
		 model.addAttribute("oneProduct", oneProduct);
	        return "product/productDetail";
	 }
	 
	 //prodcut Modify Page
	 @RequestMapping(value = "/productModify",  method = RequestMethod.GET)
	    public String  productModify(HttpServletRequest request, Model model) throws Exception {
		 ProductVO oneProduct = pService.selectOne(String.valueOf(request.getParameter("pId")));
		 model.addAttribute("oneProduct", oneProduct);
	     return "product/productModify";
	 }
	 
	 //modify Action
	 @RequestMapping(value = "/modify", method = RequestMethod.POST)
		public String modifyAction(ProductVO vo) throws Exception {
		 pService.modifyProduct(vo);
		 
		 return "redirect:product";
	 }
	 //modify Action
	 @RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String deleteAction(@RequestParam int pId) throws Exception {
		 pService.deleteProduct(pId);
		 
		 return "redirect:product";
	 }
	 
	 
	 
	
	//open regist Page
	@RequestMapping(value = "/registPage", method = RequestMethod.GET)
	public String registProductPage(HttpServletRequest request, Model model) throws Exception {
		
		
		return "product/productRegist";
	}
	//open regist Page
		@RequestMapping(value = "/lotte", method = RequestMethod.GET)
		public String lotteMain(HttpServletRequest request, Model model) throws Exception {
			
			
			return "lotteMain";
		}
	
		
	
	//registAction
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registProductAction(ProductVO vo) throws Exception {
		/*
		MultipartRequest multiReq;
		
		String fileName = "";
		if(!vo.getProductPhoto().isEmpty()) {
			fileName = vo.getProductPhoto().getOriginalFilename();
			String path = "C:\\Users\\DongHyuk_Lee\\Documents\\workspace-sts-3.9.1.RELEASE\\LDCC_Project\\src\\main\\resources\\image";
			
			try {
				new File(path).mkdir();
				vo.getProductPhoto().transferTo(new File(path+fileName));
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			vo.setpImagePath(fileName);
			
		}*/
		
		pService.insertProduct(vo);
		
		return "redirect:product";
	}
	
	
	
	
	
}
