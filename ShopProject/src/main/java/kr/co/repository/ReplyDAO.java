package kr.co.repository;

import java.util.List;

import kr.co.domain.ReplyDTO;

public interface ReplyDAO {

	void insert(ReplyDTO replyDTO);

	List<ReplyDTO> list(int boardId);

	int delete(ReplyDTO replyDTO);

	int update(ReplyDTO replyDTO);

}
