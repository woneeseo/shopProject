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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.MemberVO;
import kr.co.domain.OrderDTO;
import kr.co.domain.ProductDTO;
import kr.co.service.MemberService;
import kr.co.service.OrderService;
import kr.co.service.ProductService;
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
	
	@RequestMapping(value = "/orderedlist", method = RequestMethod.GET)
	public void orderedlist(Model model) {
		
		List<OrderDTO> orderedList = orderService.list();
		model.addAttribute("orderedList", orderedList);
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
		
		List<ProductDTO> list = productService.list();
		
		return list;
	}
	
	
	@RequestMapping(value = "/product/insert", method = RequestMethod.POST)
	public String insert(ProductDTO dto) {
		
		System.out.println(dto.getPrice());
		System.out.println(dto.getProductDist());
		System.out.println(dto.getProductId());
		System.out.println(dto.getProductInfo());
		System.out.println(dto.getProductName());
		System.out.println(dto.getStock());
		System.out.println(dto.getFiles());
		
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
	
	
	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	public String productList(Model model) {
		
		List<ProductDTO> list = productService.productList();
		model.addAttribute("productList", list);
		
		StringBuffer sb = new StringBuffer();
		sb.append("/admin");
		sb.append("/product");
		sb.append("/list");
		
		String path = sb.toString();

		return path;
		
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {
		
		List<MemberVO> list = memberService.list();
		model.addAttribute("list", list);
	}

}
