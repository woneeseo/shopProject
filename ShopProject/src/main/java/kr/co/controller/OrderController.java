package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.CartDTO;
import kr.co.domain.MemberVO;
import kr.co.domain.OrderDTO;
import kr.co.domain.ProductDTO;
import kr.co.service.CartService;
import kr.co.service.MemberService;
import kr.co.service.OrderService;
import kr.co.service.ProductService;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	@Inject
	private ProductService productService;
	
	@Inject
	private CartService cartService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private OrderService orderService;
	
	@RequestMapping(value = "/cartOrder", method = RequestMethod.POST)
	public void orderAllCartProduct(HttpSession session, OrderDTO orderDTO, 
			@RequestParam(value = "chd[]") List<String> myCartList) {
		MemberVO vo = (MemberVO) session.getAttribute("login");
		String userid = vo.getUserid();
		
		System.out.println(myCartList);
		System.out.println(userid);
		
		
		
	}
	
	@RequestMapping(value = "/orderResult", method = RequestMethod.POST)
	public String order(ProductDTO productDTO, MemberVO vo, Model model,
			@ModelAttribute("selected_Opt") String selected_Opt, 
			@ModelAttribute("order_Qty") String order_Qty,
			@ModelAttribute("deliver_msg") String deliver_msg,
			@ModelAttribute("totalAmount") String sTotalAmount,
			@ModelAttribute("cal_info") String cal_info,
			@ModelAttribute("detailAddress") String detailAddress,
			@ModelAttribute("getPoint") String sGetPoint) {
		
		OrderDTO orderDTO = new OrderDTO();
		
		
		productDTO = productService.read(productDTO.getProductId());
		
		orderDTO.setUserid(vo.getUserid());
		orderDTO.setUsername(vo.getUsername());
		orderDTO.setUseraddress(vo.getUseraddress() + " " + detailAddress);
		orderDTO.setEmail(vo.getEmail());
		orderDTO.setTel(vo.getTel());
		orderDTO.setPostcode(vo.getPostcode());
		
		int getPoint = Integer.parseInt(sGetPoint);
		orderDTO.setGetPoint(getPoint);
		
		orderDTO.setProductId(productDTO.getProductId());
		orderDTO.setProductName(productDTO.getProductName());
		orderDTO.setPrice(productDTO.getPrice());
		orderDTO.setProductDist(productDTO.getProductDist());
		orderDTO.setProductInfo(productDTO.getProductInfo());
		orderDTO.setFullname(productDTO.getFilename());
		orderDTO.setStock(productDTO.getStock());
		
		orderDTO.setSelected_Opt(selected_Opt);
		orderDTO.setOrder_Qty(order_Qty);
		orderDTO.setDeliver_msg(deliver_msg);
		orderDTO.setDeliver_situ(0);
		orderDTO.setCal_info(cal_info);
		
		int totalAmount = Integer.parseInt(sTotalAmount);
		orderDTO.setTotalAmount(totalAmount);

		
		orderService.insert(orderDTO);
		model.addAttribute("orderDTO", orderDTO);
	
		return "order/orderResult";

	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String orderInsert(ProductDTO productDTO, HttpSession session, Model model,
			@ModelAttribute("selected_Opt") String selected_Opt, @ModelAttribute("order_Qty") String order_Qty,
			@ModelAttribute("getPoint") String sGetPoint) {
		
		MemberVO vo = (MemberVO) session.getAttribute("login");
		vo = memberService.read(vo.getUserid());
		productDTO = productService.read(productDTO.getProductId());
		
		model.addAttribute("memberInfo", vo);
		model.addAttribute("productInfo", productDTO);
		model.addAttribute("order_Qty", order_Qty);
		model.addAttribute("selected_Opt", selected_Opt);
		
		int getPoint = Integer.parseInt(sGetPoint);
		model.addAttribute("getPoint", getPoint);
		
		
		return "order/orderconfirm";
	}

	
	@RequestMapping(value = "/mycart/{userid}", method = RequestMethod.GET)
	public String myCart(@PathVariable("userid") String userid, Model model) {
		
		Map<String, List> cartMap = cartService.getMyCart(userid);
	
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
