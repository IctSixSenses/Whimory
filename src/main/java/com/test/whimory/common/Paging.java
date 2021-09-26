package com.test.whimory.common;

import java.sql.Date;

public class Paging implements java.io.Serializable {
	private static final long SerialVersionUID = 9999L;
	
	private int startRow;
	private int endRow;
	private Date begin;
	private Date end;
	private String keyword;
	
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
		return "Paging [startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}
