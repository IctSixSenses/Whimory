package com.test.whimory.user.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.whimory.user.model.dao.UserDao;
import com.test.whimory.user.model.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	//Dao 연결
	@Autowired
	private UserDao userDao;
	
	//로그인 기능 수행
	@Override
	public User selectLogin(User user) {
		return userDao.selectLogin(user);
	}
	
	//회원 정보 찾기 
	@Override
	public User selectUser(String user_id) {
		return userDao.selectUser(user_id);
	}
	
	//회원 목록
	@Override
	public ArrayList<User> selectList(){
		return userDao.selectList();
	}

	@Override
	public Map<String, Object> userKakaoLoginPro(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setKakaoConnection(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> kakaoConnectionCheck(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//회원 아이디 정보 찾기
	@Override
	public ArrayList<User> selectSearchUserid(String keyword) {
		return userDao.selectSearchUserid(keyword);
	}
	
	//회원 정보 업데이트
	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	//로그인 제한
	@Override
	public int updateLoginOk(User user) {

		return 0;
	}
	
	//회원 가입
	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

}
