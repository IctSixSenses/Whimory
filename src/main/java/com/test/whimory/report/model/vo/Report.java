package com.test.whimory.report.model.vo;

import java.sql.Date;

public class Report implements java.io.Serializable {
	private static final long serialVersionUID = 5000L;
	
	private int report_no;
	private String report_title;
	private String user_id;
	private String report_content;
	private String report_org_file;
	private String report_re_file;
	private Date report_date;
	private Date report_modify;
	private int report_readcount;
	private int report_like;
	private String admin_id;
	private Date comment_date;
	private String admin_comment;
	
	public Report() {}

	public Report(int report_no, String report_title, String user_id, String report_content, String report_org_file,
			String report_re_file, Date report_date, Date report_modify, int report_readcount, int report_like,
			String admin_id, Date comment_date, String admin_comment) {
		super();
		this.report_no = report_no;
		this.report_title = report_title;
		this.user_id = user_id;
		this.report_content = report_content;
		this.report_org_file = report_org_file;
		this.report_re_file = report_re_file;
		this.report_date = report_date;
		this.report_modify = report_modify;
		this.report_readcount = report_readcount;
		this.report_like = report_like;
		this.admin_id = admin_id;
		this.comment_date = comment_date;
		this.admin_comment = admin_comment;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getReport_title() {
		return report_title;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReport_org_file() {
		return report_org_file;
	}

	public void setReport_org_file(String report_org_file) {
		this.report_org_file = report_org_file;
	}

	public String getReport_re_file() {
		return report_re_file;
	}

	public void setReport_re_file(String report_re_file) {
		this.report_re_file = report_re_file;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public Date getReport_modify() {
		return report_modify;
	}

	public void setReport_modify(Date report_modify) {
		this.report_modify = report_modify;
	}

	public int getReport_readcount() {
		return report_readcount;
	}

	public void setReport_readcount(int report_readcount) {
		this.report_readcount = report_readcount;
	}

	public int getReport_like() {
		return report_like;
	}

	public void setReport_like(int report_like) {
		this.report_like = report_like;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	public String getAdmin_comment() {
		return admin_comment;
	}

	public void setAdmin_comment(String admin_comment) {
		this.admin_comment = admin_comment;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", report_title=" + report_title + ", user_id=" + user_id
				+ ", report_content=" + report_content + ", report_org_file=" + report_org_file + ", report_re_file="
				+ report_re_file + ", report_date=" + report_date + ", report_modify=" + report_modify
				+ ", report_readcount=" + report_readcount + ", report_like=" + report_like + ", admin_id=" + admin_id
				+ ", comment_date=" + comment_date + ", admin_comment=" + admin_comment + "]";
	}
	
	
}
