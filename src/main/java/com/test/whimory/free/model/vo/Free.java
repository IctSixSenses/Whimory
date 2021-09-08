package com.test.whimory.free.model.vo;

import java.sql.Date;

public class Free implements java.io.Serializable {
	private static final long serialVersionUID = 2222L;
	
	private int free_no;	    	//게시글 번호
	private String user_id;			//작성자
	private String free_title;		//글 제목
	private String free_content;	//글 내용
	private String free_org_file;	//기존 첨부파일
	private String free_re_file;	//변경 첨부파일
	private Date free_date;			//작성일
	private Date free_modify;		//수정일
	private int free_readcount;		//조회수
	private int free_like;			//추천수
	private int free_bad;			//신고수
	
	public Free() {}

	public Free(int free_no, String user_id, String free_title, String free_content, String free_org_file,
			String free_re_file, Date free_date, Date free_modify, int free_readcount, int free_like, int free_bad) {
		super();
		this.free_no = free_no;
		this.user_id = user_id;
		this.free_title = free_title;
		this.free_content = free_content;
		this.free_org_file = free_org_file;
		this.free_re_file = free_re_file;
		this.free_date = free_date;
		this.free_modify = free_modify;
		this.free_readcount = free_readcount;
		this.free_like = free_like;
		this.free_bad = free_bad;
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

	public String getFree_title() {
		return free_title;
	}

	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}

	public String getFree_content() {
		return free_content;
	}

	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}

	public String getFree_org_file() {
		return free_org_file;
	}

	public void setFree_org_file(String free_org_file) {
		this.free_org_file = free_org_file;
	}

	public String getFree_re_file() {
		return free_re_file;
	}

	public void setFree_re_file(String free_re_file) {
		this.free_re_file = free_re_file;
	}

	public Date getFree_date() {
		return free_date;
	}

	public void setFree_date(Date free_date) {
		this.free_date = free_date;
	}

	public Date getFree_modify() {
		return free_modify;
	}

	public void setFree_modify(Date free_modify) {
		this.free_modify = free_modify;
	}

	public int getFree_readcount() {
		return free_readcount;
	}

	public void setFree_readcount(int free_readcount) {
		this.free_readcount = free_readcount;
	}

	public int getFree_like() {
		return free_like;
	}

	public void setFree_like(int free_like) {
		this.free_like = free_like;
	}

	public int getFree_bad() {
		return free_bad;
	}

	public void setFree_bad(int free_bad) {
		this.free_bad = free_bad;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Free [free_no=" + free_no + ", user_id=" + user_id + ", free_title=" + free_title + ", free_content="
				+ free_content + ", free_org_file=" + free_org_file + ", free_re_file=" + free_re_file + ", free_date="
				+ free_date + ", free_modify=" + free_modify + ", free_readcount=" + free_readcount + ", free_like="
				+ free_like + ", free_bad=" + free_bad + "]";
	}
	
	
}
