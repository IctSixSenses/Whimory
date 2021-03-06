package com.test.whimory.ko.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.texttospeech.v1.AudioConfig;
import com.google.cloud.texttospeech.v1.AudioEncoding;
import com.google.cloud.texttospeech.v1.SsmlVoiceGender;
import com.google.cloud.texttospeech.v1.SynthesisInput;
import com.google.cloud.texttospeech.v1.SynthesizeSpeechResponse;
import com.google.cloud.texttospeech.v1.TextToSpeechClient;
import com.google.cloud.texttospeech.v1.VoiceSelectionParams;
import com.google.protobuf.ByteString;
import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.ko.model.service.KOService;
import com.test.whimory.ko.model.vo.KO;
import com.test.whimory.news.model.service.NewsService;
import com.test.whimory.news.model.vo.News;
import com.test.whimory.notice.model.service.NoticeService;
import com.test.whimory.notice.model.vo.Notice;
import com.test.whimory.report.model.service.ReportService;
import com.test.whimory.report.model.vo.Report;

@Controller
public class KOController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	KOService koService;
	
	@RequestMapping("klist.do")
	public String koListMethod(Model model) {
		ArrayList<KO> list = koService.selectList();
		int listCount = koService.selectListCount();
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			
			return "ko/koListView";
		} else {
			model.addAttribute("message", "ko ?????? ????????? ???????????? ???????????????");
			return "common/error";
		}
		
	} // koListMethod
	
	@RequestMapping(value="ktop10.do", method=RequestMethod.POST)
	@ResponseBody
	public String koTop10Method(Model model) throws UnsupportedEncodingException {
		ArrayList<KO> list = koService.selectTop10();
		
		
		JSONObject sendJson = new JSONObject(); 
		JSONArray jarr = new JSONArray();
		 
		for (KO ko : list) { 
		
			JSONObject job = new JSONObject();
			
			job.put("ko_no", ko.getKo_no());
			job.put("ko_title", URLEncoder.encode(ko.getKo_title(), "UTF-8"));
			job.put("ko_re_file", ko.getKo_re_file());
			job.put("ko_summary", URLEncoder.encode(ko.getKo_summary(), "UTF-8"));
			
			jarr.add(job);
		}
		 
		sendJson.put("list", jarr);
		 
		return sendJson.toJSONString();
		
	} // koTop10Method
	
	@RequestMapping("kcate.do")
	public String koSearchCategory(@RequestParam("cate") String category, Model model) {
		ArrayList<KO> list = koService.selectSearchCategory(category);

		int listCount = koService.selectListCount();
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("category", category);
			
			String pageName = null;
			
			switch(category) {
			case "history": pageName = "ko/koHistoryListView"; break;
			case "culture": pageName = "ko/koCultureListView"; break;
			case "food": pageName = "ko/koFoodListView"; break;
			case "culheri": pageName = "ko/koCulheriListView"; break;
			}
			
			return pageName;
			
		} else {
			model.addAttribute("message", category + "??? ????????? ???????????? ??? ??????????????????.");
			return "common/error";
		}
		
	} // koSearchCategory
	
	@RequestMapping("ksearchword.do")
	public String koSearchKeyword(@RequestParam("keyword") String keyword, Model model) {
		
		ArrayList<KO> list = koService.selectSearchKeyword(keyword);
		int listCount = koService.selectListCount();
		
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			
			return "ko/koListView";
			
		} else {
			model.addAttribute("size", 0);
			model.addAttribute("listCount", listCount);
			
			return "ko/koListView";
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
			model.addAttribute("message", koNo + "??? ???????????? ???????????? ???????????????.");
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

		// ?????? ?????? ??????
		String savePath = request.getSession().getServletContext().getRealPath("resources/ko_upfiles");

		// ???????????? ?????? ?????? ???????????? ????????? ?????? ????????? ?????????
		if (!mfile.isEmpty()) {
			String fileName = mfile.getOriginalFilename();
			
			// ?????? ?????????
			if (fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));

					// ?????? ???????????? ?????? ????????? ?????????
					// ????????? ?????? ?????? ????????? ?????? ????????? ??????
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

					// ????????? ????????? ?????????
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));

					// ?????? ????????? ???????????? ???????????? ?????????????????? ?????????
					renameFileName += fileName.substring(fileName.lastIndexOf("."));

					// ????????? ????????? ??????: java.io.File ??????
					File originFile = new File(savePath + "\\" + fileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					if (!originFile.renameTo(renameFile)) {
						// renameTo() ???????????? ????????? ?????? -> ?????? ???????????? ????????? ?????? ???

						// ?????? ????????? ????????? ?????? ???????????? ?????? ?????? ?????? ??????
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);

						int data = -1;
						byte[] buffer = new byte[1024];

						while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}

						fin.close();
						fout.close();
						originFile.delete(); // ?????? ?????? ??????

					} // if: ?????? ?????? ?????????

					ko.setKo_re_file(renameFileName);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "???????????? ?????? ??????");
					return "common/error";
				} // try ~ catch
			} // if: ???????????? ?????? ?????? ??? ?????? ?????????

			ko.setKo_org_file(mfile.getOriginalFilename());

		} // if: ???????????? ?????? ???
		
		
		if(koService.insertKO(ko) > 0) {
			return "redirect:klist.do";
		} else {
			model.addAttribute("message", "????????? ????????? ??????????????????.");
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
			model.addAttribute("message", ko_no + "??? ?????? ???????????? ???????????? ???????????????.");
			return "common/error";
		}
		
	} // moveUpdateForm
	
	@RequestMapping(value="kupdate.do", method=RequestMethod.POST)
	public String koUpdateMethod(KO ko, Model model, HttpServletRequest request,
			@RequestParam(name="kfile", required=false) MultipartFile mfile) {

		// ?????? ?????? ??????
		String savePath = request.getSession().getServletContext().getRealPath("resources/ko_upfiles");

		// ????????? ??????????????? ?????? ???
		if (!mfile.isEmpty()) {
			// ?????? ??????????????? ????????? ????????? ??????????????? ????????? ??????, ?????? ????????? ?????? ?????? ?????? ??????
			if (ko.getKo_org_file() != null) {
				new File(savePath + "\\" + ko.getKo_re_file()).delete();
				ko.setKo_org_file(null);
				ko.setKo_re_file(null);
			}

			String fileName = mfile.getOriginalFilename();

			// ?????? ?????????
			if (fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));

					// ????????? ???????????? ?????? ?????????
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

					// ????????? ????????? ?????????
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));

					// ?????? ????????? ???????????? ???????????? ?????????????????? ?????????
					renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);

					// ????????? ????????? ??????: java.io.File ??????
					File originFile = new File(savePath + "\\" + fileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					if (!originFile.renameTo(renameFile)) {
						// renameTo() ???????????? ????????? ?????? -> ?????? ???????????? ????????? ?????? ???

						// ?????? ????????? ????????? ?????? ???????????? ?????? ?????? ?????? ??????
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);

						int data = -1;
						byte[] buffer = new byte[1024];

						while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}

						fin.close();
						fout.close();
						originFile.delete(); // ?????? ?????? ??????

					} // if: ?????? ?????? ?????????

					ko.setKo_re_file(renameFileName);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "???????????? ?????? ??????");
					return "common/error";
				} // try ~ catch
			} // if: ???????????? ?????? ?????? ??? ?????? ?????????

			ko.setKo_org_file(mfile.getOriginalFilename());

		} else {
			ko.setKo_org_file(ko.getKo_org_file());
			ko.setKo_re_file(ko.getKo_re_file());
		}
		
		
		if(koService.updateKO(ko) > 0) {
			model.addAttribute("ko", ko);
			return "redirect:kdetail.do?ko_no=" + ko.getKo_no();
		} else {
			model.addAttribute("message", ko.getKo_no() + "??? ???????????? ???????????? ???????????????.");
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
			
			return "redirect:klist.do";
			
		} else {
			model.addAttribute("message", kNo + "??? ???????????? ???????????? ???????????????.");
			return "common/error";
		}
		
	} // koDeleteMethod
	
	@RequestMapping("ktts.do")
	public String synthesizeText(@RequestParam("ko_no") int ko_no, HttpServletRequest request) throws Exception {
		
		// Instantiates a client
		String text = koService.selectContent(ko_no);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/ko_mp3");
		
		try (TextToSpeechClient textToSpeechClient = TextToSpeechClient.create()) {
			// Set the text input to be synthesized
			SynthesisInput input = SynthesisInput.newBuilder().setText(text).build();
			
			// Build the voice request
			VoiceSelectionParams voice =
					VoiceSelectionParams.newBuilder().setLanguageCode("ko_KR")
					.setSsmlGender(SsmlVoiceGender.FEMALE) // ssmlVoiceGender = SsmlVoiceGender.FEMALE
					.build();

			// Select the type of audio file you want returned
			AudioConfig audioConfig = AudioConfig.newBuilder().setAudioEncoding(AudioEncoding.MP3).build();
			
			// Perform the text-to-speech request
			SynthesizeSpeechResponse response = textToSpeechClient.synthesizeSpeech(input, voice, audioConfig);

			// Get the audio contents from the response
			ByteString audioContents = response.getAudioContent();

			// Write the response to the output file.
			try (OutputStream out 
					= new FileOutputStream("C:\\final_workspace\\Whimory\\src\\main\\webapp\\resources\\ko_mp3\\" + ko_no + ".mp3")) {
				out.write(audioContents.toByteArray());
	    }
	  }
		
		return "redirect:kdetail.do?ko_no=" + ko_no;
		
	} // synthesizeText
	
	
}




