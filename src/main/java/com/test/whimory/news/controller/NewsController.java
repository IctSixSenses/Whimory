package com.test.whimory.news.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.whimory.news.model.service.NewsService;
import com.test.whimory.news.model.vo.News;
import com.test.whimory.user.model.vo.User;

@Controller
public class NewsController {
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);

	@Autowired
	private NewsService newsService;

	// 언론보도 전체 리스트 조회
	@RequestMapping("wlist.do")
	public String newsListMethod(Model model, HttpSession session) {
		ArrayList<News> list = newsService.selectList();

		if (list.size() > 0) {
			model.addAttribute("list", list);

			//관리자 리스트 페이지
			User loginUser = (User) session.getAttribute("loginUser");
			if (loginUser != null && loginUser.getAdmin_yn().equals("Y")) {
				return "news/newsAdminListView";
			} else {
				// 관리자가 아닌 고객이 상세보기 요청했을 때
				return "news/newsListView";
			}
		} else {
			model.addAttribute("message", "등록된 공지사항 목록보기 실피");
			return "common/error";
		}
	}

	// 언론보도 글 번호로 상세보기 처리
	@RequestMapping("wdetail.do")
	public String newsDetailMethod(@RequestParam("news_no") int news_no, Model model, HttpSession session) {
		News news = newsService.selectOne(news_no);
		
		if (news != null) {
			model.addAttribute("news", news);
			// 관리자가 상세보기 요청했을 때
			User loginUser = (User) session.getAttribute("loginUser");
			if (loginUser != null && loginUser.getAdmin_yn().equals("Y")) {
				return "news/newsAdminDetailView";
			} else {
				// 관리자가 아닌 고객이 상세보기 요청했을 때
				return "news/newsDetailView";
			}

		} else {
			model.addAttribute("message", news_no + "번 언론보도 상세보기 실패");
			return "common/error";
		}
	}
}
