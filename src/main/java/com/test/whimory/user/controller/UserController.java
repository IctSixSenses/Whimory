package com.test.whimory.user.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

//import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.test.whimory.user.model.service.UserService;

import com.test.whimory.user.model.vo.User;
import com.test.whimory.user.model.vo.UserDrop;

//회원 컨트롤러
@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	// 의존성 주입
	// 사용할 클래스 레퍼런스 자동 처리

	@Autowired
	private UserService userService;

	// 이메일 인증을 위한 의존성 주입
	// @Autowired
	// private JavaMailSender mailSender;

	// 암호화 추가 (왜 어노테이션이 안먹는지 모르겠습니다..)
	 @Autowired
	 private BCryptPasswordEncoder bcryptPasswordEncoder;
	//BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();

	// 아이디 중복 체크
	@RequestMapping(value = "idchk.do", method = RequestMethod.POST)
	public void idCheckMethod(@RequestParam("user_id") String user_id, HttpServletResponse response)
			throws IOException {
		// String userid = request.getParameter("userid");

		int idcount = userService.selectCheckId(user_id);

		String returnValue = null;
		if (idcount == 0) {
			returnValue = "ok";
		} else {
			returnValue = "dup";
		}

		// response 를 이용해서 클라이언트로 출력스트림 만들고
		// 값 보내기
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnValue);
		out.flush();
		out.close();
	}

	// 로그인 페이지로 이동하기
	@RequestMapping("loginPage.do")
	public String moveLoginPage() {
		return "user/loginPage";
	}

	// 회원가입 페이지로 이동하기
	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
		return "user/enrollPage";
	}

	// 아이디 비밀번호 찾기 페이지
	@RequestMapping("findaccount.do")
	public String moveFindPage() {
		return "user/findAccount";
	}

	// 비암호화 확인용 (회원가입 기능 완료 후 암호화 예정)
