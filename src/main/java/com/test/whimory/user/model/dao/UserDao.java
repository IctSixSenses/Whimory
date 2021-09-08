package com.test.whimory.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.whimory.user.model.vo.User;

@Repository("userDao")
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate session; //Spring DI
	
	//회원 로그인 기능 수행
	public User selectLogin(User user) {
		return session.selectOne("userMapper.selectLogin", user);
	}

	//회원 정보 선택하기
	public User selectUser(String user_id) {
		return session.selectOne("userMapper.selectUser", user_id);
	}
}
