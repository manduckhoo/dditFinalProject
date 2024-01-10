package kr.or.onesome.sanitation.vo;

import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.FranchiseVO;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
public class SanitationCheckManagementVO {

    private int frcsNo;                        //가맹점번호(p.k, f.k)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sntChckDt;                    //위생점검날짜(p.k)
    private int sntChckTotalScr;               //위생총점
    private int atchFileNo;                    //파일번호

    private int rnum;                          //행번호

    MultipartFile[] uploadFile;                //업로드파일
    private FranchiseVO franchiseVO;           //가맹점정보 VO
    private AtchFileVO atchFileVO;             //파일정보 VO
}
