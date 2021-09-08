package com.test.whimory.user.model.service;

import com.test.whimory.user.model.vo.User;

public interface UserService {
	User selectUser(String user_id);//회원 정보 조회하기
	User selectLogin(User user); //로그인 관련 메소드

}
