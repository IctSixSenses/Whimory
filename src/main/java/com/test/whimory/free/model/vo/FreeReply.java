package com.test.whimory.free.model.vo;

import java.sql.Date;

public class FreeReply implements java.io.Serializable {
	private static final long serialVersionUID = 2223L;
	
	private int free_reply_no;		//댓글 번호
	private int free_no;			//게시글 번호
	private String user_id;			//댓글 작성자
	private String free_reply_content;	//댓글 내용
	private Date free_reply_date;	//댓글 작성일

	public FreeReply() {}

	public FreeReply(int free_reply_no, int free_no, String user_id, String free_reply_content, Date free_reply_date) {
		super();
		this.free_reply_no = free_reply_no;
		this.free_no = free_no;
		this.user_id = user_id;
		this.free_reply_content = free_reply_content;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFree_reply_content() {
		return free_reply_content;
	}

	public void setFree_reply_content(String free_reply_content) {
		this.free_reply_content = free_reply_content;
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
		return "FreeReply [free_reply_no=" + free_reply_no + ", free_no=" + free_no + ", user_id=" + user_id
				+ ", free_reply_content=" + free_reply_content + ", free_reply_date=" + free_reply_date + "]";
	}
	
}
