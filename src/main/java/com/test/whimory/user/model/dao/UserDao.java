package com.test.whimory.user.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.whimory.user.model.vo.User;

@Repository("userDao")//UserDao
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate session; //Spring DI 의존성
	
	//회원 로그인 기능 수행
	public User selectLogin(User user) {
		return session.selectOne("userMapper.selectLogin", user);
	}

	//회원 정보 선택하기
	public User selectUser(String user_id) {
		return session.selectOne("userMapper.selectUser", user_id);
	}
	
	//회원 목록 보기
	public ArrayList<User> selectList(){
		List<User> list = session.selectList("userMapper.selectList");
		return (ArrayList<User>)list;
	}
	
	//회원 가입 (기본형)
	public int insertUser(User user) {
		return session.insert("userMapper.insertUser", user);
	}
	
	//회원 정보 수정
	public int updateUser(User user) {
		return session.update("userMapper.updateUser", user);
	}
	
	//회원 이름 검색하기
	public ArrayList<User> selectSearchUserid(String keyword) {
		List<User> list = session.selectList("userMapper.selectSearchUserid", keyword);
		return (ArrayList<User>)list;
	}
	
	//회원 탈퇴
	public int deleteUser(String user_id) {
		return session.delete("userMapper.deleteUser", user_id);
	}
	
	
	
	//카카오 로그인
	
	
	//메일 인증 하는걸 어떻게 해야할까...
	
}
