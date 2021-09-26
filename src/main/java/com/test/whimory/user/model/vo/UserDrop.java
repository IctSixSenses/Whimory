package com.test.whimory.user.model.vo;

import java.sql.Date;
//탈퇴회원 
public class UserDrop implements java.io.Serializable {
	private static final long serialVersionUID = 1112L;
	
	private String user_id; // 탈퇴회원 아이디
	private String d_user_name; // 탈퇴회원 명
	private String d_gender; // 탈퇴회원 성별
	private java.sql.Date d_birth; // 탈퇴회원 생년월일
	private String d_phone; // 탈퇴회원 전화번호
	private String d_email; // 탈퇴회원 이메일
	private java.sql.Date d_join_date; // 탈퇴회원 가입 날짜
	private java.sql.Date d_last_login_date; // 탈퇴회원 최종 로그인 날짜
	private java.sql.Date drop_date; //완적 삭제 예정일
	
	public UserDrop() {}

	public UserDrop(String user_id, String d_user_name, String d_gender, Date d_birth, String d_phone, String d_email,
			Date d_join_date, Date d_last_login_date, Date drop_date) {
		super();
		this.user_id = user_id;
		this.d_user_name = d_user_name;
		this.d_gender = d_gender;
		this.d_birth = d_birth;
		this.d_phone = d_phone;
		this.d_email = d_email;
		this.d_join_date = d_join_date;
		this.d_last_login_date = d_last_login_date;
		this.drop_date = drop_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getD_user_name() {
		return d_user_name;
	}

	public void setD_username(String d_user_name) {
		this.d_user_name = d_user_name;
	}

	public String getD_gender() {
		return d_gender;
	}

	public void setD_gender(String d_gender) {
		this.d_gender = d_gender;
	}

	public java.sql.Date getD_birth() {
		return d_birth;
	}

	public void setD_birth(java.sql.Date d_birth) {
		this.d_birth = d_birth;
	}

	public String getD_phone() {
		return d_phone;
	}

	public void setD_phone(String d_phone) {
		this.d_phone = d_phone;
	}

	public String getD_email() {
		return d_email;
	}

	public void setD_email(String d_email) {
		this.d_email = d_email;
	}

	public java.sql.Date getD_join_date() {
		return d_join_date;
	}

	public void setD_join_date(java.sql.Date d_join_date) {
		this.d_join_date = d_join_date;
	}

	public java.sql.Date getD_last_login_date() {
		return d_last_login_date;
	}

	public void setD_last_login_date(java.sql.Date d_last_login_date) {
		this.d_last_login_date = d_last_login_date;
	}

	public java.sql.Date getDrop_date() {
		return drop_date;
	}

	public void setDrop_date(java.sql.Date drop_date) {
		this.drop_date = drop_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UserDrop [user_id=" + user_id + ", d_user_name=" + d_user_name + ", d_gender=" + d_gender + ", d_birth="
				+ d_birth + ", d_phone=" + d_phone + ", d_email=" + d_email + ", d_join_date=" + d_join_date
				+ ", d_last_login_date=" + d_last_login_date + ", drop_date=" + drop_date + "]";
	}
	
	
	
}