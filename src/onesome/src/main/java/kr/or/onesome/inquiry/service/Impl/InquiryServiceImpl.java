package kr.or.onesome.inquiry.service.Impl;

import kr.or.onesome.atchFile.service.AtchFileService;
import kr.or.onesome.inquiry.mapper.InquiryMapper;
import kr.or.onesome.inquiry.service.InquiryService;
import kr.or.onesome.inquiry.vo.InquiryVO;
import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class InquiryServiceImpl implements InquiryService {

    @Autowired
    InquiryMapper inquiryMapper;

    @Autowired
    AtchFileService fileService;

    @Override
    public List<FranchiseVO> getFranchiseList() {
        return inquiryMapper.getFranchiseList();
    }

    @Override
    public int insertInquiry(InquiryVO inquiryVO) {

        //첨부파일 처리
        List<AtchFileVO> atchFileVOList = fileService.uploadFile(inquiryVO.getUploadFile(), "inquiry");
        inquiryVO.setAtchFileNo(atchFileVOList.get(0).getAtchFileNo());

        return inquiryMapper.insertInquiry(inquiryVO);
    }

    @Override
    public List<InquiryVO> memberInqList(MemberVO memberVO) {
        return inquiryMapper.memberInqList(memberVO);
    }

    @Override
    public InquiryVO inqDetail(int inqNo) {
        return inquiryMapper.inqDetail(inqNo);
    }

    @Override
    public List<InquiryVO> adminInqList() {
        return inquiryMapper.adminInqList();
    }

    @Override
    public int answerRegistration(InquiryVO inquiryVO) {
        return inquiryMapper.answerRegistration(inquiryVO);
    }

}
