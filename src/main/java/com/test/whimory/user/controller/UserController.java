package com.test.whimory.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.test.whimory.user.model.service.UserService;
import com.test.whimory.user.model.vo.User;
//회원 컨트롤러
@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	//의존성 주입
	//사용할 클래스 레퍼런스 자동 처리
	
	@Autowired
	private UserService userService;
	
	//암호화 추가 예정
//	@Autowired
//	private BcryptPasswordEncoder bcryptPasswordEncoder;

	//로그인 페이지로 이동하기
	@RequestMapping("loginPage.do")
	public String moveLoginPage() {
		return "user/loginPage";
	}
	
	//회원가입 페이지로 이동하기
	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
		return "user/enrollPage";
	}
	
	//비암호화 확인용 (회원가입 기능 완료 후 암호화 예정)
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginMethod(User user, HttpServletRequest request,
			HttpSession session, SessionStatus status, 
			Model model) {
		//System.out.println("login.do : " + member);
		logger.info("login.do : " + user);
		
		User loginUser = userService.selectLogin(user);
		
		//아이디랑 비밀번호 값을 받아온다.
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		//user vo에 넣어줌
		user.setUser_id(user_id);
		user.setUser_pwd(user_pwd);
		
		//회원 정보 비밀번호 값이 일치하는지 비교한다
		if(loginUser != null && user.getUser_id().equals(loginUser.getUser_id())) {
			//세션 객체 생성 > 세션 안에 회원정보 저장
			session.setAttribute("loginUser", loginUser);
			status.setComplete(); //요청 성공. 200 전송보냄
			return "common/main";
			
		}else { //로그인 안되면 실패 메시지 출력
			model.addAttribute("message", "로그인 실패!");
			return "common/error";
		}		
	}
	
	//로그아웃 기능(세션 해제)
	@RequestMapping("logout.do")
	public String logoutMethod(
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
			return "common/main";
		}else {
			model.addAttribute("message", "로그인 세션이 존재하지 않습니다.");
			return "common/error";
		}
	}
}
