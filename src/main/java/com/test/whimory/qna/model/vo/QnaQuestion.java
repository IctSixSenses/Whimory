package com.test.whimory.qna.model.vo;

import java.sql.Date;

public class QnaQuestion implements java.io.Serializable{
	private static final long serialVersionUID = 3000L;
	
	private int qq_no;	// 질문 번호 (PK)
	private String user_id;	// 질문 작성자 (FK)
	private String qq_category;	// 질문 분류
	private String qq_title;	// 질문 제목
	private String qq_content;	// 질문 내용
	private Date qq_date;	// 질문 작성일
	private Date qq_modify;	// 질문 수정일
	private String qq_org_file;	// 기존 첨부파일
	private String qq_re_file;	// 변경 첨부파일
	private String qq_yn;	// 답변 여부

	public QnaQuestion() {}

	public QnaQuestion(int qq_no, String user_id, String qq_category, String qq_title, String qq_content, Date qq_date,
			Date qq_modify, String qq_org_file, String qq_re_file, String qq_yn) {
		super();
		this.qq_no = qq_no;
		this.user_id = user_id;
		this.qq_category = qq_category;
		this.qq_title = qq_title;
		this.qq_content = qq_content;
		this.qq_date = qq_date;
		this.qq_modify = qq_modify;
		this.qq_org_file = qq_org_file;
		this.qq_re_file = qq_re_file;
		this.qq_yn = qq_yn;
	}

	public int getQq_no() {
		return qq_no;
	}

	public void setQq_no(int qq_no) {
		this.qq_no = qq_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getQq_category() {
		return qq_category;
	}

	public void setQq_category(String qq_category) {
		this.qq_category = qq_category;
	}

	public String getQq_title() {
		return qq_title;
	}

	public void setQq_title(String qq_title) {
		this.qq_title = qq_title;
	}

	public String getQq_content() {
		return qq_content;
	}

	public void setQq_content(String qq_content) {
		this.qq_content = qq_content;
	}

	public Date getQq_date() {
		return qq_date;
	}

	public void setQq_date(Date qq_date) {
		this.qq_date = qq_date;
	}

	public Date getQq_modify() {
		return qq_modify;
	}

	public void setQq_modify(Date qq_modify) {
		this.qq_modify = qq_modify;
	}

	public String getQq_org_file() {
		return qq_org_file;
	}

	public void setQq_org_file(String qq_org_file) {
		this.qq_org_file = qq_org_file;
	}

	public String getQq_re_file() {
		return qq_re_file;
	}

	public void setQq_re_file(String qq_re_file) {
		this.qq_re_file = qq_re_file;
	}

	public String getQq_yn() {
		return qq_yn;
	}

	public void setQq_yn(String qq_yn) {
		this.qq_yn = qq_yn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "QnaQuestion [qq_no=" + qq_no + ", user_id=" + user_id + ", qq_category=" + qq_category + ", qq_title="
				+ qq_title + ", qq_content=" + qq_content + ", qq_date=" + qq_date + ", qq_modify=" + qq_modify
				+ ", qq_org_file=" + qq_org_file + ", qq_re_file=" + qq_re_file + ", qq_yn=" + qq_yn + "]";
	}
	
	
}
