package com.test.whimory.report.model.vo;

public class ReportLike implements java.io.Serializable {
private static final long serialVersionUID = 5001L;
	
	private int report_no;
	private String user_id;
	
	public ReportLike() {}

	public ReportLike(int report_no, String user_id) {
		super();
		this.report_no = report_no;
		this.user_id = user_id;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReportLike [report_no=" + report_no + ", user_id=" + user_id + "]";
	}
}
