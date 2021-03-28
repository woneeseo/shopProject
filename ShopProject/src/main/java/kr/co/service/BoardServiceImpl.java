package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.BoardDTO;
import kr.co.repository.BoardDAO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO boardDAO;

	@Override
	public List<BoardDTO> list(int curPage) {
		
		return boardDAO.list(curPage);
	}

	@Override
	public void insert(BoardDTO boardDTO) {
		boardDAO.insert(boardDTO);
	}

	@Override
	public BoardDTO read(int boardId) {
		
		boardDAO.updateViewCnt(boardId);
		return boardDAO.read(boardId);
	}

	@Override
	public List<BoardDTO> reviewList() {
		
		return boardDAO.reviewList();
	}

	@Override
	public int getAmount() {
		
		return boardDAO.getAmount();
	}

	@Override
	public void update(BoardDTO boardDTO) {
		boardDAO.update(boardDTO);
		
	}

	@Override
	public void delete(int boardId) {
		boardDAO.delete(boardId);
	}

	@Override
	public List<BoardDTO> getReview(String productName) {
		
		return boardDAO.getReview(productName);
	}
	
	

}
