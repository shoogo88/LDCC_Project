package com.ldcc.controller;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.ldcc.model.BoardVO;
import com.ldcc.model.ProductVO;
import com.ldcc.model.UserVO;
import com.ldcc.service.BoardService;
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
	private ProductService pService; 
		
	@Autowired(required =false)
	private UserService uService;
	@Autowired(required =false)
	private BoardService bService;
	
	
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		List<UserVO> userList = uService.userList();
		
		model.addAttribute("userList", userList);
		
		return "home";
	}
	
	//regist user Page
	@RequestMapping(value = "/registUser", method = {RequestMethod.GET, RequestMethod.POST})
	public String registUser() throws Exception {
		return "user/userRegist";
		}
	
	//regist Page
		@RequestMapping(value = "/registUserAction", method = RequestMethod.POST)
		public String registUserAction(UserVO vo) throws Exception {

			uService.registUser(vo);
			return "home";
			}
		
		//regist user Page
		@RequestMapping(value = "/loginPage", method = {RequestMethod.GET, RequestMethod.POST})
		public String login(String uId, String uPwd) throws Exception {
			
			return "user/login";
			}
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String loginAction(HttpSession session, UserVO dto) throws Exception {
			//System.out.println(uId +""+ uPwd  );
			UserVO vo = uService.login(dto);
						
			if ( session.getAttribute("login") != null ){
	            // 기존에 login이란 세션 값이 존재한다면
	            session.removeAttribute("login"); // 기존값을 제거해 준다.
	        }
						
		//	if ( vo != null ){ // 로그인 성공
	       if(vo!= null) {
			session.setAttribute("login", vo); // 세션에 login인이란 이름으로 UserVO 객체를 저장해 놈.
	            
	        }else { // 로그인에 실패한 경우
	            return "redirect:loginPage"; // 로그인 폼으로 다시 가도록 함
	        }



			
			return "redirect:product";
			}
	
	
	@RequestMapping(value = "/product", method = {RequestMethod.GET, RequestMethod.POST})
	public String product(Model model) throws Exception {
		List<ProductVO> productList = pService.productList();
		model.addAttribute("productList", productList);
		
		return "memberList";
	}
	
	

	
	
	//productDetail Page
	 @RequestMapping("/productDetail")
	    public String  productDetail(HttpServletRequest request, Model model) throws Exception {
		 
		 ProductVO oneProduct = pService.selectOne(String.valueOf(request.getParameter("pId")));
		 model.addAttribute("oneProduct", oneProduct);
	        return "product/productDetail2";
	 }
	 
	 //prodcut Modify Page
	 @RequestMapping(value = "/productModify",  method ={RequestMethod.GET, RequestMethod.POST})
	    public String  productModify(HttpServletRequest request, Model model) throws Exception {
		 ProductVO oneProduct = pService.selectOne(String.valueOf(request.getParameter("pId")));
		 model.addAttribute("oneProduct", oneProduct);
	     return "product/productModify2";
	 }
	 
	 //modify Action
	 @RequestMapping(value = "/modify", method = {RequestMethod.GET, RequestMethod.POST})
		public String modifyAction(ProductVO vo) throws Exception {
		 pService.modifyProduct(vo);
		 
		 return "redirect:product";
	 }
	 //deletde Action
	 @RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String deleteAction(@RequestParam int pId) throws Exception {
		 pService.deleteProduct(pId);
		 
		 return "redirect:product";
	 }
	 
	 
	 
	
	//open regist Page
	@RequestMapping(value = "/registPage", method = {RequestMethod.GET, RequestMethod.POST})
	public String registProductPage(HttpServletRequest request, Model model) throws Exception {
		
		
		
		return "product/tester";
	}
	//open regist Page
		@RequestMapping(value = "/test", method = RequestMethod.GET)
		public String lotteMain(HttpServletRequest request, Model model) throws Exception {
			
			
			return "test";
		}
	
		
	
	//-product registAction
	@RequestMapping(value = "/regist", method = {RequestMethod.POST, RequestMethod.GET})
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
	
	
	//open regist Page-zmdm
	
			@RequestMapping(value = "/boardTest", method = RequestMethod.GET)
			public String boardListed(Model model) throws Exception {
				
				List<BoardVO> bList = bService.productList();
				
				model.addAttribute("boardList", bList);
				return "board/boardList";
			}
			
			@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
			public String boardDetail(HttpServletRequest request, Model model) throws Exception {
				
				 BoardVO boardView = bService.  selectOne(request.getParameter("bId"));
				 model.addAttribute("boardView", boardView);
			
				 
				return "board/boardDetail";
			}
			@RequestMapping(value = "/boardWritePage", method = RequestMethod.GET)
			public String boardWritePage() throws Exception {
				
				 
				return "board/boardWrite";
			}
			
			@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
			public String boardWrite(BoardVO vo) throws Exception {
				System.out.println(vo.getbContent());
				 
				return "board/boardTest";
			}
}
