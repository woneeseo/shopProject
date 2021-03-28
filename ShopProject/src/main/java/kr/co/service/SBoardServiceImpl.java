package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.BoardDTO;
import kr.co.domain.ProductDTO;
import kr.co.domain.SearchPageTO;
import kr.co.repository.SBoardDAO;

@Service
public class SBoardServiceImpl implements SBoardService{
	
	@Inject
	private SBoardDAO sBoardDAO;

	@Override
	public Integer getAmount(SearchPageTO<BoardDTO> spt) {
		
		return sBoardDAO.getAmount(spt);
	}

	@Override
	public List<BoardDTO> list(SearchPageTO<BoardDTO> spt) {
		
		return sBoardDAO.list(spt);
	}

	@Override
	public Integer getProductAmount(SearchPageTO<ProductDTO> spt) {
		
		return sBoardDAO.getProductAmount(spt);
	}

	@Override
	public List<ProductDTO> searchProductList(SearchPageTO<ProductDTO> spt) {
		
		return sBoardDAO.searchProductList(spt);
	}

}
