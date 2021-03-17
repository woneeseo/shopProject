package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberVO;
import kr.co.domain.OrderDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	/* mybatis를 사용할 수 있도록 해줌 */
	private final String NS = "kr.co.member";
	/* mapper마다 다른 namespace를 둬, 
	 * 여러 매퍼에서 동일한 sql문을 사용하더라도 기능충돌이 없게 해줌 */

	@Override
	public void insert(MemberVO vo) {
		sqlSession.insert(NS+".insert", vo);
	}

	@Override
	public MemberVO read(String userid) {
		
		return sqlSession.selectOne(NS+".read", userid);
	}

	@Override
	public int idCheck(String userid) {
		
		MemberVO vo = sqlSession.selectOne(NS+".read", userid);
		
		if (vo != null) {
			return 1;
		} else {
			return 0;
		}
		
	}

	@Override
	public void update(MemberVO vo) {
		sqlSession.update(NS+".update", vo);
	}

	@Override
	public void delete(MemberVO vo) {
		sqlSession.delete(NS+".delete", vo);
	}

	@Override
	public MemberVO login(LoginDTO dto) {
		
		return sqlSession.selectOne(NS+".login", dto);
	}

	@Override
	public List<MemberVO> list() {
		
		return sqlSession.selectList(NS+".list");
	}

	@Override
	public void insertGetPoint(OrderDTO orderDTO) {
		sqlSession.update(NS+".insertGetPoint", orderDTO);
	}

}
