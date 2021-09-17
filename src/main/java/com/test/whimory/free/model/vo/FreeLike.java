package com.test.whimory.free.model.vo;

public class FreeLike implements java.io.Serializable{
	private static final long serialVersionUID = 2224L;
	
	private int free_no;	    	//게시글 번호
	private String user_id;			//추천인
	
	public FreeLike() {}

	public FreeLike(int free_no, String user_id) {
		super();
		this.free_no = free_no;
		this.user_id = user_id;
	}

	public int getFree_no() {
		return free_no;
	}

	public void setFree_no(int free_no) {
		this.free_no = free_no;
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
		return "FreeLike [free_no=" + free_no + ", user_id=" + user_id + "]";
	}
	
}
