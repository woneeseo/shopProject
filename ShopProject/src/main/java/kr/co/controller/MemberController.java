package kr.co.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberVO;
import kr.co.domain.OrderDTO;
import kr.co.service.MemberService;
import kr.co.service.OrderService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private OrderService orderService;
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		response.sendRedirect("/");

	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet() {
		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST) 
	public void loginPost(LoginDTO dto, Model model) {
		
		MemberVO vo = memberService.login(dto);
		model.addAttribute("login", vo);
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(MemberVO vo) {
		
		memberService.delete(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/delete/{userid}", method = RequestMethod.GET)
	public String delete(@PathVariable("userid") String userid, Model model) {
		
		MemberVO vo = memberService.read(userid);
		model.addAttribute("userInfo", vo);
		
		return "member/delete";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView update(MemberVO vo, @ModelAttribute("detailAddress") String detailAddress) {
		
		String adderss = vo.getUseraddress() + " " + detailAddress;
		
		if (detailAddress == null) {
			adderss = vo.getUseraddress();
		}
		
		vo.setUseraddress(adderss);
		
		memberService.update(vo);
		
		ModelAndView mav = new ModelAndView();

		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/member/read/" + vo.getUserid());
		redirectView.setExposeModelAttributes(false);

		mav.setView(redirectView);

		return mav;
		
	}
	
	@RequestMapping(value = "/update/{userid}", method = RequestMethod.GET)
	public String update(@PathVariable("userid") String userid, Model model) {
		
		MemberVO vo = memberService.updateUI(userid);
		model.addAttribute("userInfo", vo);
		
		return "member/update";
	}
	
	
	@ResponseBody /* return되는 값은 view의 주소가 아닌 데이터임을 나타내는 어노테이션 */
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(MemberVO vo) {
		
		String userid = vo.getUserid();
		int result = memberService.idCheck(userid);
		/* 만약, DB에 ID가 존재하면 1을, 존재하지 않으면 0을 return 할 것임 */
		return result;
	}
	
	@RequestMapping(value = "/read/{userid}", method = RequestMethod.GET)
	public String read(@PathVariable("userid") String userid, Model model) {
		
		MemberVO vo = memberService.read(userid);
		List<OrderDTO> orderList = orderService.myOrderList(userid);
		model.addAttribute("userInfo", vo);
		model.addAttribute("orderList", orderList);

		return "member/read";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		return "member/insert";
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(MemberVO vo, @ModelAttribute("detailAddress") String detailAddress) {
		
		String address= vo.getUseraddress() + " " + detailAddress;
		
		if (detailAddress == null) {
			address = vo.getUseraddress();
		}
		
		vo.setUseraddress(address);	

		memberService.insert(vo);
		
		ModelAndView mav = new ModelAndView();

		RedirectView redirectView = new RedirectView(); // redirect url 설정
		redirectView.setUrl("/member/read/" + vo.getUserid());
		redirectView.setExposeModelAttributes(false);

		mav.setView(redirectView);

		return mav;

	}


}
