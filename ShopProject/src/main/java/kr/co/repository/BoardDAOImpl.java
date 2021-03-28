package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardDTO;
import kr.co.domain.PageTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private final String NS = "kr.co.board";

	@Override
	public List<BoardDTO> list(int curPage) {
		
		PageTO<BoardDTO> to = new PageTO<BoardDTO>(curPage);
		RowBounds rb = new RowBounds(to.getStartNum()-1, to.getPerPage());

		return sqlSession.selectList(NS+".list", null, rb);
	}

	@Override
	public void insert(BoardDTO boardDTO) {
		sqlSession.insert(NS+".insert", boardDTO);
	}

	@Override
	public BoardDTO read(int boardId) {
		
		return sqlSession.selectOne(NS+".read", boardId);
	}

	@Override
	public List<BoardDTO> reviewList() {
		
		return sqlSession.selectList(NS+".reviewList");
	}

	@Override
	public int getAmount() {
		
		return sqlSession.selectOne(NS+".getAmount");
	}

	@Override
	public void updateViewCnt(int boardId) {
		
		sqlSession.update(NS+".updateViewCnt", boardId);
	}

	@Override
	public void update(BoardDTO boardDTO) {
		sqlSession.update(NS+".update", boardDTO);
	}

	@Override
	public void delete(int boardId) {
		sqlSession.delete(NS+".delete", boardId);
	}

	@Override
	public void updateReplyCnt(int boardId) {
		sqlSession.update(NS+".updateReplyCnt", boardId);
	}

	@Override
	public void minusReplyCnt(int boardId) {
		sqlSession.update(NS+".minusReplyCnt", NS);
	}

	@Override
	public List<BoardDTO> getReview(String productName) {
		
		return sqlSession.selectList(NS+".getReview", productName);
	}

}
