package com.test.whimory.user.model.service;

import java.util.ArrayList;

import com.test.whimory.user.model.vo.User;

public interface UserService {
	//회원서비스
	User selectUser(String user_id);//회원 정보 조회하기
	User selectLogin(User user); //회원 선택
	ArrayList<User> selectList(); //회원 정보 목록
	
}
