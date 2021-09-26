package com.test.whimory.user.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.test.whimory.user.model.vo.User;
import com.test.whimory.user.model.vo.UserDrop;

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
	User selectUserId(User user);//회원 아이디 찾기
	int updatePwd(User user); //비밀번호 변경하기
	int selectCheckId(String user_id);
	int updateAdmin(String user_id);//관리자 권한 부여
	int updateLoginOK(User user);//로그인 제한
	ArrayList<UserDrop> selectDList();//탈퇴회원 리스트
	User selectUserPwd(User user);//비밀번호 찾기로 넘어가게끔하는 확인 용도
	int deleteUser(String user_id);//회원 탈퇴
	int insertUserDrop(String user_id); //회원 탈퇴 시 탈퇴회원 테이블에 데이터 삽입
	int updateUserD(String user_id); //회원 탈퇴 시 로그인 불가하게 설정
	int updateAdminN(String user_id);//일반회원으로 권한 변경
	ArrayList<UserDrop> selectSearchDUserid(String keyword);//탈퇴 테이블 검색기능
	int updateloginOK(String user_id); //접속 허용 버튼
	int updateloginN(String user_id); //접속 제한 버튼
	
}
