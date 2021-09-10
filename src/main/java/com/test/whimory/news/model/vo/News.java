package com.test.whimory.news.model.vo;

import java.sql.Date;

public class News implements java.io.Serializable{
	private static final long serialVersionUID = 3222L;
	
	private int news_no;
	private String user_id;
	private String news_title;
	private String news_content;
	private Date news_date;
	private Date news_modify;
	private String news_org_file;
	private String news_re_file;
	private Date news_at_date;
	private String news_link;
	
	public News() {}

	public News(int news_no, String user_id, String news_title, String news_content, Date news_date, Date news_modify,
			String news_org_file, String news_re_file, Date news_at_date, String news_link) {
		super();
		this.news_no = news_no;
		this.user_id = user_id;
		this.news_title = news_title;
		this.news_content = news_content;
		this.news_date = news_date;
		this.news_modify = news_modify;
		this.news_org_file = news_org_file;
		this.news_re_file = news_re_file;
		this.news_at_date = news_at_date;
		this.news_link = news_link;
	}

	public int getNews_no() {
		return news_no;
	}

	public void setNews_no(int news_no) {
		this.news_no = news_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getNews_title() {
		return news_title;
	}

	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}

	public String getNews_content() {
		return news_content;
	}

	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}

	public Date getNews_date() {
		return news_date;
	}

	public void setNews_date(Date news_date) {
		this.news_date = news_date;
	}

	public Date getNews_modify() {
		return news_modify;
	}

	public void setNews_modify(Date news_modify) {
		this.news_modify = news_modify;
	}

	public String getNews_org_file() {
		return news_org_file;
	}

	public void setNews_org_file(String news_org_file) {
		this.news_org_file = news_org_file;
	}

	public String getNews_re_file() {
		return news_re_file;
	}

	public void setNews_re_file(String news_re_file) {
		this.news_re_file = news_re_file;
	}

	public Date getNews_at_date() {
		return news_at_date;
	}

	public void setNews_at_date(Date news_at_date) {
		this.news_at_date = news_at_date;
	}

	public String getNews_link() {
		return news_link;
	}

	public void setNews_link(String news_link) {
		this.news_link = news_link;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "News [news_no=" + news_no + ", user_id=" + user_id + ", news_title=" + news_title + ", news_content="
				+ news_content + ", news_date=" + news_date + ", news_modify=" + news_modify + ", news_org_file="
				+ news_org_file + ", news_re_file=" + news_re_file + ", news_at_date=" + news_at_date + ", news_link="
				+ news_link + "]";
	}
	
	
	
}
