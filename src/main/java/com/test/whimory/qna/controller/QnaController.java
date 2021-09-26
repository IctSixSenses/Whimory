package com.test.whimory.qna.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.qna.model.service.QnaService;
import com.test.whimory.qna.model.vo.QnaAnswer;
import com.test.whimory.qna.model.vo.QnaQuestion;
import com.test.whimory.user.model.vo.User;

@Controller
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	private QnaService qnaService;

	// qna 질문 리스트 전체 조회
	@RequestMapping("qlist.do")
	public ModelAndView qnaListMethod(ModelAndView mv, @RequestParam(name = "page", required = false) String page,
			HttpSession session) {
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

			User loginUser = (User) session.getAttribute("loginUser");
			if (loginUser != null && loginUser.getAdmin_yn().equals("Y")) {
				mv.setViewName("qna/qnaAdminListView");
			} else {
				mv.setViewName("qna/qnaListView");
			}

		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 질문 글 번호로 상세보기 처리
	@RequestMapping("qdetail.do")
	public ModelAndView qnaDetailMethod(ModelAndView mv, @RequestParam("qq_no") int qq_no,
			@RequestParam("page") int page, HttpSession session) {
		QnaQuestion question = qnaService.selectOne(qq_no);

		ArrayList<QnaAnswer> alist = qnaService.selectAnswerList(qq_no); // 답변 조회

		if (question != null) {
			mv.addObject("question", question);
			mv.addObject("currentPage", page);
			mv.addObject("alist", alist);	// 답변 조회

			User loginUser = (User) session.getAttribute("loginUser");
			if (loginUser != null && loginUser.getAdmin_yn().equals("Y")) {
				mv.setViewName("qna/qnaAdminDetailView");
			} else {
				mv.setViewName("qna/qnaDetailView");
			}

		} else {
			mv.addObject("message", qq_no + "번 질문 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// qna 질문 등록 페이지 이동
	@RequestMapping("qwform.do")
	public String moveQnaWriteForm() {
		return "qna/qnaWriteForm";
	}

	// qna 질문 등록 요청
	@RequestMapping(value = "qinsert.do", method = RequestMethod.POST)
	public String qnaInsertMethod(QnaQuestion question, HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/qna_upfiles");

		// 첨부파일이 있을때만 업로드된 파일을 지정 폴더로 옮기기
		if (!mfile.isEmpty()) {
			String fileName = mfile.getOriginalFilename();
			if (fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));

					// 저장된 원본 파일의 이름 바꾸기 하려면...
					// 저장 폴더에 같은 이름의 파일이 있을 경우를 대비하기 위함
					// "년월일시분초.확장자" 형식으로 변경해 봄

					// 바꿀 파일명에 대한 문자열 만들기
					// 공지글 등록 요청 시점의 날짜정보를 이용함
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

					// 변경할 파일명 만들기
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					// 원본 파일의 확장자를 추출해서, 변경 파일명에 붙여줌
					renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);

					// 파일명 바꾸기 실행함 : java.io.File 을 이용함
					File originFile = new File(savePath + "\\" + fileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					if (!originFile.renameTo(renameFile)) {
						// renameTo() 메소드가 실패한 경우(false)
						// 직접 수동으로 바꾸기함
						// 원본 파일 읽어서 파일복사하고,
						// 원본 파일 삭제로 처리함

						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);

						int data = -1;
						byte[] buffer = new byte[1024];

						while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}

						fin.close();
						fout.close();
						originFile.delete(); // 원본 파일 삭제함
					} // 직접 이름바꾸기

					question.setQq_re_file(renameFileName);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패.");
					return "common/error";
				}

			} // 업로드된 파일이 있다면...

			question.setQq_org_file(mfile.getOriginalFilename());

			logger.info("qinsert.do : " + question);
		} // 첨부 파일 있을 때

		if (qnaService.insertQuestion(question) > 0) {
			return "redirect:qlist.do";
		} else {
			model.addAttribute("message", "질문 등록 실패.");
			return "common/error";
		}
	}

	// 첨부파일 다운로드 요청
	@RequestMapping("qfdown.do")
	public ModelAndView fileDownMethod(HttpServletRequest request, @RequestParam("ofile") String originFileName,
			@RequestParam("rfile") String renameFileName, ModelAndView mv) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/qna_upfiles");

		// 저장 폴더에서 파일 읽기 위해 경로 포함
		File renameFile = new File(savePath + "\\" + renameFileName);
		// response 에 다운 파일명 등록을 위한 파일 (경로 제외)
		File originalFile = new File(originFileName);

		/*
		* */

		mv.setViewName("filedown");
		mv.addObject("renameFile", renameFile);
		mv.addObject("originalFile", originalFile);

		return mv;
	}

	// 질문 수정 페이지 요청
	@RequestMapping("qupview.do")
	public String moveQnaUpdateView(@RequestParam("qq_no") int qq_no, Model model) {

		QnaQuestion question = qnaService.selectOne(qq_no);

		if (question != null) {
			model.addAttribute("question", question);
			return "qna/qnaUpdateForm";
		} else {
			model.addAttribute("message", qq_no + "번 질문 수정 페이지 이동 실패");
			return "common/error";
		}
	}

	// 질문 수정
	@RequestMapping(value = "qupdate.do", method = RequestMethod.POST)
	public String qnaUpdateMethod(QnaQuestion question, HttpServletRequest request, Model model,
			@RequestParam(name = "delFlag", required = false) String delFlag,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {

		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/qna_upfiles");

		// 원래 첨부파일이 있는데, 삭제를 선택한 경우
		if (question.getQq_org_file() != null && delFlag != null && delFlag.equals("yes")) {
			// 저장 폴더에서 파일을 삭제함
			new File(savePath + "\\" + question.getQq_re_file()).delete();
			question.setQq_org_file(null);
			question.setQq_re_file(null);
		}

		// 새로운 첨부파일이 있을때
		if (!mfile.isEmpty()) {
			// 저장 폴더의 이전 파일을 삭제함
			if (question.getQq_org_file() != null) {
				// 저장 폴더에서 파일을 삭제함
				new File(savePath + "\\" + question.getQq_re_file()).delete();
				question.setQq_org_file(null);
				question.setQq_re_file(null);
			}

			String fileName = mfile.getOriginalFilename();
			if (fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));

					// 저장된 첨부파일 이름 바꾸기
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

					// 변경할 파일명 만들기
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					// 원본 파일의 확장자를 추출해서, 변경 파일명에 붙여줌
					renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);

					// 파일명 바꾸기 실행함 : java.io.File 을 이용함
					File originFile = new File(savePath + "\\" + fileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					if (!originFile.renameTo(renameFile)) {
						// 파일 이름바꾸기 실패시 직접 바꾸기
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);

						int data = -1;
						byte[] buffer = new byte[1024];

						while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}

						fin.close();
						fout.close();
						originFile.delete(); // 저장된 원본 파일 삭제함
					} // 직접 이름바꾸기

					question.setQq_re_file(renameFileName);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패.");
					return "common/error";
				}

			} // 업로드된 파일이 있다면...

			question.setQq_org_file(mfile.getOriginalFilename());

			logger.info("qupdate.do : " + question);
		}

		if (qnaService.updateQuestion(question) > 0) {
			return "redirect:qlist.do";
		} else {
			model.addAttribute("message", question.getQq_no() + "번 질문 수정 실패.");
			return "common/error";
		}
	}

	// 질문 삭제
	@RequestMapping("qdelete.do")
	public String qnaDeleteMethod(@RequestParam("qq_no") int qq_no,
			@RequestParam(name = "rfile", required = false) String renameFileName, HttpServletRequest request,
			Model model) {
		if (qnaService.deleteQuestion(qq_no) > 0) {
			// 첨부파일이 있는 글일 때, 저장폴더에 있는 파일도 삭제함
			if (renameFileName != null) {
				new File(request.getSession().getServletContext().getRealPath("resources/qna_upfiles") + "\\"
						+ renameFileName).delete();
			}
			return "redirect:qlist.do";
		} else {
			model.addAttribute("message", qq_no + "번 질문 삭제 실패");
			return "common/error";
		}
	}

	// qna 질문 작성자로 검색
	@RequestMapping(value = "qsearchWriter.do", method = RequestMethod.POST)
	public ModelAndView qnaSearchWriterMethod(@RequestParam("keyword") String keyword, ModelAndView mv,
			@RequestParam(name = "page", required = false) String page) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 페이지 계산을 위해 총 목록갯수 조회
		int listCount = qnaService.selectSearchWriter(keyword).size();
		// 페이지 수 계산
		// 목록이 11개이면 총 2페이지가 나오게 계산식 작성
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		// 뷰 페이지에 페이지 숫자를 10개씩 보여지게 한다면
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
		Paging paging = new Paging(startRow, endRow);

		ArrayList<QnaQuestion> list = qnaService.selectSearchWriter(keyword);

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
			mv.addObject("message", keyword + "로 검색된 정보가 없습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// qna 질문 제목으로 검색
	@RequestMapping(value = "qsearchTitle.do", method = RequestMethod.POST)
	public ModelAndView qnaSearchTitleMethod(@RequestParam("keyword") String keyword, ModelAndView mv,
			@RequestParam(name = "page", required = false) String page) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 페이지 계산을 위해 총 목록갯수 조회
		int listCount = qnaService.selectSearchTitle(keyword).size();
		// 페이지 수 계산
		// 목록이 11개이면 총 2페이지가 나오게 계산식 작성
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		// 뷰 페이지에 페이지 숫자를 10개씩 보여지게 한다면
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
		Paging paging = new Paging(startRow, endRow);

		ArrayList<QnaQuestion> list = qnaService.selectSearchTitle(keyword);

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
			mv.addObject("message", keyword + "로 검색된 정보가 없습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// qna 질문 분류로 검색
	@RequestMapping(value = "qsearchCategory.do", method = RequestMethod.POST)
	public ModelAndView qnaSearchCategoryMethod(@RequestParam("keyword") String keyword, ModelAndView mv,
			@RequestParam(name = "page", required = false) String page) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 페이지 계산을 위해 총 목록갯수 조회
		int listCount = qnaService.selectSearchCategory(keyword).size();
		// 페이지 수 계산
		// 목록이 11개이면 총 2페이지가 나오게 계산식 작성
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		// 뷰 페이지에 페이지 숫자를 10개씩 보여지게 한다면
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
		Paging paging = new Paging(startRow, endRow);

		ArrayList<QnaQuestion> list = qnaService.selectSearchCategory(keyword);

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
			mv.addObject("message", keyword + "로 검색된 정보가 없습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// qna 질문 날짜로 검색
	@RequestMapping(value = "qsearchDate.do", method = RequestMethod.POST)
	public ModelAndView qnaSearchDateMethod(SearchDate sdate, ModelAndView mv,
			@RequestParam(name = "page", required = false) String page) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 페이지 계산을 위해 총 목록갯수 조회
		int listCount = qnaService.selectSearchDate(sdate).size();
		// 페이지 수 계산
		// 목록이 11개이면 총 2페이지가 나오게 계산식 작성
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		// 뷰 페이지에 페이지 숫자를 10개씩 보여지게 한다면
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
		Paging paging = new Paging(startRow, endRow);

		ArrayList<QnaQuestion> list = qnaService.selectSearchDate(sdate);

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
			mv.addObject("message", "해당 날짜로 검색된 정보가 없습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 답변 등록
	@RequestMapping(value = "ainsert.do", method = RequestMethod.POST)
	public String answerInsertMethod(QnaAnswer answer, @RequestParam("qq_no") int qq_no, @RequestParam("page") int page, Model model) {

		// 서비스 보내서 처리하고, 결과 리턴
		if (qnaService.insertAnswer(answer) > 0) {

			model.addAttribute("page", page);
			model.addAttribute("qq_no", answer.getQq_no());
			qnaService.updateQqyn(qq_no);
			return "redirect:qdetail.do?qq_no=" + answer.getQq_no();
		} else {
			model.addAttribute("message", answer.getQq_no() + "번 답변 등록 실패하였습니다.");
			return "common/error";
		}
	}

	// 답변 삭제
	@RequestMapping("adelete.do")
	public String answerDeleteMethod(@RequestParam("qq_no") int qq_no, @RequestParam("page") int page, 
									@RequestParam("qa_no") int qa_no, Model model) {
		if (qnaService.deleteAnswer(qa_no) > 0) {
			
			model.addAttribute("page", page);
			model.addAttribute("qq_no", qq_no);
			qnaService.updateQQYN(qq_no);
			return "redirect:qdetail.do";
		} else {
			model.addAttribute("message", qa_no + "번 답변 삭제 실패");
			return "common/error";
		}
	}
	
	// 해당 아이디의 qlist 조회
		@RequestMapping("qlistu.do")
		public ModelAndView qnaListUMethod(ModelAndView mv, @RequestParam(name = "page", required = false) String page,
				HttpSession session, HttpServletRequest request, SessionStatus status, Model model) {
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
			User loginUser = (User) session.getAttribute("loginUser");
			String keyword = loginUser.getUser_id(); //회원 정보를 가져와서 넣어줌
			Paging paging = new Paging(startRow, endRow, keyword);

			ArrayList<QnaQuestion> list = qnaService.selectListU(paging);

			if (list != null && list.size() > 0) {
				mv.addObject("list", list);
				mv.addObject("listCount", listCount);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startPage", startPage);
				mv.addObject("endPage", endPage);
				mv.addObject("limit", limit);

				//회원 정보 가져옴
				//User loginUser = (User) session.getAttribute("loginUser");
				
				if (loginUser != null && loginUser.getAdmin_yn().equals("Y")) {
					mv.setViewName("user/qnaAdminListView");
				} else {
					mv.setViewName("user/uqnaListView");
				}

			} else {
				mv.addObject("message", currentPage + "페이지 목록 조회 실패");
				mv.setViewName("common/error");
			}

			return mv;
		}
		
		
		// 현주 추가 : 관리자에서 답변 여부를 확인하기 위해 불러오는 부분
				@RequestMapping("qlista.do")
				public ModelAndView qnaListAMethod(ModelAndView mv, @RequestParam(name = "page", required = false) String page,
						HttpSession session, HttpServletRequest request, SessionStatus status, Model model) {
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
					User loginUser = (User) session.getAttribute("loginUser");
				//	String user_id = loginUser.getUser_id(); //회원 정보를 가져와서 넣어줌
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

						//회원 정보 가져옴
						//User loginUser = (User) session.getAttribute("loginUser");
						
						if (loginUser != null && loginUser.getAdmin_yn().equals("Y")) {
							mv.setViewName("user/qnaAdminListView");
						} else {
							mv.setViewName("user/uqnaListView");
						}

					} else {
						mv.addObject("message", currentPage + "페이지 목록 조회 실패");
						mv.setViewName("common/error");
					}

					return mv;
				}
}
