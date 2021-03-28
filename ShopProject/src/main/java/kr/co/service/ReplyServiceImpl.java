package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.ReplyDTO;
import kr.co.repository.BoardDAO;
import kr.co.repository.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO replyDAO;
	
	@Inject
	private BoardDAO boardDAO;
	

	@Override
	@Transactional
	public void insert(ReplyDTO replyDTO) {
		
		replyDAO.insert(replyDTO);
		boardDAO.updateReplyCnt(replyDTO.getBoardId());
	}

	@Override
	public List<ReplyDTO> list(int boardId) {
		
		return replyDAO.list(boardId);
	}

	@Override
	@Transactional
	public int delete(ReplyDTO replyDTO) {
		
		boardDAO.minusReplyCnt(replyDTO.getBoardId());
		return replyDAO.delete(replyDTO);
	}

	@Override
	public int update(ReplyDTO replyDTO) {
		
		return replyDAO.update(replyDTO);
	}

}
