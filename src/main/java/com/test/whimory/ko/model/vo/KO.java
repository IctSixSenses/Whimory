package com.test.whimory.ko.model.vo;

import java.sql.Date;

public class KO implements java.io.Serializable {
	private static final long serialVersionUID = 6000L;
	
	private int ko_no;
	private String ko_category;
	private String user_id;
	private String ko_editor;
	private String ko_title;
	private String ko_content;
	private String ko_org_file;
	private String ko_re_file;
	private Date ko_date;
	private Date ko_modify;
	private int ko_readcount;
	private String ko_hashtag;
	private String ko_link1;
	private String ko_link2;
	private String ko_link3;
	private String ko_image1;
	private String ko_image2;
	private String ko_image3;
	
	public KO() {}

	public KO(int ko_no, String ko_category, String user_id, String ko_editor, String ko_title, String ko_content,
			String ko_org_file, String ko_re_file, Date ko_date, Date ko_modify, int ko_readcount, String ko_hashtag,
			String ko_link1, String ko_link2, String ko_link3, String ko_image1, String ko_image2, String ko_image3) {
		super();
		this.ko_no = ko_no;
		this.ko_category = ko_category;
		this.user_id = user_id;
		this.ko_editor = ko_editor;
		this.ko_title = ko_title;
		this.ko_content = ko_content;
		this.ko_org_file = ko_org_file;
		this.ko_re_file = ko_re_file;
		this.ko_date = ko_date;
		this.ko_modify = ko_modify;
		this.ko_readcount = ko_readcount;
		this.ko_hashtag = ko_hashtag;
		this.ko_link1 = ko_link1;
		this.ko_link2 = ko_link2;
		this.ko_link3 = ko_link3;
		this.ko_image1 = ko_image1;
		this.ko_image2 = ko_image2;
		this.ko_image3 = ko_image3;
	}

	public int getKo_no() {
		return ko_no;
	}

	public void setKo_no(int ko_no) {
		this.ko_no = ko_no;
	}

	public String getKo_category() {
		return ko_category;
	}

	public void setKo_category(String ko_category) {
		this.ko_category = ko_category;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getKo_editor() {
		return ko_editor;
	}

	public void setKo_editor(String ko_editor) {
		this.ko_editor = ko_editor;
	}

	public String getKo_title() {
		return ko_title;
	}

	public void setKo_title(String ko_title) {
		this.ko_title = ko_title;
	}

	public String getKo_content() {
		return ko_content;
	}

	public void setKo_content(String ko_content) {
		this.ko_content = ko_content;
	}

	public String getKo_org_file() {
		return ko_org_file;
	}

	public void setKo_org_file(String ko_org_file) {
		this.ko_org_file = ko_org_file;
	}

	public String getKo_re_file() {
		return ko_re_file;
	}

	public void setKo_re_file(String ko_re_file) {
		this.ko_re_file = ko_re_file;
	}

	public Date getKo_date() {
		return ko_date;
	}

	public void setKo_date(Date ko_date) {
		this.ko_date = ko_date;
	}

	public Date getKo_modify() {
		return ko_modify;
	}

	public void setKo_modify(Date ko_modify) {
		this.ko_modify = ko_modify;
	}

	public int getKo_readcount() {
		return ko_readcount;
	}

	public void setKo_readcount(int ko_readcount) {
		this.ko_readcount = ko_readcount;
	}

	public String getKo_hashtag() {
		return ko_hashtag;
	}

	public void setKo_hashtag(String ko_hashtag) {
		this.ko_hashtag = ko_hashtag;
	}

	public String getKo_link1() {
		return ko_link1;
	}

	public void setKo_link1(String ko_link1) {
		this.ko_link1 = ko_link1;
	}

	public String getKo_link2() {
		return ko_link2;
	}

	public void setKo_link2(String ko_link2) {
		this.ko_link2 = ko_link2;
	}

	public String getKo_link3() {
		return ko_link3;
	}

	public void setKo_link3(String ko_link3) {
		this.ko_link3 = ko_link3;
	}

	public String getKo_image1() {
		return ko_image1;
	}

	public void setKo_image1(String ko_image1) {
		this.ko_image1 = ko_image1;
	}

	public String getKo_image2() {
		return ko_image2;
	}

	public void setKo_image2(String ko_image2) {
		this.ko_image2 = ko_image2;
	}

	public String getKo_image3() {
		return ko_image3;
	}

	public void setKo_image3(String ko_image3) {
		this.ko_image3 = ko_image3;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "KO [ko_no=" + ko_no + ", ko_category=" + ko_category + ", user_id=" + user_id + ", ko_editor="
				+ ko_editor + ", ko_title=" + ko_title + ", ko_content=" + ko_content + ", ko_org_file=" + ko_org_file
				+ ", ko_re_file=" + ko_re_file + ", ko_date=" + ko_date + ", ko_modify=" + ko_modify + ", ko_readcount="
				+ ko_readcount + ", ko_hashtag=" + ko_hashtag + ", ko_link1=" + ko_link1 + ", ko_link2=" + ko_link2
				+ ", ko_link3=" + ko_link3 + ", ko_image1=" + ko_image1 + ", ko_image2=" + ko_image2 + ", ko_image3="
				+ ko_image3 + "]";
	}
	
	
	
}
