package com.test.whimory.user.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.test.whimory.user.model.vo.User;

public interface UserService {
	//회원서비스
	User selectUser(String user_id);//회원 정보 조회하기
	User selectLogin(User user); //회원 선택
	ArrayList<User> selectList(); //회원 정보 목록
	Map<String, Object> userKakaoLoginPro(Map<String, Object> paramMap);
	void setKakaoConnection(Map<String, Object> paramMap);
	Map<String, Object> kakaoConnectionCheck(Map<String, Object> paramMap);
	ArrayList<User> selectSearchUserid(String keyword); //회원 아이디 찾기
	int updateUser(User user); //회원 정보 수정
	int updateLoginOk(User user); //회원 로그인 허용 설정
	int insertUser(User user); //회원 가입
	
}
