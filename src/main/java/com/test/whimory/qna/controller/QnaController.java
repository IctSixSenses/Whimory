package com.test.whimory.qna.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.whimory.common.Paging;
import com.test.whimory.qna.model.service.QnaService;
import com.test.whimory.qna.model.vo.QnaQuestion;

@Controller
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	private QnaService qnaService;

	// qna 질문 리스트 전체 조회
	@RequestMapping("qlist.do")
	public ModelAndView qnaListMethod(ModelAndView mv, @RequestParam(name = "page", required = false) String page) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 개수
		// 페이지 계산을 위해 총 목록개수
		int listCount = qnaService.selectListCount();
		// 페이지 수 계산
		// 목록이 11개이면 총 2페이지가 나오게 처리하는 계산식
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		// 뷰페이지에 페이지 숫자를 10개씩 보여지게 한다면
		int startPage = (int) ((double) currentPage / 10 + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝 값
		// 페이지 수가 10개이면
		int endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Paging paging = new Paging(startRow, endRow);

		ArrayList<QnaQuestion> list = qnaService.selectList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

			mv.setViewName("qna/qnaListView");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/error");
		}

		return mv;
	}
	
	// 질문 글 번호로 상세보기 처리
	@RequestMapping("qdetail.do")
	public String qnaDetailMethod(@RequestParam("qq_no") int qq_no, Model model, HttpSession session) {
		QnaQuestion question = qnaService.selectOne(qq_no);
		
		if (question != null) {
			model.addAttribute("question", question);
			return "qna/qnaDetailView";
		} else {
			model.addAttribute("message", qq_no + "번 공지 상세보기 실패!!!");
			return "common/error";
		}
	}

		
		
}
