package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardDTO;
import kr.co.domain.ProductDTO;
import kr.co.domain.SearchPageTO;

@Repository
public class SBoardDAOImpl implements SBoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private final String NS = "kr.co.search";

	@Override
	public Integer getAmount (SearchPageTO<BoardDTO> spt) {
		
		return sqlSession.selectOne(NS+".getAmount", spt);
	}

	@Override
	public List<BoardDTO> list(SearchPageTO<BoardDTO> spt) {
		
		RowBounds rb = new RowBounds(spt.getStartNum()-1, spt.getPerLine());
		return sqlSession.selectList(NS+".list", spt, rb);
	}

	@Override
	public Integer getProductAmount(SearchPageTO<ProductDTO> spt) {
		
		return sqlSession.selectOne(NS+".getProductAmount", spt);
	}

	@Override
	public List<ProductDTO> searchProductList(SearchPageTO<ProductDTO> spt) {
		
		RowBounds rb = new RowBounds(spt.getStartNum()-1, spt.getPerLine());
		return sqlSession.selectList(NS+".searchProductList", spt, rb);
	}


}
