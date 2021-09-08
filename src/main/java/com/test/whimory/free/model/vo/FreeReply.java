package com.test.whimory.free.model.vo;

import java.sql.Date;

public class FreeReply implements java.io.Serializable {
	private static final long serialVersionUID = 2223L;
	
	private int free_reply_no;		//댓글 번호
	private int free_no;			//게시글 번호
	private int free_ref_no;		//대댓글 참조 번호
	private int free_level;			//글 레벨
	private String user_id;			//댓글 작성자
	private Date free_reply_date;	//댓글 작성일

	public FreeReply() {}

	public FreeReply(int free_reply_no, int free_no, int free_ref_no, int free_level, String user_id,
			Date free_reply_date) {
		super();
		this.free_reply_no = free_reply_no;
		this.free_no = free_no;
		this.free_ref_no = free_ref_no;
		this.free_level = free_level;
		this.user_id = user_id;
		this.free_reply_date = free_reply_date;
	}

	public int getFree_reply_no() {
		return free_reply_no;
	}

	public void setFree_reply_no(int free_reply_no) {
		this.free_reply_no = free_reply_no;
	}

	public int getFree_no() {
		return free_no;
	}

	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}

	public int getFree_ref_no() {
		return free_ref_no;
	}

	public void setFree_ref_no(int free_ref_no) {
		this.free_ref_no = free_ref_no;
	}

	public int getFree_level() {
		return free_level;
	}

	public void setFree_level(int free_level) {
		this.free_level = free_level;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getFree_reply_date() {
		return free_reply_date;
	}

	public void setFree_reply_date(Date free_reply_date) {
		this.free_reply_date = free_reply_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "FreeReply [free_reply_no=" + free_reply_no + ", free_no=" + free_no + ", free_ref_no=" + free_ref_no
				+ ", free_level=" + free_level + ", user_id=" + user_id + ", free_reply_date=" + free_reply_date + "]";
	}
	
}
