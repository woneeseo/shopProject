package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.BoardDTO;
import kr.co.domain.PageTO;
import kr.co.domain.SearchPageTO;
import kr.co.service.BoardService;
import kr.co.service.SBoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Inject
	private BoardService boardService;

	@Inject
	private SBoardService sBoardService;
	
	@RequestMapping(value = "/delete/{boardId}", method = RequestMethod.GET)
	public String delete(@PathVariable("boardId") int boardId) {
		
		boardService.delete(boardId);
		
		return "redirect:/board/qna";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardDTO boardDTO) {
		System.out.println(boardDTO.getBoardId());
		boardService.update(boardDTO);
		return "redirect:/board/read/" + boardDTO.getBoardId();
	}

	@RequestMapping(value = "/update/{boardId}", method = RequestMethod.GET)
	public String update(@PathVariable("boardId") int boardId, Model model) {
		
		BoardDTO dto = boardService.read(boardId);
		model.addAttribute("dto", dto);
		
		return "board/update";
	}
	
	
	@RequestMapping(value = "/qna/{searchType}/{keyword}/{curPage}", method = RequestMethod.GET)
	public String list(@PathVariable("searchType") String searchType, @PathVariable("keyword") String keyword,
			@PathVariable("curPage") int curPage, Model model) {

		SearchPageTO<BoardDTO> spt = new SearchPageTO<BoardDTO>(searchType, keyword, curPage);
		Integer amount = sBoardService.getAmount(spt);

		if (amount == null) {
			amount = 0;
		}

		spt.setAmount(amount);

		List<BoardDTO> list = sBoardService.list(spt);
		spt.setList(list);
		model.addAttribute("spt", spt);

		return "board/searchResult";
	}

	@RequestMapping(value = "/qna/{curPage}", method = RequestMethod.GET)
	public String list(Model model, @PathVariable("curPage") String sCurPage) {

		int curPage = 1;

		if (sCurPage != null) {
			curPage = Integer.parseInt(sCurPage);
		}

		PageTO<BoardDTO> to = new PageTO<BoardDTO>(curPage);
		int amount = boardService.getAmount();
		to.setAmount(amount);
		List<BoardDTO> list = boardService.list(curPage);

		model.addAttribute("list", list);
		to.setList(list);

		model.addAttribute("to", to);

		return "board/qna";
	}

	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String boardList(Model model) {

		int curPage = 1;

		List<BoardDTO> list = boardService.list(curPage);

		int amount = boardService.getAmount();
		PageTO<BoardDTO> to = new PageTO<BoardDTO>(curPage);
		to.setAmount(amount);
		to.setList(list);

		model.addAttribute("to", to);
		return "board/qna";
	}

	@RequestMapping(value = "/read/{boardId}", method = RequestMethod.GET)
	public String read(@PathVariable("boardId") int boardId, Model model) {

		BoardDTO dto = boardService.read(boardId);
		model.addAttribute("dto", dto);
		return "board/read";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(BoardDTO boardDTO, @ModelAttribute("productName") String productName) {

		boardService.insert(boardDTO);
		return "redirect:/board/read/" + boardDTO.getBoardId();
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(@ModelAttribute("userid") String userid, @ModelAttribute("productName") String productName,
			Model model) {

		model.addAttribute("productName", productName);
		model.addAttribute("userid", userid);
		return "board/insert";

	}

}
