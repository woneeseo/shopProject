package kr.co.repository;

import java.util.List;

import kr.co.domain.BoardDTO;
import kr.co.domain.ProductDTO;
import kr.co.domain.SearchPageTO;

public interface SBoardDAO {

	Integer getAmount(SearchPageTO<BoardDTO> spt);

	List<BoardDTO> list(SearchPageTO<BoardDTO> spt);

	Integer getProductAmount(SearchPageTO<ProductDTO> spt);

	List<ProductDTO> searchProductList(SearchPageTO<ProductDTO> spt);

}
