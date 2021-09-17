package com.test.whimory.news.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.test.whimory.news.model.service.NewsService;
import com.test.whimory.news.model.vo.News;
import com.test.whimory.qna.model.vo.QnaQuestion;
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

			// 관리자 리스트 페이지
			User loginUser = (User) session.getAttribute("loginUser");
			if (loginUser != null && loginUser.getAdmin_yn().equals("Y")) {
				return "news/newsAdminListView";
			} else {
				// 관리자가 아닌 고객이 상세보기 요청했을 때
				return "news/newsListView";
			}
		} else {
			model.addAttribute("message", "언론보도 목록보기 실패");
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

	// 언론보도 글 등록 페이지 이동
	@RequestMapping("wwform.do")
	public String moveNewsWriteForm() {
		return "news/newsWriteForm";
	}

	// 언론보도 글 등록 요청
	@RequestMapping(value = "winsert.do", method = RequestMethod.POST)
	public String newsInsertMethod(News news, HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/news_upfiles");

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

					news.setNews_re_file(renameFileName);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패.");
					return "common/error";
				}

			} // 업로드된 파일이 있다면...

			news.setNews_org_file(mfile.getOriginalFilename());

			logger.info("winsert.do : " + news);
		} // 첨부 파일 있을 때

		if (newsService.insertNews(news) > 0) {
			return "redirect:wlist.do";
		} else {
			model.addAttribute("message", "언론보도 등록 실패.");
			return "common/error";
		}
	}

	// 언론보도 수정 페이지 요청
	@RequestMapping("wupview.do")
	public String moveNewsUpdateForm(@RequestParam("news_no") int news_no, Model model) {

		News news = newsService.selectOne(news_no);

		if (news != null) {
			model.addAttribute("news", news);
			return "news/newsUpdateForm";
		} else {
			model.addAttribute("message", news_no + "번 언론보도 수정 페이지 이동 실패");
			return "common/error";
		}
	}

	// 언론보도 글 수정
	@RequestMapping(value = "wupdate.do", method = RequestMethod.POST)
	public String newsUpdateMethod(News news, HttpServletRequest request, Model model,
			@RequestParam(name = "delFlag", required = false) String delFlag,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {

		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/news_upfiles");

		// 원래 첨부파일이 있는데, 삭제를 선택한 경우
		if (news.getNews_org_file() != null && delFlag != null && delFlag.equals("yes")) {
			// 저장 폴더에서 파일을 삭제함
			new File(savePath + "\\" + news.getNews_re_file()).delete();
			news.setNews_org_file(null);
			news.setNews_re_file(null);
		}

		// 새로운 첨부파일이 있을때
		if (!mfile.isEmpty()) {
			// 저장 폴더의 이전 파일을 삭제함
			if (news.getNews_org_file() != null) {
				// 저장 폴더에서 파일을 삭제함
				new File(savePath + "\\" + news.getNews_re_file()).delete();
				news.setNews_org_file(null);
				news.setNews_re_file(null);
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

					news.setNews_re_file(renameFileName);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패.");
					return "common/error";
				}

			} // 업로드된 파일이 있다면...

			news.setNews_org_file(mfile.getOriginalFilename());

			logger.info("wupdate.do : " + news);
		}

		if (newsService.updateNews(news) > 0) {
			return "redirect:wlist.do";
		} else {
			model.addAttribute("message", news.getNews_no() + "번 언론보도 수정 실패.");
			return "common/error";
		}
	}

	// 언론보도 삭제
	@RequestMapping("wdelete.do")
	public String newsDeleteMethod(@RequestParam("news_no") int news_no,
			@RequestParam(name = "rfile", required = false) String renameFileName, HttpServletRequest request,
			Model model) {
		if (newsService.deleteNews(news_no) > 0) {
			// 첨부파일이 있는 글일 때, 저장폴더에 있는 파일도 삭제함
			if (renameFileName != null) {
				new File(request.getSession().getServletContext().getRealPath("resources/news_upfiles") + "\\"
						+ renameFileName).delete();
			}
			return "redirect:wlist.do";
		} else {
			model.addAttribute("message", news_no + "번 언론보도 삭제 실패");
			return "common/error";
		}
	}
}
