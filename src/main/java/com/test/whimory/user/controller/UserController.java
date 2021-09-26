package com.test.whimory.user.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
	
	//이메일 인증을 위한 의존성 주입
	@Autowired
	private JavaMailSender mailSender;
	
	//암호화 추가
	//@Autowired
	//private BCryptPasswordEncoder bcryptPasswordEncoder;
	BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();

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
	
	//아이디 비밀번호 찾기 페이지
	@RequestMapping("findaccount.do")
	public String moveFindPage() {
		return "user/findAccount";
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
	
	//이메일 인증 기능
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
	logger.info("이메일 데이터 전송 확인");
	logger.info("인증번호 : " + email);
	
	//인증번호 난수 생성
	Random random = new Random();
	int checkNum = random.nextInt(999998) + 1;
	logger.info("인증번호 " + checkNum);
	
	//이메일 정보
	String setFrom = "hjpark7938@gmail.com";
	String toMail = email;
	String title = "[휘모리] 회원가입 인증 이메일 입니다.";
	String content = "안녕하세요. 휘모리(Whimory)를 방문해주셔서 감사합니다. <br><br>"
			+ "인증번호는 " + checkNum + " 입니다. <br><br>"
					+ "해당 인증번호를 인증번호 확인 란에 입력해주세요.";
	
	//이메일 전송 코드
	try {
		MimeMessage message = mailSender.createMimeMessage(); //메일 메시지 객체 생성
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8"); //메시지 및 인코딩
		helper.setFrom(setFrom); //발신자
		helper.setTo(toMail); //수신자
		helper.setSubject(title); //제목
		helper.setText(content, true); //내용
		mailSender.send(message); //메일 전송

		
	}catch(Exception e) {
		e.printStackTrace();
	}
	//인증번호를 string으로 형변환 한다.
	String num = Integer.toString(checkNum);
	return num;
	}
	
	//마이페이지 들어갔을때 내 정보 조회
	@RequestMapping("myinfo.do")
	public ModelAndView myInfoMethod(
			@RequestParam("user_id") String user_id, ModelAndView mv) {
		
		User user = userService.selectUser(user_id);
		
		if(user != null) {
			mv.addObject("user", user);
			mv.setViewName("user/myInfoPage");
		}else {
			mv.addObject("message", user_id + "회원조회 실패!");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	//아이디 변경
		@RequestMapping("findid.do")
		public ModelAndView findIdMethod(
				User user, ModelAndView mv) {
			
			User findUser = userService.selectUserId(user);
			
			if(user != null) {
				mv.addObject("user", user);
				mv.setViewName("user/findId");
			}else {
				mv.addObject("message", user.getuser_name() + "아이디 조회 실패!");
				mv.setViewName("common/error");
			}
			
			return mv;
		}
		
		//비밀번호 변경
		@RequestMapping("changepwd.do")
		public ModelAndView changePwdMethod(
				User user, ModelAndView mv) {
			
		//	User changePwd = userService.updatePwd(user);
			
			if(user != null) {
				mv.addObject("user", user);
				mv.setViewName("user/findId");
			}else {
				mv.addObject("message", user + "비밀번호 변경 실패!");
				mv.setViewName("common/error");
			}
			
			return mv;
		}
	
	//회원 정보 리스트
	@RequestMapping("ulist.do")
	public String userListViewMethod(Model model) {
		ArrayList<User> list = userService.selectList();
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "user/userListView";
		}else {
			model.addAttribute("message", "회원 목록이 존재하지 않습니다.");
			return "common/error";
		}
	}
	
	//회원 가입 (기본형)
	@RequestMapping(value="uinsert.do", method=RequestMethod.POST)
	public String userInsert(User user, Model model) {
		logger.info("enroll.do : " + user);
		
		//패스워드 암호화 처리
		user.setUser_pwd(bcryptPasswordEncoder.encode(user.getUser_pwd()));
	//회원 가입 기능
		if(userService.insertUser(user) > 0) {
			return "common/main";
		}else {
			model.addAttribute("message", "회원 가입 실패!");
			return "common/error";
		}		
	}
	
	//카카오 로그인 확인
	@RequestMapping(value="/kakaoLoginPro.do", method=RequestMethod.POST)
	public Map<String, Object> kakaoLoginPro(@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		
		Map<String, Object> kakaoConnectionCheck = userService.kakaoConnectionCheck(paramMap);
		if(kakaoConnectionCheck == null) { //일치하는 이메일 없으면 가입
			resultMap.put("JavaData", "register");
		}else if(kakaoConnectionCheck.get("KAKAOLOGIN") == null && kakaoConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 카카오 연동 안되어 있을시
			System.out.println("kakaoLogin");
			userService.setKakaoConnection(paramMap);
			Map<String, Object> loginCheck = userService.userKakaoLoginPro(paramMap);
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}else{
			Map<String, Object> loginCheck = userService.userKakaoLoginPro(paramMap);
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}
		
		return resultMap;
	}
	
	//sns 로그인 했을 경우 추가 정보 입력
	@RequestMapping(value="setSnsInfo.do")
	public String setKakaoInfo(Model model,HttpSession session,@RequestParam Map<String,Object> paramMap) {
		System.out.println("setKakaoInfo");	
		System.out.println("param ==>"+paramMap);
		
		model.addAttribute("email",paramMap.get("email"));
		model.addAttribute("password",paramMap.get("id"));
		model.addAttribute("flag",paramMap.get("flag"));
		return "user/setSnsInfo";
	}
	
	//로그인 허용
	@RequestMapping("loginOK.do")
	public String changeLoginOKMethod(User user, 
			Model model) {
		logger.info("loginOK.do : " + user.getUser_id()
						+ ", " + user.getLogin_access_yn());
		
		if(userService.updateLoginOk(user) > 0) {
			return "redirect:ulist.do";
		}else {
			model.addAttribute("message", "로그인 제한/허용 처리 오류");
			return "common/error";
		}
	}
	
	//회원 정보 수정
	@RequestMapping(value="uupdate.do", method=RequestMethod.POST)
	public String userUpdateMethod(User user, 
			Model model, 
			@RequestParam("origin_userpwd") String originUserpwd) {
		logger.info("uupdate.do : " + user);
		logger.info("opwd : " + originUserpwd);		
		
		//새로운 암호가 전송이 왔다면
		String user_pwd = user.getUser_pwd().trim();
		if(user_pwd != null && user_pwd.length() > 0) {
			//기존 암호와 다른 값이면
			if(!bcryptPasswordEncoder.matches(user_pwd, originUserpwd)) {
				user.setUser_pwd(bcryptPasswordEncoder.encode(
					user_pwd));
			}
		}else {
			//새로운 암호가 없다면, 원래 암호를 기록함
			user.setUser_pwd(originUserpwd);
		}
		
		logger.info("after : " + user);
		
		if(userService.updateUser(user) > 0) {
			//컨트롤러의 메소드를 직접 호출할 수 있음
			return "redirect:myinfo.do?user_id=" + user.getUser_id();
		}else {
			model.addAttribute("message", 
					user.getUser_id() + " 회원정보 수정 실패!");
			return "common/error";
		}	
		
	}
	
	
	//회원 이름 검색
	@RequestMapping(value="usearch.do", method=RequestMethod.POST)
	public String memberSearchMethod(
			HttpServletRequest request, Model model) {
		String action = request.getParameter("action");
		String keyword = null, beginDate = null, endDate = null;
		
		if(action.equals("enrolldate")) {
			beginDate = request.getParameter("begin");
			endDate = request.getParameter("end");
		}else {
			keyword = request.getParameter("keyword");
		}
		
		//서비스 메소드로 전송하고 결과받을 리스트 준비
		ArrayList<User> list = null;
		
		switch(action) {
		case "id":		list = userService.selectSearchUserid(keyword);
					break;
		}
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "user/userListView";
		}else {
			model.addAttribute("message", 
					action + " 검색에 대한 "
					+ keyword + " 결과가 존재하지 않습니다.");
			return "common/error";
		}
	}
	
}
