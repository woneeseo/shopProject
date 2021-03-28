package kr.co.repository;

import java.util.List;

import kr.co.domain.BoardDTO;

public interface BoardDAO {

	List<BoardDTO> list(int curPage);

	void insert(BoardDTO boardDTO);

	BoardDTO read(int boardId);

	List<BoardDTO> reviewList();

	int getAmount();

	void updateViewCnt(int boardId);

	void update(BoardDTO boardDTO);

	void delete(int boardId);

	void updateReplyCnt(int boardId);

	void minusReplyCnt(int boardId);

	List<BoardDTO> getReview(String productName);

}
