package kr.co.service;

import java.util.List;

import kr.co.domain.ReplyDTO;

public interface ReplyService {

	void insert(ReplyDTO replyDTO);

	List<ReplyDTO> list(int boardId);

	int delete(ReplyDTO replyDTO);

	int update(ReplyDTO replyDTO);

}
