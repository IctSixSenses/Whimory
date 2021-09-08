package com.test.whimory.user.model.vo;

import java.sql.Date;
//회원 VO
public class User implements java.io.Serializable {
	private static final long serialVersionUID = 1111L;
	
	private String user_id; //회원 아이디
	private String user_pwd; //회원 비밀번호
	private String username; //회원 명
	private String gender; //회원 성별
	private java.sql.Date birth; //회원 생년월일
	private String phone; //회원 전화번호
	private String email; //회원 이메일
	private String auth_status; //인증 여부
	private java.sql.Date join_date; //가입 날짜
	private java.sql.Date last_login_date; //가입 날짜
	private String admin_yn; //관리자 권한 여부
	private String login_access_yn; //로그인 가능 여부
	private int penalty_count; //경고 횟수 카운트
	
	public User() {}
	
	

	public User(String user_id, String user_pwd, String username, String gender, Date birth, String phone, String email,
			String auth_status, Date join_date, Date last_login_date, String admin_yn, String login_access_yn, int penalty_count) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.username = username;
		this.gender = gender;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.auth_status = auth_status;
		this.join_date = join_date;
		this.last_login_date = last_login_date;
		this.admin_yn = admin_yn;
		this.login_access_yn = login_access_yn;
		this.penalty_count = penalty_count;
	}



	public java.sql.Date getLast_login_date() {
		return last_login_date;
	}



	public void setLast_login_date(java.sql.Date last_login_date) {
		this.last_login_date = last_login_date;
	}



	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public java.sql.Date getBirth() {
		return birth;
	}

	public void setBirth(java.sql.Date birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuth_status() {
		return auth_status;
	}

	public void setAuth_status(String auth_status) {
		this.auth_status = auth_status;
	}

	public java.sql.Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(java.sql.Date join_date) {
		this.join_date = join_date;
	}

	public String getAdmin_yn() {
		return admin_yn;
	}

	public void setAdmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}

	public String getLogin_access_yn() {
		return login_access_yn;
	}

	public void setLogin_access_yn(String login_access_yn) {
		this.login_access_yn = login_access_yn;
	}

	public int getPenalty_count() {
		return penalty_count;
	}

	public void setPenalty_count(int penalty_count) {
		this.penalty_count = penalty_count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_pwd=" + user_pwd + ", username=" + username + ", gender=" + gender
				+ ", birth=" + birth + ", phone=" + phone + ", email=" + email + ", auth_status=" + auth_status
				+ ", join_date=" + join_date + ", last_login_date=" + last_login_date + ", admin_yn=" + admin_yn
				+ ", login_access_yn=" + login_access_yn + ", penalty_count=" + penalty_count + "]";
	}
	
	
}
