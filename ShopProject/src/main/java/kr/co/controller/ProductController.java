package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.ProductDTO;
import kr.co.service.ProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	@Inject
	private ProductService productService;
	
	@RequestMapping(value = "/show/{productId}", method = RequestMethod.GET)
	public String showProductInfo(@PathVariable("productId") String productId, Model model) {
		
		ProductDTO dto = productService.read(productId);
		model.addAttribute("productInfo", dto);
		return "product/show";
		
	}
	
	
	@RequestMapping(value = "/{productDist}", method = RequestMethod.GET)
	public String locationAssign(@PathVariable("productDist") String productDist) {

		return "product/" + productDist;
	}
	
	@ResponseBody
	@RequestMapping(value = "/get/{productDist}", method = RequestMethod.GET)
	public List<ProductDTO> getProductDistinct(@PathVariable("productDist") String productDist) {
		
		List<ProductDTO> list = productService.getProductDistList(productDist);
		
		return list;
	}

}
