package kr.or.onesome.notice.service.impl;

import java.util.List;
import java.util.Map;

import kr.or.onesome.atchFile.service.AtchFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.notice.mapper.NoticeMapper;
import kr.or.onesome.notice.service.NoticeService;
import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	@Autowired
	private AtchFileService atchFileService;

	@Override
	public List<NoticeVO> noticeList(Map<String, Object> map) {
		return noticeMapper.noticeList(map);
	}

	@Override
	public int writeNotice(NoticeVO noticeVO) {
		log.info("service -> noticeVO {}", noticeVO);

		// 파일 업로드
		List<AtchFileVO> fileVOList = atchFileService.uploadFile(noticeVO.getUploadFile(), "notice");
		log.info("List<AtchFileVO> fileVOList : {}", fileVOList.get(0).getAtchFileNo());
		
		if (fileVOList.size() != 0) {
			noticeVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());
		}

		return noticeMapper.writeNotice(noticeVO);
	}

	@Override
	public NoticeVO noticeDetail(int ntcNo) {

		return noticeMapper.noticeDetail(ntcNo);
	}

	@Override
	public int deleteNotice(NoticeVO noticeVO) {
		atchFileService.deleteFile(noticeVO.getAtchFileNo(), "notice");
		return noticeMapper.deleteNotice(noticeVO);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		
		for(MultipartFile multipartFile : noticeVO.getUploadFile()) {
			if(!multipartFile.getOriginalFilename().equals("")) {
				List<AtchFileVO> fileVOList = atchFileService.uploadFile(noticeVO.getUploadFile(), "notice");
				
				atchFileService.deleteFile(noticeVO.getAtchFileNo(), "notice");
				
				noticeVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());
			}
		}
		
		return noticeMapper.updateNotice(noticeVO);
	}

	// 공지사항 불러오기(일반회원) - 재람
	@Override
	public List<NoticeVO> memNoticeList() {
		return noticeMapper.memNoticeList();
	}

	// 공지사항 디테일(일반회원) - 재람
	@Override
	public NoticeVO memNoticeDetail(NoticeVO noticeVO) {
		return noticeMapper.memNoticeDetail(noticeVO);
	}

	// 공지사항 검색(일반회원) - 재람
	@Override
	public List<NoticeVO> list(Map<String, Object> map) {
		return this.noticeMapper.list(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.noticeMapper.getTotal(map);
	}

	// 공지사항 디테일 이전글 다음글(일반회원) - 재람
	@Override
	public NoticeVO movePage(int ntcNo) {
		return noticeMapper.movePage(ntcNo);
	}


//	@Override
//	public NoticeVO movePage(String ntcNo) {
//		return noticeMapper.movePage(ntcNo);
//	}
}
