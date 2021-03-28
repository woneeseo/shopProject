package kr.co.repository;

import java.util.List;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberVO;
import kr.co.domain.OrderDTO;

public interface MemberDAO {
	
	void insert(MemberVO vo);

	MemberVO read(String userid);

	int idCheck(String userid);

	void update(MemberVO vo);

	void delete(MemberVO vo);

	MemberVO login(LoginDTO dto);

	List<MemberVO> list(int curPage);

	void insertGetPoint(OrderDTO orderDTO);

	MemberVO findIdByNameAndEmail(MemberVO vo);

	MemberVO findPwByNameAndEmail(MemberVO vo);

	void deleteGetPoint(OrderDTO orderDTO);

	int getAmount();

	int memberDelete(String userid);

}
