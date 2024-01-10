package kr.or.onesome.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FileUtil {

	// 연/월/일 폴더 생성
	public static String getFolder() {
		// 2022-11-16 형식(format) 지정
		// 간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 날짜 객체 생성(java.util 패키지)
		Date date = new Date();
		// 2022-11-16
		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	// 이미지인지 판단. 썸네일은 이미지만 가능하므로..
	public static boolean checkImageType(File file) {
		// MIME 타입 알아냄. .jpeg / .jpg의 MIME타입 : image/jpeg
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);
			// image/jpeg는 image로 시작함->true
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 이 파일이 이미지가 아닐 경우
		return false;
	}

}
