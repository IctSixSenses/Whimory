package com.test.whimory.user.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.whimory.user.model.vo.User;
import com.test.whimory.user.model.vo.UserDrop;

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
	
	//아이디 찾기
	public User selectUserId(User user) {
		return session.selectOne("userMapper.selectUserId", user);
	}
	
	//비밀번호 변경하기
	public int updatePwd(User user) {
		return session.update("userMapper.updatePwd", user);
	}

	//아이디 중복 체크
	public int selectCheckId(String user_id) {
		return session.selectOne("userMapper.selectCheckId", user_id);
	}
	
	//관리자 권한 변경
	public int updateAdmin(User user) {
		return session.update("userMapper.updateAdmin", user);
	}
	
	//로그인 제한ㄴ
	public int updateLoginOK(User user) {
		return session.update("userMapper.updateLoginOK", user);
	}

	//탈퇴회원 리스트
	public ArrayList<UserDrop> selectDList() {
		List<UserDrop> list = session.selectList("userMapper.selectDList");
		return (ArrayList<UserDrop>)list;
	}

	//비밀번호 변경 페이지로 넘어가기
	public User selectUserPwd(User user) {
		return session.selectOne("userMapper.selectUserPwd", user);
	}

	//회원 탈퇴시 데이터 옮기기
	public int insertUserDrop(String user_id) {
		return session.insert("userMapper.insertUserDrop", user_id);
	}

	//회원 탈퇴시 로그인 방지
	public int updateUserD(String user_id) {
		return session.update("userMapper.updateUserD", user_id);
	}
	
}
