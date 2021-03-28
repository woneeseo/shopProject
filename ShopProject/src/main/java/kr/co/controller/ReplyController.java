package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.ReplyDTO;
import kr.co.service.ReplyService;


@RestController
@RequestMapping(value = "/reply")
public class ReplyController {
	
	@Inject
	private ReplyService replyService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String insert(@RequestBody ReplyDTO replyDTO) {

		replyService.insert(replyDTO);
		
		if(replyDTO.getRep_no() == 0) {
			return "x";
		} else {
			return "o";
		}
	}
	
	@RequestMapping(value = "/{boardId}", method = RequestMethod.GET)
	public List<ReplyDTO> list(@PathVariable("boardId") int boardId, Model model) {

		List<ReplyDTO> list = replyService.list(boardId);
		return list; 
	}
	
	@RequestMapping(value = "", method = RequestMethod.DELETE)
	public String delete(@RequestBody ReplyDTO replyDTO) {
		
		int i = replyService.delete(replyDTO);
		
		if (i == 1) {
			return "O";
		} else {
			return "X";
		}
	}
	
	
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public String update(@RequestBody ReplyDTO replyDTO) {

		int i = replyService.update(replyDTO);
		if (i == 1) {
			return "O";
		} else {
			return "X";
		}
	}
	

}
