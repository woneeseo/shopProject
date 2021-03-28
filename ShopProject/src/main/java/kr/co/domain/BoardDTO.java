package kr.co.domain;

import java.io.Serializable;
import java.util.Date;

public class BoardDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	private int boardId;
	private String userid;
	private String title;
	private Date regDate;
	private String content;
	private Date updateDate;
	private int viewCnt;
	private String productName;
	private int qna_type;
	private int replyCnt;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int boardId, String userid, String title, Date regDate, String content, Date updateDate,
			int viewCnt, String productName, int qna_type) {
		super();
		this.boardId = boardId;
		this.userid = userid;
		this.title = title;
		this.regDate = regDate;
		this.content = content;
		this.updateDate = updateDate;
		this.viewCnt = viewCnt;
		this.productName = productName;
		this.qna_type = qna_type;
	}
	
	

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

	public int getQna_type() {
		return qna_type;
	}

	public void setQna_type(int qna_type) {
		this.qna_type = qna_type;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + boardId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardDTO other = (BoardDTO) obj;
		if (boardId != other.boardId)
			return false;
		return true;
	}
	
	
}
