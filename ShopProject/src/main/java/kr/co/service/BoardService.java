package kr.co.service;

import java.util.List;

import kr.co.domain.BoardDTO;

public interface BoardService {

	List<BoardDTO> list(int curPage);

	void insert(BoardDTO boardDTO);

	BoardDTO read(int boardId);

	List<BoardDTO> reviewList();

	int getAmount();

	void update(BoardDTO boardDTO);

	void delete(int boardId);

	List<BoardDTO> getReview(String productName);

}
