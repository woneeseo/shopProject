package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberVO;
import kr.co.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public void insert(MemberVO vo) {
		
		memberDAO.insert(vo);
	}

	@Override
	public MemberVO read(String userid) {
		
		return memberDAO.read(userid);
	}

	@Override
	public int idCheck(String userid) {
		
		return memberDAO.idCheck(userid);
	}

	@Override
	public MemberVO updateUI(String userid) {
		
		return memberDAO.read(userid);
	}

	@Override
	public void update(MemberVO vo) {
		memberDAO.update(vo);
	}

	@Override
	public void delete(MemberVO vo) {
		memberDAO.delete(vo);
	}

	@Override
	public MemberVO login(LoginDTO dto) {
		
		return memberDAO.login(dto);
	}

	@Override
	public List<MemberVO> list() {
		
		return memberDAO.list();
	}

}
