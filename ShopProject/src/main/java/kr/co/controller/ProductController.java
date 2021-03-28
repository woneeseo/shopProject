package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.BoardDTO;
import kr.co.domain.PageTO;
import kr.co.domain.ProductDTO;
import kr.co.domain.SearchPageTO;
import kr.co.service.BoardService;
import kr.co.service.ProductService;
import kr.co.service.SBoardService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	@Inject
	private ProductService productService;
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/show/{productId}", method = RequestMethod.GET)
	public String showProductInfo(@PathVariable("productId") String productId, Model model) {
		
		ProductDTO dto = productService.read(productId);
		List<BoardDTO> list = boardService.getReview(dto.getProductName());
		model.addAttribute("productInfo", dto);
		model.addAttribute("list", list);
		return "product/show";
		
	}
	
	
	@RequestMapping(value = "/{productDist}", method = RequestMethod.GET)
	public String locationAssign(@PathVariable("productDist") String productDist) {

		return "product/" + productDist;
	}
	
	@ResponseBody
	@RequestMapping(value = "/get/{productDist}", method = RequestMethod.GET)
	public List<ProductDTO> getProductDistinct(@PathVariable("productDist") String productDist) {
		
		int curPage = 1;
		
		List<ProductDTO> list = productService.getProductDistList(productDist);
		int amount = productService.getAmount();
		
		PageTO<ProductDTO> to = new PageTO<ProductDTO>(curPage);
		to.setAmount(amount);
		to.setList(list);

		return to.getList();
	}

}
