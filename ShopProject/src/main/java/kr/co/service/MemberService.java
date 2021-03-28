package kr.co.service;
import java.util.List;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberVO;

public interface MemberService {
	
	void insert(MemberVO vo);

	MemberVO read(String userid);

	int idCheck(String userid);

	MemberVO updateUI(String userid);

	void update(MemberVO vo);

	void delete(MemberVO vo);

	MemberVO login(LoginDTO dto);

	List<MemberVO> list(int curPage);

	MemberVO findIdByNameAndEmail(MemberVO vo);

	MemberVO findPwByNameAndEmail(MemberVO vo);

	int getAmount();

	int memberDelete(String userid);

}
