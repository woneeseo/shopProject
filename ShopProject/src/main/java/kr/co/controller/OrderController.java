package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.CartDTO;
import kr.co.domain.MemberVO;
import kr.co.domain.ProductDTO;
import kr.co.service.CartService;
import kr.co.service.ProductService;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	@Inject
	private ProductService productService;
	
	@Inject
	private CartService cartService;
	
	@RequestMapping(value = "/mycart/{userid}")
	public String myCart(@PathVariable("userid") String userid, Model model, HttpSession session) {
		
		List<CartDTO> myCartList = cartService.myCartList(userid);
		List<ProductDTO> myProductList = cartService.myProductList(myCartList);
		
		Map<String, List> cartMap = new HashMap<String, List>();
		
		cartMap.put("myCartList", myCartList);
		cartMap.put("myProductList", myProductList);
		
		model.addAttribute("cartMap", cartMap);
		
		return "order/mycart";
	}
	
	@RequestMapping(value = "/cart/{productId}", method = RequestMethod.POST)
	public @ResponseBody String addGoodsInCart(@PathVariable("productId") String productId, HttpSession session) {
		
		MemberVO vo = (MemberVO) session.getAttribute("login");
		String userid = vo.getUserid();
		
		CartDTO cartDTO = new CartDTO();
		
		cartDTO.setUserid(userid);
		cartDTO.setProductId(productId);
		
		boolean istAlreadyExisted = cartService.findCartGoods(cartDTO);
		System.out.println("istAlreadyExisted : " + istAlreadyExisted);
		
		if (istAlreadyExisted) {
			return "already_existed";
		} else {
			cartService.addGoodsInCart(cartDTO);
			return "add_success";
		}

	}
	
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public List<ProductDTO> productList() {
		
		List<ProductDTO> list = productService.list();
		
		return list;
	}

}
