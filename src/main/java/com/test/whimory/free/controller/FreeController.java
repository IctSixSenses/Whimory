package com.test.whimory.free.controller;

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
import com.test.whimory.free.model.service.FreeService;
import com.test.whimory.free.model.vo.Free;

@Controller
public class FreeController {
	private static final Logger logger = LoggerFactory.getLogger(FreeController.class);

	@Autowired
	FreeService freeService;

	// 게시글 전체 목록 출력 + 페이징 처리
	@RequestMapping("flist.do")
	public ModelAndView freeListMethod(ModelAndView mv, @RequestParam(name = "page", required = false) String page) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 페이지 계산을 위해 총 목록갯수 조회
		int listCount = freeService.selectListCount();
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

		// ↓ 얘가 결과를 받아
		ArrayList<Free> list = freeService.selectList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

			mv.setViewName("free/freeListView");
		} else {
			mv.addObject("message", currentPage + "페이지 조회를 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 게시글 상세보기
	@RequestMapping("fdetail.do")
	public ModelAndView freeDetailMethod(ModelAndView mv, @RequestParam("free_no") int free_no,
			@RequestParam("page") int page) {

		// 조회수 1 증가 처리
		freeService.addReadCount(free_no);

		// 해당 게시글 조회
		Free free = freeService.selectOne(free_no);

		if (free != null) {
			mv.addObject("free", free);
			mv.addObject("currentPage", page);
			mv.setViewName("free/freeDetailView");
		} else {
			mv.addObject("message", free_no + "번 게시글 조회를 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 첨부파일 다운로드 요청 처리용
	@RequestMapping("ffdown.do")
	public ModelAndView fileDownMethod(HttpServletRequest request, @RequestParam("ofile") String originFileName,
			@RequestParam("rfile") String renameFileName, ModelAndView mv) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/free_upfiles");

		// 저장 폴더에서 파일 읽기 위해 경로 포함
		File renameFile = new File(savePath + "\\" + renameFileName);
		// response 에 다운 파일명 등록을 위한 파일 (경로 제외)
		File originalFile = new File(originFileName);

		mv.setViewName("filedown");
		mv.addObject("renameFile", renameFile);
		mv.addObject("originalFile", originalFile);

		return mv;
	}

	// 게시글 등록 페이지로 이동
	@RequestMapping("fwform.do")
	public String moveFreeWriteForm() {

		return "free/freeWriteForm";
	}

	// 파일업로드 기능이 있는 게시글 등록 요청
	@RequestMapping(value = "finsert.do", method = RequestMethod.POST)
	public String freeInsertMethod(Free free, HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		
		// 업로드된 파일 저장 폴더 지정하기 → freeWriteForm.jsp에서 첨부파일 upfile로 전송되는 파일 받는애(mfile)
		String savePath = request.getSession().getServletContext().getRealPath("resources/free_upfiles");

		// 첨부파일이 있을때만 업로드된 파일을 지정 폴더로 이동
		if (!mfile.isEmpty()) {
			String fileName = mfile.getOriginalFilename();
			if (fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));

					// 바꿀 파일명에 대한 문자열 생성 → 등록요청 시점의 날짜정보 이용
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

					// 변경할 파일명 생성
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					// 원본 파일의 확장자를 추출 → 변경 파일명에 붙여줌
					renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);

					// 파일명 바꾸기 실행 : java.io.File 이용
					File originFile = new File(savePath + "\\" + fileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					if (!originFile.renameTo(renameFile)) {
						// renameTo() 메소드가 실패한 경우(false)에는 직접 수동으로 변경
						//  => 원본 파일 읽어서 파일 복사 후, 원본 파일 삭제 처리
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);

						int data = -1;
						byte[] buffer = new byte[1024];

						while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}

						fin.close();
						fout.close();
						originFile.delete(); // 원본 파일 삭제
					} // 수동으로 변경

					free.setFree_re_file(renameFileName);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장에 실패하였습니다.");
					return "common/error";
				}

			} // 첨부 파일 존재할 경우

			free.setFree_org_file(mfile.getOriginalFilename());
			logger.info("finsert.do : " + free);
		} // 첨부 파일 존재하지 않을 경우

		if (freeService.insertOrigin(free) > 0) {
			return "redirect:flist.do?";
		} else {
			model.addAttribute("message", "게시글 등록에 실패하였습니다.");
			return "common/error";
		}
	}

	
	
	
	
	
}