//	@RequestMapping(value="login.do", method=RequestMethod.POST)
//	public String loginMethod(User user, HttpServletRequest request,
//			HttpSession session, SessionStatus status, 
//			Model model) {
//		//System.out.println("login.do : " + member);
//		logger.info("login.do : " + user);
//		
//		User loginUser = userService.selectLogin(user);
//		
//		//아이디랑 비밀번호 값을 받아온다.
//		String user_id = request.getParameter("user_id");
//		String user_pwd = request.getParameter("user_pwd");
//		//user vo에 넣어줌
//		user.setUser_id(user_id);
//		user.setUser_pwd(user_pwd);
//		
//		//회원 정보 비밀번호 값이 일치하는지 비교한다
//		if(loginUser != null && user.getUser_id().equals(loginUser.getUser_id())) {
//			//세션 객체 생성 > 세션 안에 회원정보 저장
//			session.setAttribute("loginUser", loginUser);
//			status.setComplete(); //요청 성공. 200 전송보냄
//			return "common/main";
//			
//		}else { //로그인 안되면 실패 메시지 출력
//			model.addAttribute("message", "로그인 실패!");
//			return "common/error";
//		}		
//	}

	// 암호화 로그인
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginMethod(User user, HttpSession session, SessionStatus status, Model model) {
		logger.info("login.do : " + user);

		User loginUser = userService.selectUser(user.getUser_id());

		if (loginUser != null && bcryptPasswordEncoder.matches(user.getUser_pwd(), loginUser.getUser_pwd())
				&& loginUser.getLogin_access_yn().equals("Y")) {
			// 세션 객체 생성 > 세션 안에 회원정보 저장
			session.setAttribute("loginUser", loginUser);
			status.setComplete(); // 요청 성공. 200 전송보냄
			return "common/main";
		} else {
			model.addAttribute("message", "로그인 실패!");
			return "common/error";
		}
	}

	// 로그아웃 기능(세션 해제)
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
			return "common/main";
		} else {
			model.addAttribute("message", "로그인 세션이 존재하지 않습니다.");
			return "common/error";
		}
	}

	// 이메일 인증 기능
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증번호 : " + email);

		// 인증번호 난수 생성
		Random random = new Random();
		int checkNum = random.nextInt(999998) + 1;
		logger.info("인증번호 " + checkNum);

		// 이메일 정보
		String setFrom = "hjpark7938@gmail.com";
		String toMail = email;
		String title = "[휘모리] 회원가입 인증 이메일 입니다.";
		String content = "안녕하세요. 휘모리(Whimory)를 방문해주셔서 감사합니다. <br><br>" + "인증번호는 " + checkNum + " 입니다. <br><br>"
				+ "해당 인증번호를 인증번호 확인 란에 입력해주세요.";

		// 이메일 전송 코드
		try {
//		MimeMessage message = mailSender.createMimeMessage(); //메일 메시지 객체 생성
//		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8"); //메시지 및 인코딩
//		helper.setFrom(setFrom); //발신자
//		helper.setTo(toMail); //수신자
//		helper.setSubject(title); //제목
//		helper.setText(content, true); //내용
//		mailSender.send(message); //메일 전송

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 인증번호를 string으로 형변환 한다.
		String num = Integer.toString(checkNum);
		return num;
	}

	// 마이페이지 들어갔을때 내 정보 조회
	@RequestMapping("myinfo.do")
	public ModelAndView myInfoMethod(@RequestParam("user_id") String user_id, ModelAndView mv) {

		User user = userService.selectUser(user_id);

		if (user != null) {
			mv.addObject("user", user);
			mv.setViewName("user/myInfoPage");
		} else {
			mv.addObject("message", user_id + "회원조회 실패!");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 회원 정보 상세보기 페이지
	@RequestMapping("uinfo.do")
	public ModelAndView userInfoMethod(@RequestParam("user_id") String user_id, ModelAndView mv) {

		User user = userService.selectUser(user_id);

		if (user != null) {
			mv.addObject("user", user);
			mv.setViewName("user/userInfoPage");
		} else {
			mv.addObject("message", user_id + "회원조회 실패!");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 아이디 찾기
	@RequestMapping("findid.do")
	public ModelAndView findIdMethod(User user, ModelAndView mv) {
		System.out.println(user.getuser_name() + user.getEmail());
		User findUser = userService.selectUserId(user);

		if (findUser != null) {
			mv.addObject("user", findUser);
			mv.setViewName("user/findId");
		} else {
			mv.addObject("message", user.getuser_name() + "아이디의 정보가 없습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 비밀번호 찾기
	@RequestMapping("findpwd.do")
	public ModelAndView findPwdMethod(User user, ModelAndView mv) {
		System.out.println(user.getuser_name() + user.getEmail());
		User findUser = userService.selectUserPwd(user);

		if (findUser != null) {
			mv.addObject("user", findUser);
			mv.setViewName("user/changePwd");
		} else {
			mv.addObject("message", user.getuser_name() + "아이디의 정보가 없습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 비밀번호 변경하기
	@RequestMapping(value = "changePwd.do", method = RequestMethod.POST)
	public String userPwdUpdateMethod(User user, Model model, @RequestParam("origin_userpwd") String originUserpwd) {
		logger.info("changPwd.do : " + user);
		logger.info("opwd : " + originUserpwd);

		// 새로운 암호가 전송이 왔다면
		String user_pwd = user.getUser_pwd().trim();
		if (user_pwd != null && user_pwd.length() > 0) {
			// 기존 암호와 다른 값이면
			if (!bcryptPasswordEncoder.matches(user_pwd, originUserpwd)) {
				user.setUser_pwd(bcryptPasswordEncoder.encode(user_pwd));
			}
		} else {
			// 새로운 암호가 없다면, 원래 암호를 기록함
			user.setUser_pwd(originUserpwd);
		}

		logger.info("after : " + user);
		// userService.updatePwd
		if (userService.updatePwd(user) > 0) {
			// 로그인 화면으로 감
			return "redirect:main.do";
		} else {
			model.addAttribute("message", user.getUser_id() + " 비밀번호 변경 실패!");
			return "common/error";
		}

	}

	// 회원 정보 리스트
	@RequestMapping("ulist.do")
	public String userListViewMethod(Model model) {
		ArrayList<User> list = userService.selectList();

		if (list.size() > 0) {
			model.addAttribute("list", list);
			return "user/userListView";
		} else {
			model.addAttribute("message", "회원 목록이 존재하지 않습니다.");
			return "common/error";
		}
	}

	// 탈퇴회원 리스트
	@RequestMapping("udlist.do")
	public String userDListViewMethod(Model model) {
		ArrayList<UserDrop> list = userService.selectDList();

		if (list.size() > 0) {
			model.addAttribute("list", list);
			return "user/userDListView";
		} else {
			model.addAttribute("message", "회원 목록이 존재하지 않습니다.");
			return "common/error";
		}
	}

	// 회원 가입 (기본형)
	@RequestMapping(value = "uinsert.do", method = RequestMethod.POST)
	public String userInsert(User user, Model model) {
		logger.info("enroll.do : " + user);

		// 패스워드 암호화 처리
		user.setUser_pwd(bcryptPasswordEncoder.encode(user.getUser_pwd()));
		// 회원 가입 기능
		if (userService.insertUser(user) > 0) {
			return "common/main";
		} else {
			model.addAttribute("message", "회원 가입 실패!");
			return "common/error";
		}
	}
	
	//카카오 로그인(창 띄우기)
	@RequestMapping(value="/kakaologin.do", method=RequestMethod.POST)
    public String kakaoLogin() {
        StringBuffer loginUrl = new StringBuffer();
        loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
        loginUrl.append("c1244ea54addb30b197f09979e9b9301"); 
        loginUrl.append("&redirect_uri=");
        loginUrl.append("http://localhost:8800/Whimory"); 
        loginUrl.append("&response_type=code");
        
        return "redirect:"+loginUrl.toString();
    }
	
	//카카오 로그인 버튼을 눌렀을 때(210929)
//
	@RequestMapping(value = "/loginGetKakaoAuthUrl.do", method=RequestMethod.POST)
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=c1244ea54addb30b197f09979e9b9301"
				+ "&redirect_uri=http://localhost:8800/Whimory/loginOauthKakao.do"
				+ "&response_type=code";
		
		return reqUrl;
	}
	
	// 카카오 연동정보 조회
	@RequestMapping(value = "/loginOauthKakao.do",  method=RequestMethod.POST)
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model) throws Exception {

		System.out.println("#########" + code);
        String access_Token = getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);
        
        
        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
       
        JSONObject kakaoInfo =  new JSONObject(userInfo);
        model.addAttribute("kakaoInfo", kakaoInfo);
        
        return "redirect:/common/main"; //본인 원하는 경로 설정
	}
	
    //토큰발급
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=c1244ea54addb30b197f09979e9b9301");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8800/Whimory/loginOauthKakao.do");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
	
    //유저정보조회
    public HashMap<String, Object> getUserInfo (String access_Token) {

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
            userInfo.put("accessToken", access_Token);
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }


	// 카카오 로그인 확인(2)
	@RequestMapping(value = "/kakao.do", method = RequestMethod.POST)
	public Map<String, Object> kakaoLoginPro(@RequestParam Map<String, Object> paramMap, HttpSession session)
			throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();

		Map<String, Object> kakaoConnectionCheck = userService.kakaoConnectionCheck(paramMap);
		if (kakaoConnectionCheck == null) { // 일치하는 이메일 없으면 가입
			resultMap.put("JavaData", "register");
		} else if (kakaoConnectionCheck.get("KAKAOLOGIN") == null && kakaoConnectionCheck.get("EMAIL") != null) {
			System.out.println("kakaoLogin");
			userService.setKakaoConnection(paramMap);
			Map<String, Object> loginCheck = userService.userKakaoLoginPro(paramMap);
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		} else {
			Map<String, Object> loginCheck = userService.userKakaoLoginPro(paramMap);
			session.setAttribute("userInfo", loginCheck);
			resultMap.put("JavaData", "YES");
		}

		return resultMap;
	}
	
	

	// sns 로그인 했을 경우 추가 정보 입력
	@RequestMapping(value = "setSnsInfo.do")
	public String setKakaoInfo(Model model, HttpSession session, @RequestParam Map<String, Object> paramMap) {
		System.out.println("setKakaoInfo");
		System.out.println("param ==>" + paramMap);

		model.addAttribute("email", paramMap.get("email"));
		model.addAttribute("password", paramMap.get("id"));
		model.addAttribute("flag", paramMap.get("flag"));
		return "user/setSnsInfo";
	}

	// 로그인 허용
	@RequestMapping("loginOK.do")
	public String changeLoginOKMethod(User user, Model model) {
		logger.info("loginOK.do : " + user.getUser_id() + ", " + user.getLogin_access_yn());

		if (userService.updateLoginOk(user) > 0) {
			return "redirect:ulist.do";
		} else {
			model.addAttribute("message", "로그인 제한/허용 처리 오류");
			return "common/error";
		}
	}

	// 관리자 권한 변경
	@RequestMapping("admin.do")
	public String changeAdminMethod(User user, Model model) {
		logger.info("admin.do : " + user.getUser_id() + ", " + user.getAdmin_yn());

		if (userService.updateLoginOk(user) > 0) {
			return "redirect:ulist.do";
		} else {
			model.addAttribute("message", "관리자 권한 부여 처리 오류");
			return "common/error";
		}
	}

	// 회원 정보 수정
	@RequestMapping(value = "uupdate.do", method = RequestMethod.POST)
	public String userUpdateMethod(User user, Model model, @RequestParam("origin_userpwd") String originUserpwd) {
		logger.info("uupdate.do : " + user);
		logger.info("opwd : " + originUserpwd);

		// 새로운 암호가 전송이 왔다면
		String user_pwd = user.getUser_pwd().trim();
		if (user_pwd != null && user_pwd.length() > 0) {
			// 기존 암호와 다른 값이면
			if (!bcryptPasswordEncoder.matches(user_pwd, originUserpwd)) {
				user.setUser_pwd(bcryptPasswordEncoder.encode(user_pwd));
			}
		} else {
			// 새로운 암호가 없다면, 원래 암호를 기록함
			user.setUser_pwd(originUserpwd);
		}

		logger.info("after : " + user);

		if (userService.updateUser(user) > 0) {
			// 컨트롤러의 메소드를 직접 호출할 수 있음
			return "redirect:myinfo.do?user_id=" + user.getUser_id();
		} else {
			model.addAttribute("message", user.getUser_id() + " 회원정보 수정 실패!");
			return "common/error";
		}

	}

	// 회원 이름 검색
	@RequestMapping(value = "usearch.do", method = RequestMethod.POST)
	public String userSearchMethod(HttpServletRequest request, Model model) {
		String action = request.getParameter("action");
		String keyword = null;

			keyword = request.getParameter("keyword");

		// 서비스 메소드로 전송하고 결과받을 리스트 준비
		ArrayList<User> list = null;

		switch (action) {
		case "id":
			list = userService.selectSearchUserid(keyword);
			break;
		}

		if (list.size() > 0) {
			model.addAttribute("list", list);
			return "user/userListView";
		} else {
			model.addAttribute("message", action + " 검색에 대한 " + keyword + " 결과가 존재하지 않습니다.");
			return "common/error";
		}
	}
	
	//탈퇴회원 목록 검색창
	@RequestMapping(value = "usearchD.do", method = RequestMethod.POST)
	public String userSearchDMethod(HttpServletRequest request, Model model) {
		String action = request.getParameter("action");
		String keyword = null;

			keyword = request.getParameter("keyword");

		// 서비스 메소드로 전송하고 결과받을 리스트 준비
		ArrayList<UserDrop> list = null;

		switch (action) {
		case "id":
			list = userService.selectSearchDUserid(keyword);
			break;
		}

		if (list.size() > 0) {
			model.addAttribute("list", list);
			return "user/userDListView";
		} else {
			model.addAttribute("message", action + " 검색에 대한 " + keyword + " 결과가 존재하지 않습니다.");
			return "common/error";
		}
	}

	// 회원 탈퇴
	@RequestMapping("udelete.do")
	public String userDeleteMethod(@RequestParam("user_id") String user_id, HttpServletRequest request, Model model) {

		if (userService.updateUserD(user_id) > 0) {
			if (userService.insertUserDrop(user_id) > 0) {
				HttpSession session = request.getSession(false);
				session.invalidate();
				return "common/main";
			} else {
				model.addAttribute("message", user_id + "회원 탈퇴 실패!");
				return "common/error";
			}
		} else {
			model.addAttribute("message", user_id + "회원 탈퇴 실패!");
			return "common/error";
		}
	}

	
	//관리자 권한 부여
	@RequestMapping("adminchange.do")
	public String adminChangeMethod(@RequestParam("user_id") String user_id, Model model) {
		if(userService.updateAdmin(user_id)>0) {
			return "redirect:ulist.do";
		}else {
			model.addAttribute("message", user_id + " 권한 변경 실패!");
			return "common/error";
		}
	}
	
	//일반 회원 권한 부여
	@RequestMapping("adminchangeN.do")
	public String adminChangeNMethod(@RequestParam("user_id") String user_id, Model model) {
		if(userService.updateAdminN(user_id)>0) {
			return "redirect:ulist.do";
		}else {
			model.addAttribute("message", user_id + " 권한 변경 실패!");
			return "common/error";
		}
	}
	
	//접속 제한 버튼
		@RequestMapping("loginchangeN.do")
		public String loginChangeNMethod(@RequestParam("user_id") String user_id, Model model) {
			if(userService.updateloginN(user_id)>0) {
				return "redirect:ulist.do";
			}else {
				model.addAttribute("message", user_id + " 권한 변경 실패!");
				return "common/error";
			}
		}
		
		//접속 허용 버튼
		@RequestMapping("loginchangeY.do")
		public String loginChangeYMethod(@RequestParam("user_id") String user_id, Model model) {
			if(userService.updateloginOK(user_id)>0) {
				return "redirect:ulist.do";
			}else {
				model.addAttribute("message", user_id + " 권한 변경 실패!");
				return "common/error";
			}
		}
		
		
	

}
