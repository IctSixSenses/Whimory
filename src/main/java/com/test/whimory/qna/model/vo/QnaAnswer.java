package com.test.whimory.qna.model.vo;

import java.sql.Date;

public class QnaAnswer implements java.io.Serializable{
	private static final long serialVersionUID = 3111L;
	
	private int qa_no;	// 답변 번호 (PK)
	private int qq_no;	// 질문 번호 (FK)
	private String user_id;	// 답변 작성자 (FK)
	private String qa_content;	// 답변 내용
	private Date qa_date;	// 답변 작성일
	
	public QnaAnswer() {}

	public QnaAnswer(int qa_no, int qq_no, String user_id, String qa_content, Date qa_date) {
		super();
		this.qa_no = qa_no;
		this.qq_no = qq_no;
		this.user_id = user_id;
		this.qa_content = qa_content;
		this.qa_date = qa_date;
	}

	public int getQa_no() {
		return qa_no;
	}

	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
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

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public Date getQa_date() {
		return qa_date;
	}

	public void setQa_date(Date qa_date) {
		this.qa_date = qa_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "QnaAnswer [qa_no=" + qa_no + ", qq_no=" + qq_no + ", user_id=" + user_id + ", qa_content=" + qa_content
				+ ", qa_date=" + qa_date + "]";
	}
}
