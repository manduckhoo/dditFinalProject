package kr.or.onesome.inquiry.mapper;

import kr.or.onesome.inquiry.vo.InquiryVO;
import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.MemberVO;

import java.util.List;

public interface InquiryMapper {

    /**
     * 1:1문의에 가맹점 정보를 선택할 수 있도록 리스트를 가져오기 위한 매퍼
     * @return 운영상태가 '운영중'인 가맹점의 VO를 담은 리스트
     */
    List<FranchiseVO> getFranchiseList();

    /**
     * 1:1문의를 등록하기 위한 매퍼
     * @param inquiryVO 1:1문의 정보가 담긴 VO객체
     * @return 등록 성공시 1을 실패시 0을 반환
     */
    int insertInquiry(InquiryVO inquiryVO);

    /**
     * 회원 본인이 작성한 문의 내역을 조회하기 위한 매퍼
     * @param memberVO 현재 로그인된 회원 정보가 담긴 VO객체
     * @return 조회된 문의 내역 리스트
     */
    List<InquiryVO> memberInqList(MemberVO memberVO);

    /**
     * 문의글의 상세내용을 조회하기 위한 매퍼
     * @param inqNo 문의글 번호
     * @return 조회된 문의글의 정보가 담긴 VO객체
     */
    InquiryVO inqDetail(int inqNo);

    /**
     * 어드민이 모든 회원의 1:1문의 목록을 조회하기 위한 매퍼
     * @return 조회된 문의 내역 리스트
     */
    List<InquiryVO> adminInqList();

    /**
     * 회원의 문의글에 답변을 등록하기 위한 매퍼
     * @param inquiryVO 답변 제목, 내용, 작성자 번호가 담긴 VO객체
     * @return 등록 성공시 1을 실패시 0을 반환
     */
    int answerRegistration(InquiryVO inquiryVO);
}
