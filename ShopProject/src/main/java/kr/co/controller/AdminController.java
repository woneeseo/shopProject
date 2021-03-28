package kr.co.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.BoardDTO;
import kr.co.domain.MemberVO;
import kr.co.domain.OrderDTO;
import kr.co.domain.PageTO;
import kr.co.domain.ProductDTO;
import kr.co.domain.SearchPageTO;
import kr.co.service.MemberService;
import kr.co.service.OrderService;
import kr.co.service.ProductService;
import kr.co.service.SBoardService;
import kr.co.util.FileUploadDownloadUtils;
import kr.co.util.MediaUtils;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private OrderService orderService;
	
	@Inject
	private SBoardService sBoardService;
	
	@ResponseBody
	@RequestMapping(value = "/memberDelete/{userid}", method = RequestMethod.POST)
	public int memberDelete(@PathVariable("userid") String userid) {
		
		int result = memberService.memberDelete(userid);	

		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateDelSitu", method = RequestMethod.POST)
	public int updateDelSitu(OrderDTO orderDTO) {
		
		boolean result = orderService.updateDelSitu(orderDTO);
		
		if (result) {
			return 1;
		} else {
			return 0;
		}
	}
	
	@RequestMapping(value = "/aboutOrder/{orderId}", method = RequestMethod.GET)
	public String aboutOrder(@PathVariable("orderId") String orderId, Model model) {
		
		List<OrderDTO> list = orderService.selectByOrderId(orderId);
		model.addAttribute("list", list);

		return "admin/aboutOrder";
	}
	
	@RequestMapping(value = "/orderedlist/{curPage}", method = RequestMethod.GET)
	public String orderedlist(Model model, @PathVariable("curPage") String sCurPage) {

		int curPage = 1;

		if (sCurPage != null) {
			curPage = Integer.parseInt(sCurPage);
		}

		PageTO<OrderDTO> to = new PageTO<OrderDTO>(curPage);
		int amount = orderService.getAmount();
		to.setAmount(amount);
		List<OrderDTO> list = orderService.list(curPage);

		model.addAttribute("list", list);
		to.setList(list);

		model.addAttribute("to", to);
		
		return "admin/orderedlist";
	}

	@RequestMapping(value = "/orderedlist", method = RequestMethod.GET)
	public String orderedlist(Model model) {

		int curPage = 1;

		List<OrderDTO> list = orderService.list(curPage);

		int amount = orderService.getAmount();
		PageTO<OrderDTO> to = new PageTO<OrderDTO>(curPage);
		to.setAmount(amount);
		to.setList(list);

		model.addAttribute("to", to);
		
		StringBuffer sb = new StringBuffer();
		sb.append("/admin");
		sb.append("/orderedlist");
		
		String path = sb.toString();

		return path;
	}
	
	@ResponseBody
	@RequestMapping(value = "/newProducts", method = RequestMethod.GET)
	public List<ProductDTO> newProducts() {
		
		List<ProductDTO> list = productService.newProductList();
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public List<ProductDTO> productList() {
		
		int curPage = 1;
		List<ProductDTO> list = productService.list(curPage);
		int amount = productService.getAmount();
		
		PageTO<ProductDTO> to = new PageTO<ProductDTO>(curPage);
		to.setAmount(amount);
		to.setList(list);

		return to.getList();
	}
	
	
	@RequestMapping(value = "/product/insert", method = RequestMethod.POST)
	public String insert(ProductDTO dto) {
		
		
		String[] files = dto.getFiles();
		String filename = files[0];
		System.out.println(filename);
		dto.setFilename(filename);
		

		productService.insert(dto);
		
		StringBuffer sb = new StringBuffer();
		sb.append("redirect:");
		sb.append("/admin");
		sb.append("/product");
		sb.append("/read/");
		sb.append(dto.getProductId());
		
		String path = sb.toString();
		
		return path;
	}
	
	
	@RequestMapping(value = "/product/insert", method = RequestMethod.GET)
	public String insert() {
		
		return "admin/product/insert";
	}
	
	
	@RequestMapping(value = "/product/delete/{productId}", method = RequestMethod.GET)
	public String delete(@PathVariable("productId") String productId) {
		
		productService.delete(productId);
		return "redirect:/admin/product/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/product/deleteFile", method = RequestMethod.POST)
	public String deleteFile(String filename) {
		
		productService.deleteFile(filename);
		return filename;
	}
	
	@ResponseBody
	@RequestMapping(value = "/product/getAttaches/{productId}")
	public List<String> getAttaches(@PathVariable("productId") String productId) {

		return productService.getAttaches(productId);
	}
	
	@RequestMapping(value = "/product/update", method = RequestMethod.POST)
	public String productUpdate(ProductDTO dto) {
		
		productService.update(dto);

	
		StringBuffer sb = new StringBuffer();
		sb.append("redirect:");
		sb.append("/admin");
		sb.append("/product");
		sb.append("/read/");
		sb.append(dto.getProductId());
		
		String path = sb.toString();

		return path;
	}

	@RequestMapping(value = "/product/update/{productId}", method = RequestMethod.GET)
	public String productUpdate(@PathVariable("productId") String productId, Model model) {
		
		ProductDTO dto = productService.updateUI(productId);
		model.addAttribute("productInfo", dto);
		
		StringBuffer sb = new StringBuffer();
		sb.append("/admin");
		sb.append("/product");
		sb.append("/update");
		
		String path = sb.toString();

		return path; 
	}
	
	
	@RequestMapping(value = "/product/read/{productId}", method = RequestMethod.GET)
	public String productRead(@PathVariable("productId") String productId ,Model model) {
		
		ProductDTO productDTO = productService.read(productId);
		model.addAttribute("productInfo", productDTO);
		
		StringBuffer sb = new StringBuffer();
		sb.append("/admin");
		sb.append("/product");
		sb.append("/read");
		
		String path = sb.toString();

		return path;
	}
	
	@RequestMapping(value = "/product/list/{searchType}/{keyword}/{curPage}", method = RequestMethod.GET)
	public String productlist(@PathVariable("searchType") String searchType, @PathVariable("keyword") String keyword,
			@PathVariable("curPage") int curPage, Model model) {

		SearchPageTO<ProductDTO> spt = new SearchPageTO<ProductDTO>(searchType, keyword, curPage);
		Integer amount = sBoardService.getProductAmount(spt);

		if (amount == null) {
			amount = 0;
		}

		spt.setAmount(amount);

		List<ProductDTO> list = sBoardService.searchProductList(spt);
		spt.setList(list);
		model.addAttribute("spt", spt);

		return "admin/product/searchlist";
	}

	@RequestMapping(value = "/product/list/{curPage}", method = RequestMethod.GET)
	public String productlist(Model model, @PathVariable("curPage") String sCurPage) {

		int curPage = 1;

		if (sCurPage != null) {
			curPage = Integer.parseInt(sCurPage);
		}

		PageTO<ProductDTO> to = new PageTO<ProductDTO>(curPage);
		int amount = productService.getAmount();
		to.setAmount(amount);
		List<ProductDTO> list = productService.productList(curPage);

		model.addAttribute("list", list);
		to.setList(list);

		model.addAttribute("to", to);
		
		return "admin/product/list";
	}

	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	public String productlist(Model model) {

		int curPage = 1;

		List<ProductDTO> list = productService.productList(curPage);

		int amount = productService.getAmount();
		PageTO<ProductDTO> to = new PageTO<ProductDTO>(curPage);
		to.setAmount(amount);
		to.setList(list);

		model.addAttribute("to", to);
		
		StringBuffer sb = new StringBuffer();
		sb.append("/admin");
		sb.append("/product");
		sb.append("/list");
		
		String path = sb.toString();

		return path;
	}
	
	@RequestMapping(value = "/list/{curPage}", method = RequestMethod.GET)
	public String memberList(Model model, @PathVariable("curPage") String sCurPage) {

		int curPage = 1;

		if (sCurPage != null) {
			curPage = Integer.parseInt(sCurPage);
		}

		PageTO<MemberVO> to = new PageTO<MemberVO>(curPage);
		int amount = memberService.getAmount();
		to.setAmount(amount);
		List<MemberVO> list = memberService.list(curPage);

		model.addAttribute("list", list);
		to.setList(list);

		model.addAttribute("to", to);
		
		return "admin/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String memberList(Model model) {

		int curPage = 1;

		List<MemberVO> list = memberService.list(curPage);

		int amount = memberService.getAmount();
		PageTO<MemberVO> to = new PageTO<MemberVO>(curPage);
		to.setAmount(amount);
		to.setList(list);

		model.addAttribute("to", to);
		
		StringBuffer sb = new StringBuffer();
		sb.append("/admin");
		sb.append("/list");
		
		String path = sb.toString();

		return path;
	}

}
