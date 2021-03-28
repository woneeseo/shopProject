package kr.co.ezen;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.BoardDTO;
import kr.co.service.BoardService;

@Controller
public class HomeController {
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		
		List<BoardDTO> list = boardService.reviewList();
		model.addAttribute("list", list);
		
		return "main";
	}
	
}
