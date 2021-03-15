package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		return "member/insert";
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void insert(MemberVO vo) {
		
		

	}


}
