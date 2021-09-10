package com.test.whimory.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component("filedown") // 첨부파일 다운 뷰 클래스
public class FileDownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
											HttpServletResponse response) throws Exception {
		
		//컨트롤러에서 view resolver로 리턴한 model 정보 추출
		File renameFile = (File) model.get("renameFile"); 	// 읽기용
		File downFile = (File) model.get("originalFile"); 	// 다운용

		//한글 파일명 인코딩 처리를 위해 파일명 추출
		String fileName = downFile.getName();

		response.setContentType("text/plain; charset=UTF-8");
		response.addHeader("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int) renameFile.length());

		OutputStream out = response.getOutputStream();
		FileInputStream fin = null;

		try {
			fin = new FileInputStream(renameFile);   //읽어야하니까 FileInpustStream에는 renameFile로!
			FileCopyUtils.copy(fin, out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fin != null) {
				try {
					fin.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		out.flush();
		out.close();
	}
}
