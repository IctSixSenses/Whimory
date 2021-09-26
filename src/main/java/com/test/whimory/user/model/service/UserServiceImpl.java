package com.test.whimory.user.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.whimory.user.model.dao.UserDao;
import com.test.whimory.user.model.vo.User;
import com.test.whimory.user.model.vo.UserDrop;

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
	
	//탈퇴 회원 목록
		@Override
		public ArrayList<UserDrop> selectDList(){
			return userDao.selectDList();
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
	
	//탈퇴회원 아이디 정보 찾기
	@Override
	public ArrayList<UserDrop> selectSearchDUserid(String keyword) {
		return userDao.selectSearchDUserid(keyword);
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
	
	//회원아이디 찾기
	@Override
	public User selectUserId(User user) {
		return userDao.selectUserId(user);
	}
	
	//회원 비밀번호 페이지 넘어가기
	@Override
	public User selectUserPwd(User user) {
		return userDao.selectUserPwd(user);
	}
	
	//비밀번호 변경하기
	@Override
	public int updatePwd(User user) {
		return userDao.updatePwd(user);
	}
	
	//아이디 중복검사
	@Override
	public int selectCheckId(String user_id) {
		return userDao.selectCheckId(user_id);
	}
	
	//일반 회원 권한 부여
	@Override
	public int updateAdminN(String user_id) {
		return userDao.updateAdminN(user_id);
	}
	
	//로그인 제한
	@Override
	public int updateloginN(String user_id) {
		return userDao.updateloginN(user_id);
	}
	
	//로그인 허용
	@Override
	public int updateloginOK(String user_id) {
		return userDao.updateloginOK(user_id);
	}
	
	//로그인 제한 부여
	@Override
	public int updateLoginOK(User user) {
		return userDao.updateLoginOK(user);
	}

	//회원 탈퇴(영구탈퇴)
	@Override
	public int deleteUser(String user_id) {
		return userDao.deleteUser(user_id);
	}
	
	//회원 탈퇴 시 동작
	@Override
	public int insertUserDrop(String user_id) {
		return userDao.insertUserDrop(user_id);
	}
	
	//회원 탈퇴시 동작(로그인 방지)
	@Override
	public int updateUserD(String user_id) {
		return userDao.updateUserD(user_id);
	}
	
	@Override
	public int updateAdmin(String user_id) {
		return userDao.updateAdmin(user_id);
	}
	
	
}
