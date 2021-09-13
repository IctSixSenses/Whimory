package com.test.whimory.ko.controller;

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

import com.test.whimory.ko.model.service.KOService;
import com.test.whimory.ko.model.vo.KO;

@Controller
public class KOController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	KOService koService;
	
	@RequestMapping("klist.do")
	public String koListMethod(Model model) {
		ArrayList<KO> list = koService.selectList();
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "ko/koListView";
		} else {
			model.addAttribute("message", "ko 전체 목록을 조회하는 것을 실패했습니다");
			return "common/error";
		}
		
	} // koListMethod
	
	@RequestMapping("kcate.do")
	public String koSearchCategory(@RequestParam("cate") String category, Model model) {
		ArrayList<KO> list = koService.selectSearchCategory(category);
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			
			model.addAttribute("category", category);
			return "ko/koListView";
		} else {
			model.addAttribute("message", category + "별 목록을 조회하는 데 실패했습니다.");
			return "common/error";
		}
		
	} // koSearchCategory
	
	@RequestMapping("ksearchword.do")
	public String koSearchKeyword(KO ko, Model model) {
		ArrayList<KO> list = koService.selectSearchKeyword(ko);
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "ko/koListView";
		} else {
			model.addAttribute("message", ko.getKo_title() + "(으)로 검색된 게시글이 없습니다.");
			return "common/error";
		}
		
	} // koSearchKeyword
	
	@RequestMapping("kdetail.do")
	public String koDetailMethod(@RequestParam("ko_no") int koNo, Model model) {
		
		koService.updateAddReadCount(koNo);
		
		KO ko = koService.selectKO(koNo);
		
		if(ko != null) {
			model.addAttribute("ko", ko);
			return "ko/koDetailView";
		} else {
			model.addAttribute("message", koNo + "번 게시글을 조회하지 못했습니다.");
			return "common/error";
		}
		
	} // koDetailMethod
	
	@RequestMapping("kwmove.do")
	public String moveKOWriteFormMethod() {
		return "ko/koWriteForm";
	}
	
	@RequestMapping(value="kinsert.do", method=RequestMethod.POST)
	public String koInsertMethod(KO ko, Model model, HttpServletRequest request,
			@RequestParam(name="kfile", required=false) MultipartFile mfile) {

		// 저장 폴더 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/ko_upfiles");

		// 첨부파일 있을 떄만 업로드된 파일을 지정 폴더로 옮기기
		if (!mfile.isEmpty()) {
			String fileName = mfile.getOriginalFilename();

			// 이름 바꾸기
			if (fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));

					// 바꿀 파일명에 대한 문자열 만들기
					// 게시글 등록 요청 시점의 날짜 정보를 이용
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

					// 변경할 파일명 만들기
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));

					// 원본 파일의 확장자를 추출해서 변경파일명에 붙여줌
					renameFileName += fileName.substring(fileName.lastIndexOf("."));

					// 파일명 바꾸기 실행: java.io.File 이용
					File originFile = new File(savePath + "\\" + fileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					if (!originFile.renameTo(renameFile)) {
						// renameTo() 메소드가 실패한 경우 -> 직접 수동으로 바꾸기 해야 함

						// 원본 파일을 읽어서 파일 복사하고 원본 파일 삭제 처리
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

					} // if: 직접 이름 바꾸기

					ko.setKo_re_file(renameFileName);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패");
					return "common/error";
				} // try ~ catch
			} // if: 업로드된 파일 있을 때 이름 바꾸기

			ko.setKo_org_file(mfile.getOriginalFilename());

		} // if: 첨부파일 있을 때
		
		if(koService.insertKO(ko) > 0) {
			return "redirect:klist.do";
		} else {
			model.addAttribute("message", "게시글 등록을 실패했습니다.");
			return "common/error.jsp";
		}
				
	} // koInsertMethod
	
	@RequestMapping("kupview.do")
	public String moveUpdateForm(@RequestParam("ko_no") int ko_no, Model model) {
		
		KO ko = koService.selectKO(ko_no);
		
		if(ko != null) {
			model.addAttribute("ko", ko);
			return "ko/koUpdateForm";
		} else {
			model.addAttribute("message", ko_no + "번 수정 페이지를 불러오지 못했습니다.");
			return "common/error";
		}
		
	} // moveUpdateForm
	
	@RequestMapping(value="kupdate.do", method=RequestMethod.POST)
	public String koUpdateMethod(KO ko, Model model, HttpServletRequest request,
			@RequestParam(name="kfile", required=false) MultipartFile mfile,
			@RequestParam(name="delFlag", required=false) String delFlag) {

		// 저장 폴더 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/ko_upfiles");

		// 첨부파일 삭제할 때
		if (ko.getKo_org_file() != null && delFlag != null && delFlag.equals("yes")) {
			new File(savePath + "\\" + ko.getKo_re_file()).delete();
			ko.setKo_org_file(null);
			ko.setKo_re_file(null);
		}

		// 새로운 첨부파일이 있을 때
		if (!mfile.isEmpty()) {
			// 기존 첨부파일이 있는데 새로운 첨부파일이 추가된 경우, 저장 폴더에 있는 이전 파일 삭제
			if (ko.getKo_org_file() != null) {
				new File(savePath + "\\" + ko.getKo_re_file()).delete();
				ko.setKo_org_file(null);
				ko.setKo_re_file(null);
			}

			String fileName = mfile.getOriginalFilename();

			// 이름 바꾸기
			if (fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));

					// 저장된 첨부파일 이름 바꾸기
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

					// 변경할 파일명 만들기
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));

					// 원본 파일의 확장자를 추출해서 변경파일명에 붙여줌
					renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);

					// 파일명 바꾸기 실행: java.io.File 이용
					File originFile = new File(savePath + "\\" + fileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					if (!originFile.renameTo(renameFile)) {
						// renameTo() 메소드가 실패한 경우 -> 직접 수동으로 바꾸기 해야 함

						// 원본 파일을 읽어서 파일 복사하고 원본 파일 삭제 처리
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

					} // if: 직접 이름 바꾸기

					ko.setKo_re_file(renameFileName);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패");
					return "common/error";
				} // try ~ catch
			} // if: 업로드된 파일 있을 때 이름 바꾸기

			ko.setKo_org_file(mfile.getOriginalFilename());

		} // if: 첨부파일 있을 때
		
		if(koService.updateKO(ko) > 0) {
			model.addAttribute("ko", ko);
			return "redirect:kdetail.do?ko_no=" + ko.getKo_no();
		} else {
			model.addAttribute("message", ko.getKo_no() + "번 게시글을 수정하지 못했습니다.");
			return "common/error";
		}
		
	} // koUpdateMethod
	
	@RequestMapping("kdelete.do")
	public String koDeleteMethod(@RequestParam("kNo") int kNo, Model model,
			@RequestParam(name="rfile", required=false) String renameFileName,
			HttpServletRequest request) {
		
		if(koService.deleteKO(kNo) > 0) {
			
			if(renameFileName != null) {
				new File(request.getSession().getServletContext().getRealPath("resources/ko_upfiles") 
			   			+ "\\" + renameFileName).delete();
			}
			
			model.addAttribute("result", "delete success");
			return "redirect:klist.do";
			
		} else {
			model.addAttribute("message", kNo + "번 게시글을 삭제하지 못했습니다.");
			return "common/error";
		}
		
	} // koDeleteMethod
	
	
	
}




