package com.test.whimory.common;

public class Paging implements java.io.Serializable {
	private static final long SerialVersionUID = 9999L;
	
	private int startRow;
	private int endRow;
	
	public Paging() {}

	public Paging(int startRow, int endRow) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
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

	@Override
	public String toString() {
		return "Paging [startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}
