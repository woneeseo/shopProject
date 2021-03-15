package kr.co.repository;

import java.util.List;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberVO;

public interface MemberDAO {
	
	void insert(MemberVO vo);

	MemberVO read(String userid);

	int idCheck(String userid);

	void update(MemberVO vo);

	void delete(MemberVO vo);

	MemberVO login(LoginDTO dto);

	List<MemberVO> list();

}
