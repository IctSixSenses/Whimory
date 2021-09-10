package com.test.whimory.user.model.vo;

import java.sql.Date;
//비회원 확인
public class UserNot implements java.io.Serializable {
	public static final long serivalVersionUID = 1113L;
	
	private String n_user_id; // 비회원 아이디
	private String n_user_name; // 비회원 이름
	private String n_gender; // 비회원 성별
	private java.sql.Date n_birth; // 비회원 생일
	private String n_phone; // 비회원 휴대전화
	private String n_email; //비회원 이메일
	private java.sql.Date n_first_login_date; //비회원 최초 접속일
	private java.sql.Date n_last_login_date; //비회원 마지막 접속일
	private String auth_status; //인증 여부
	
	public UserNot() {}

	public UserNot(String n_user_id, String n_user_name, String n_gender, Date n_birth, String n_phone, String n_email,
			Date n_first_login_date, Date n_last_login_date, String auth_status) {
		super();
		this.n_user_id = n_user_id;
		this.n_user_name = n_user_name;
		this.n_gender = n_gender;
		this.n_birth = n_birth;
		this.n_phone = n_phone;
		this.n_email = n_email;
		this.n_first_login_date = n_first_login_date;
		this.n_last_login_date = n_last_login_date;
		this.auth_status = auth_status;
	}

	public String getN_email() {
		return n_email;
	}

	public void setN_email(String n_email) {
		this.n_email = n_email;
	}

	public String getN_user_id() {
		return n_user_id;
	}

	public void setN_user_id(String n_user_id) {
		this.n_user_id = n_user_id;
	}

	public String getN_user_name() {
		return n_user_name;
	}

	public void setN_user_name(String n_user_name) {
		this.n_user_name = n_user_name;
	}

	public String getN_gender() {
		return n_gender;
	}

	public void setN_gender(String n_gender) {
		this.n_gender = n_gender;
	}

	public java.sql.Date getN_birth() {
		return n_birth;
	}

	public void setN_birth(java.sql.Date n_birth) {
		this.n_birth = n_birth;
	}

	public String getN_phone() {
		return n_phone;
	}

	public void setN_phone(String n_phone) {
		this.n_phone = n_phone;
	}

	public java.sql.Date getN_first_login_date() {
		return n_first_login_date;
	}

	public void setN_first_login_date(java.sql.Date n_first_login_date) {
		this.n_first_login_date = n_first_login_date;
	}

	public java.sql.Date getN_last_login_date() {
		return n_last_login_date;
	}

	public void setN_last_login_date(java.sql.Date n_last_login_date) {
		this.n_last_login_date = n_last_login_date;
	}

	public String getAuth_status() {
		return auth_status;
	}

	public void setAuth_status(String auth_status) {
		this.auth_status = auth_status;
	}

	public static long getSerivalversionuid() {
		return serivalVersionUID;
	}

	@Override
	public String toString() {
		return "UserNot [n_user_id=" + n_user_id + ", n_user_name=" + n_user_name + ", n_gender=" + n_gender
				+ ", n_birth=" + n_birth + ", n_phone=" + n_phone + ", n_email=" + n_email + ", n_first_login_date="
				+ n_first_login_date + ", n_last_login_date=" + n_last_login_date + ", auth_status=" + auth_status
				+ "]";
	}

	
	

}
