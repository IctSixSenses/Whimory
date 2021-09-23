package com.test.whimory.notice.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.whimory.common.Paging;
import com.test.whimory.notice.model.service.NoticeService;
import com.test.whimory.notice.model.vo.Notice;

@Controller
public class NoticeController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("nlist.do")
	public String noticeListMethod(Model model, @RequestParam(name="page", required=false) String page) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 페이지 계산을 위해 총 목록갯수 조회
		int listCount = noticeService.selectListCount();
		// 페이지 수 계산
		// 목록이 11개이면 총 2 페이지가 나오게 계산식 작성 ↓
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값을 지정
		// 뷰페이지에 페이지 숫자를 10개씩 보여지게 한다면
		int startPage = (int) ((double) currentPage / 10 + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		// 페이지 수가 10개이면
		int endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Paging paging = new Paging(startRow, endRow); // 객체로 준비함
		
		
		ArrayList<Notice> list = noticeService.selectList(paging);
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("limit", limit);
			
			return "notice/noticeListView";
		} else {
			model.addAttribute("messgae", "notice 전체 목록을 조회하지 못했습니다.");
			return "common/error";
		}
		
	} // noticeListMethod
	
	@RequestMapping("ndetail.do")
	public String noticeDetailMethod(@RequestParam("notice_no") int nNo, Model model) {
		
		noticeService.updateAddReadcount(nNo);
		Notice notice = noticeService.selectNotice(nNo);
		
		if(notice != null) {
			model.addAttribute("notice", notice);
			return "notice/noticeDetailView";
		} else {
			model.addAttribute("message", nNo + "번 게시글을 조회하지 못했습니다.");
			return "common/error";
		}
		
	} // noticeDetailMethod
	
	// 첨부파일 다운로드 요청 처리용
	@RequestMapping("nfdown.do")
	public ModelAndView fileDownMethod(ModelAndView mv, HttpServletRequest request, 
			@RequestParam("ofile") String originFileName, @RequestParam("rfile") String renameFileName) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");

		// 저장 폴더에서 파일 읽기 위한 경로 포함
		File renameFile = new File(savePath + "\\" + renameFileName);
		// response에 다운 파일명 등록을 위한 파일 (경로 제외)
		File originalFile = new File(originFileName);

		// 파일 다운용 뷰클래스 지정 및 보낼 객체명 저장
		mv.setViewName("filedown");
		mv.addObject("renameFile", renameFile);
		mv.addObject("originalFile", originalFile);

		return mv;
	} // fileDownMethod
	
	
	
	
}
