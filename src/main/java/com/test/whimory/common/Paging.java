package com.test.whimory.common;

import java.sql.Date;

public class Paging implements java.io.Serializable{
	private static final long SerialVersionUID = 9999L;
	
	private int startRow;
	private int endRow;
	private String user_id;		// 현주: qna 혹은 나의 제보내역 보기 시, 임시로 값 저장을 해주기 위해 추가 
	private Date begin;			// 다슬 추가
	private Date end;			// 다슬 추가
	private String keyword;		// 다슬 추가
	
	public Paging() {}

	public Paging(int startRow, int endRow) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public Paging(int startRow, int endRow, String keyword) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.keyword = keyword;
	}

	public Paging(int startRow, int endRow, Date begin, Date end) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.begin = begin;
		this.end = end;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getBegin() {
		return begin;
	}

	public void setBegin(Date begin) {
		this.begin = begin;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public static long getSerialversionuid() {
		return SerialVersionUID;
	}

	@Override
	public String toString() {
		return "Paging [startRow=" + startRow + ", endRow=" + endRow + ", user_id=" + user_id + ", begin=" + begin
				+ ", end=" + end + ", keyword=" + keyword + "]";
	}


}
