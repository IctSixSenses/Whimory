package com.test.whimory.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
		int limit = 10;
		// 페이지 계산을 위해 총 목록 개수 조회
		int listCount = noticeService.selectListCount();
		// 페이지 수 계산
		int maxPage = (int)((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값 지정
		// 뷰페이지에 페이지 숫자를 10개씩 출력
		int startPage = (int)((double) currentPage / 10 + 0.9);
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
		
		if(list != null & list.size() > 0) {
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
	
	// 제목 검색 처리용
	@RequestMapping(value="nsearchTitle.do", method=RequestMethod.GET)
	public String noticeSearchTitleMethod(@RequestParam(name="page", required=false) String page, 
			Paging paging, Model model) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10;
		// 페이지 계산을 위해 총 목록 개수 조회
		int listCount = noticeService.selectSearchTitleCount(paging.getKeyword());
		// 페이지 수 계산
		int maxPage = (int)((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값 지정
		// 뷰페이지에 페이지 숫자를 10개씩 출력
		int startPage = (int)((double) currentPage / 10 + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		// 페이지 수가 10개이면
		int endPage = startPage + 10 - 1;
		
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		
		ArrayList<Notice> list = noticeService.selectSearchTitle(paging);
		
		
//		Paging paging = new Paging(startRow, endRow); // 객체로 준비함
//		
//		
//		ArrayList<Notice> list = noticeService.selectSearchTitle(keyword);
		
		if(list != null & list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("limit", limit);
			model.addAttribute("keyword", paging.getKeyword());
			
			return "notice/noticeSearchTitleListView";
		} else {
			model.addAttribute("listCount", 0);
			model.addAttribute("currentPage", 1);
			model.addAttribute("maxPage", 1);
			
			return "notice/noticeSearchTitleListView";
		}
		
		
//		else {
//			model.addAttribute("message", "해당 검색어로 검색된 게시글이 없습니다.");
//			return "common/error";
//		}
		
	} // noticeSearchTitleMethod
	
	// 내용 검색 처리용
	@RequestMapping(value = "nsearchContent.do", method = RequestMethod.GET)
	public String noticeSearchContentMethod(@RequestParam(name="page", required=false) String page, 
			Paging paging, Model model) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10;
		// 페이지 계산을 위해 총 목록 개수 조회
		int listCount = noticeService.selectSearchContentCount(paging.getKeyword());
		// 페이지 수 계산
		int maxPage = (int)((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값 지정
		// 뷰페이지에 페이지 숫자를 10개씩 출력
		int startPage = (int)((double) currentPage / 10 + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		// 페이지 수가 10개이면
		int endPage = startPage + 10 - 1;
		
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		
		ArrayList<Notice> list = noticeService.selectSearchContent(paging);
		
		
//		Paging paging = new Paging(startRow, endRow); // 객체로 준비함
//		
//		
//		ArrayList<Notice> list = noticeService.selectSearchContent(keyword);
		
		if(list != null & list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("limit", limit);
			model.addAttribute("keyword", paging.getKeyword());
			
			return "notice/noticeSearchContentListView";
		} else {
			model.addAttribute("listCount", 0);
			model.addAttribute("currentPage", 1);
			model.addAttribute("maxPage", 1);
			
			return "notice/noticeSearchContentListView";
		}
		
	} // noticeSearchContentMethod

	// 날짜 검색 처리용
	@RequestMapping(value = "nsearchDate.do", method = RequestMethod.GET)
	public String noticeSearchDateMethod(Paging paging, Model model,
			@RequestParam(name="page", required=false) String page) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10;
		// 페이지 계산을 위해 총 목록 개수 조회
		int listCount = noticeService.selectSearchDateCount(paging);
		// 페이지 수 계산
		int maxPage = (int)((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값 지정
		// 뷰페이지에 페이지 숫자를 10개씩 출력
		int startPage = (int)((double) currentPage / 10 + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		// 페이지 수가 10개이면
		int endPage = startPage + 10 - 1;
		
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		//Paging paging = new Paging(startRow, endRow);
		
		
		ArrayList<Notice> list = noticeService.selectSearchDate(paging);
		
		if(list != null & list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("limit", limit);
			model.addAttribute("begin", paging.getBegin());
			model.addAttribute("end", paging.getEnd());
			
			return "notice/noticeSearchDateListView";
		} else {
			model.addAttribute("listCount", 0);
			model.addAttribute("currentPage", 1);
			model.addAttribute("maxPage", 1);
			
			return "notice/noticeSearchDateListView";
		}
		
	} // noticeSearchDateMethod
	
	// 공지사항 글 등록 페이지 이동
	@RequestMapping("nwmove.do")
	public String moveNoticeWriteMethod() {
		return "notice/noticeWriteForm";
	}

	// 공지사항 글 등록
	@RequestMapping(value = "ninsert.do", method = RequestMethod.POST)
	public String noticeInsertMethod(Notice notice, HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");

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

					notice.setNotice_re_file(renameFileName);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패.");
					return "common/error";
				}

			} // 업로드된 파일이 있다면...

			notice.setNotice_org_file(mfile.getOriginalFilename());

			logger.info("ninsert.do : " + notice);
		} // 첨부 파일 있을 때

		if (noticeService.insertNotice(notice) > 0) {
			return "redirect:nlist.do";
		} else {
			model.addAttribute("message", "공지사항 등록 실패.");
			return "common/error";
		}
	}

	// 공지사항 수정 페이지 요청
	@RequestMapping("nupview.do")
	public String moveNoticeUpdateView(@RequestParam("notice_no") int notice_no, Model model) {

		Notice notice = noticeService.selectNotice(notice_no);

		if (notice != null) {
			model.addAttribute("notice", notice);
			return "notice/noticeUpdateForm";
		} else {
			model.addAttribute("message", notice_no + "번 공지사항 수정 페이지 이동 실패");
			return "common/error";
		}
	}

	// 공지사항 글 수정
	@RequestMapping(value = "nupdate.do", method = RequestMethod.POST)
	public String noticeUpdateMethod(Notice notice, HttpServletRequest request, Model model,
			@RequestParam(name = "delFlag", required = false) String delFlag,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {

		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");

		// 원래 첨부파일이 있는데, 삭제를 선택한 경우
		if (notice.getNotice_org_file() != null && delFlag != null && delFlag.equals("yes")) {
			// 저장 폴더에서 파일을 삭제함
			new File(savePath + "\\" + notice.getNotice_re_file()).delete();
			notice.setNotice_org_file(null);
			notice.setNotice_re_file(null);
		}

		// 새로운 첨부파일이 있을때
		if (!mfile.isEmpty()) {
			// 저장 폴더의 이전 파일을 삭제함
			if (notice.getNotice_org_file() != null) {
				// 저장 폴더에서 파일을 삭제함
				new File(savePath + "\\" + notice.getNotice_re_file()).delete();
				notice.setNotice_org_file(null);
				notice.setNotice_re_file(null);

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

					notice.setNotice_re_file(renameFileName);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패.");
					return "common/error";
				}

			} // 업로드된 파일이 있다면...

			notice.setNotice_org_file(mfile.getOriginalFilename());

			logger.info("nupdate.do : " + notice);
		}

		if (noticeService.updateNotice(notice) > 0) {
			return "redirect:nlist.do";
		} else {
			model.addAttribute("message", notice.getNotice_no() + "번 공지사항 수정 실패.");
			return "common/error";
		}
	}

	// 공지사항 삭제
	@RequestMapping("ndelete.do")
	public String noticeDeleteMethod(@RequestParam("notice_no") int notice_no,
			@RequestParam(name = "rfile", required = false) String renameFileName, HttpServletRequest request,
			Model model) {
		if (noticeService.deleteNotice(notice_no) > 0) {
			// 첨부파일이 있는 글일 때, 저장폴더에 있는 파일도 삭제함
			if (renameFileName != null) {
				new File(request.getSession().getServletContext().getRealPath("resources/notice_upfiles") + "\\"
						+ renameFileName).delete();
			}
			return "redirect:nlist.do";
		} else {
			model.addAttribute("message", notice_no + "번 공지사항 삭제 실패");
			return "common/error";
		}
	}
	
	
	
	
	
}
