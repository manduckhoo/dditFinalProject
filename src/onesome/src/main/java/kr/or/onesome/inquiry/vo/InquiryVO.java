package kr.or.onesome.inquiry.vo;

import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.ComDetCodeInfoVO;
import kr.or.onesome.vo.FranchiseVO;
import kr.or.onesome.vo.MemberVO;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

@Data
public class InquiryVO {

    private int inqNo;          //1:1 문의 번호
    private String inqTypeCd;   //1:1 문의 타입 공통코드
    private int memNo;          //회원 번호
    private String inqTitle;    //문의 제목
    private String inqConts;    //문의 내용
    private int frcsNo;         //가맹점 번호
    private Date inqWrtDt;      //문의 작성 일시
    private String ansTitle;    //답변 제목
    private String ansConts;    //답변 내용
    private int ansWrtrNo;      //답변 작성자 번호
    private Date ansWrtDt;      //답변 작성 일시
    private int atchFileNo;     //파일 번호

    private MultipartFile[] uploadFile; //전달받은 파일 객체

    //가맹점 정보를 1:1관계로 받기위한 필드
    private FranchiseVO franchiseVO;

    //문의 유형 조회를 위한 필드
    private ComDetCodeInfoVO comDetCodeInfoVO;

    //문의 작성자 조회를 위한 필드
    private MemberVO memberVO;

    //서버에 저장된 첨부파일을 가져오기 위한 필드
    private List<AtchFileVO> atchFileVOList;
}
