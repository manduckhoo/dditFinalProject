package kr.or.onesome.ckeditor.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin/ckeditor")
@Slf4j
@Controller
public class CKEditorController {

	@Autowired
	private String uploadFolder;
	
	@ResponseBody
	@PostMapping("/imgUpload")
	public void ckUpload(HttpServletRequest req, HttpServletResponse resp, @RequestParam MultipartFile upload) {
		
		log.info("ckUpload!!!!!!!");
		log.info("upload!!!!!!!!" + upload);

		OutputStream out = null;
		PrintWriter printWriter = null;

		try {
			
			// 랜덤문자 생성
			UUID uuid = UUID.randomUUID();
			
			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			String extension = FilenameUtils.getExtension(fileName); // 파일 확장자 가져오기
			byte[] bytes = upload.getBytes(); // 바이트 가져오기

			// 업로드 경로
			String ckUploadPath = uploadFolder + File.separator + uuid + "_" + fileName + extension;
			
			// 연월일 폴더 
			File uploadPath = new File(uploadFolder, getFolder());
			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			
			// 이미지 저장
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화
			
			// ckeditor로 전송
			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = resp.getWriter();
			String fileUrl = "/ckUpload/" + uuid + "_" + fileName + "." + extension;

			// 업로드시 메시지 출력
			printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction("
					+ callback + ",'" + fileUrl + "','이미지를 업로드하였습니다.')" + "</script>");
			
			// json으로 변환
			JsonObject json = new JsonObject();
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", fileName);
			json.addProperty("url", fileUrl);
			printWriter.println(json);
			printWriter.flush(); // pritwriter 초기화
			
			log.info("json: " + json);
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	// 연/월/일 폴더 생성
	public String getFolder() {
		// 2022-11-16 형식(format) 지정
		// 간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 날짜 객체 생성(java.util 패키지)
		Date date = new Date();
		// 2022-11-16
		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}
}
