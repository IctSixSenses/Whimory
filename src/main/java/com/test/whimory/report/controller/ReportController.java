package com.test.whimory.report.controller;

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
import com.test.whimory.report.model.service.ReportService;
import com.test.whimory.report.model.vo.Report;

@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

	@Autowired
	ReportService reportService;

	@RequestMapping("rplist.do")
	public ModelAndView reportListMethod(ModelAndView mv, @RequestParam(name = "page", required = false) String page) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 페이지 계산을 위해 총 목록갯수 조회
		int listCount = reportService.selectListCount();
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

		ArrayList<Report> list = reportService.selectList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

			mv.setViewName("report/reportListView");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	@RequestMapping("rpdetail.do")
	public ModelAndView reportDetailMethod(ModelAndView mv, @RequestParam("report_no") int report_no,
			@RequestParam("page") int page) {
		// 조회수 1 증가 처리
		reportService.updateAddReadCount(report_no);

		// 해당 게시글 조회
		Report report = reportService.selectOne(report_no);

		if (report != null) {
			mv.addObject("report", report);
			mv.addObject("currentPage", page);
			mv.setViewName("report/reportDetailView");
		} else {
			mv.addObject("messeage", report_no + "번 게시글 조회 실패.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	@RequestMapping("rplike.do")
	public String reportAddLikeMethod(Model model, @RequestParam("report_no") int report_no,
			@RequestParam("page") int page) {
		// 공감수 1 증가 처리
		int result = reportService.updateAddLikeCount(report_no);

		if (result > 0) {
			return "redirect:rpdetail.do?report_no=" + report_no + "&page=" + page;
		} else {
			model.addAttribute("message", "공감수 증가 처리 실패");
			return "common/error";
		}
	}

	@RequestMapping("rpwf.do")
	public String moveReportWriteForm() {
		return "report/reportWriteForm";
	}

	@RequestMapping(value = "rpinsert.do", method = RequestMethod.POST)
	public String reportInsertMethod(Report report, HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/report_upfiles");

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

					report.setReport_re_file(renameFileName);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패.");
					return "common/error";
				}

			} // 업로드된 파일이 있다면...

			report.setReport_org_file(mfile.getOriginalFilename());
			logger.info("rpinsert.do : " + report);
		} // 첨부 파일 있을 때

		if (reportService.insertReport(report) > 0) {
			return "redirect:rplist.do?page=1";
		} else {
			model.addAttribute("message", "게시글 등록 실패.");
			return "common/error";
		}
	}

	// 글 수정페이지 이동 처리용
	@RequestMapping("rpuf.do")
	public String moveBoardUpdateView(@RequestParam("report_no") int report_no, @RequestParam("page") int currentPage,
			Model model) {
		Report report = reportService.selectOne(report_no);

		if (report != null) {
			model.addAttribute("report", report);
			model.addAttribute("page", currentPage);
			return "report/reportUpdateView";
		} else {
			model.addAttribute("message", report_no + "번글 수정페이지 이동 실패.");
			return "common/error";
		}
	}

	// 게시글 수정 요청 처리용
	@RequestMapping(value = "rpupdate.do", method = RequestMethod.POST)
	public String boardUpdateMethod(Report report, HttpServletRequest request, Model model,
			@RequestParam("page") int page, @RequestParam(name = "delFlag", required = false) String delFlag,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {

		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/report_upfiles");

		// 원래 첨부파일이 있는데, 삭제를 선택한 경우
		if (report.getReport_org_file() != null && delFlag != null && delFlag.equals("yes")) {
			// 저장 폴더에서 파일을 삭제함
			new File(savePath + "\\" + report.getReport_re_file()).delete();
			report.setReport_org_file(null);
			report.setReport_re_file(null);
		}

		// 새로운 첨부파일이 있을 때
		if (!mfile.isEmpty()) {

			// 저장 폴더의 이전 파일을 삭제함
			if (report.getReport_org_file() != null) {
				// 저장 폴더에서 파일을 삭제함
				new File(savePath + "\\" + report.getReport_re_file()).delete();
				report.setReport_org_file(null);
				report.setReport_re_file(null);
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
						// 파일 이름바꾸기 실패 시 직접 바꿈
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

					report.setReport_re_file(renameFileName);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패.");
					return "common/error";
				}

			} // 업로드된 파일이 있다면...

			report.setReport_org_file(mfile.getOriginalFilename());
			logger.info("rpupdate.do : " + report);
		}

		if (reportService.updateReport(report) > 0) {
			model.addAttribute("report_no", report.getReport_no());
			model.addAttribute("page", page);
			return "redirect:rpdetail.do";
		} else {
			model.addAttribute("message", report.getReport_no() + "번 게시글 수정 실패.");
			return "common/error";
		}

	}

	// 제보글 삭제 요청 처리용
	@RequestMapping("rpdelete.do")
	public String reportDeleteMethod(@RequestParam("report_no") int report_no,
			@RequestParam(name = "rfile", required = false) String renameFileName, HttpServletRequest request,
			Model model) {
		if (reportService.deleteReport(report_no) > 0) {
			// 첨부파일이 있는 글일 때, 저장폴더에 있는 파일도 삭제함
			if (renameFileName != null) {
				new File(request.getSession().getServletContext().getRealPath("resources/report_upfiles") + "\\"
						+ renameFileName).delete();
			}
			return "redirect:rplist.do?page=1";
		} else {
			model.addAttribute("message", report_no + "번 제보글 삭제 실패.");
			return "common/error";
		}
	}
}
