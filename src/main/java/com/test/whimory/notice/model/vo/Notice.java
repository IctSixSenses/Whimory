package com.test.whimory.notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable {
	private static final long serialVersionUID = 4000L;
	
	
	private int notice_no;
	private String user_id;
	private String notice_title;
	private String notice_content;
	private String notice_org_file;
	private String notice_re_file;
	private Date notice_date;
	private Date notice_modify;
	private int notice_readcount;
	
	public Notice() {}

	public Notice(int notice_no, String user_id, String notice_title, String notice_content, String notice_org_file,
			String notice_re_file, Date notice_date, Date notice_modify, int notice_readcount) {
		super();
		this.notice_no = notice_no;
		this.user_id = user_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_org_file = notice_org_file;
		this.notice_re_file = notice_re_file;
		this.notice_date = notice_date;
		this.notice_modify = notice_modify;
		this.notice_readcount = notice_readcount;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_org_file() {
		return notice_org_file;
	}

	public void setNotice_org_file(String notice_org_file) {
		this.notice_org_file = notice_org_file;
	}

	public String getNotice_re_file() {
		return notice_re_file;
	}

	public void setNotice_re_file(String notice_re_file) {
		this.notice_re_file = notice_re_file;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public Date getNotice_modify() {
		return notice_modify;
	}

	public void setNotice_modify(Date notice_modify) {
		this.notice_modify = notice_modify;
	}

	public int getNotice_readcount() {
		return notice_readcount;
	}

	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", user_id=" + user_id + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_org_file=" + notice_org_file + ", notice_re_file="
				+ notice_re_file + ", notice_date=" + notice_date + ", notice_modify=" + notice_modify
				+ ", notice_readcount=" + notice_readcount + "]";
	}

	
	// test	
	
	
}
