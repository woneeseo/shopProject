package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private final String NS = "kr.co.Reply";

	@Override
	public void insert(ReplyDTO replyDTO) {
		sqlSession.insert(NS+".insert", replyDTO);
	}

	@Override
	public List<ReplyDTO> list(int boardId) {
		
		return sqlSession.selectList(NS+".list", boardId);
	}

	@Override
	public int delete(ReplyDTO replyDTO) {
		
		return sqlSession.delete(NS+".delete", replyDTO);
	}

	@Override
	public int update(ReplyDTO replyDTO) {
		
		return sqlSession.update(NS+".update", replyDTO);
	}

}
