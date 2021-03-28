package kr.co.domain;

import java.io.Serializable;
import java.util.Date;

public class ReplyDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	private int rep_no;
	private int boardId;
	private String rep_content;
	private String writer;
	private Date regDate;
	private Date updateDate;
	
	public ReplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyDTO(int rep_no, int boardId, String rep_content, String writer, Date regDate, Date updateDate) {
		super();
		this.rep_no = rep_no;
		this.boardId = boardId;
		this.rep_content = rep_content;
		this.writer = writer;
		this.regDate = regDate;
		this.updateDate = updateDate;
	}

	public int getRep_no() {
		return rep_no;
	}

	public void setRep_no(int rep_no) {
		this.rep_no = rep_no;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getRep_content() {
		return rep_content;
	}

	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + rep_no;
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
		ReplyDTO other = (ReplyDTO) obj;
		if (rep_no != other.rep_no)
			return false;
		return true;
	}
	
	

}
