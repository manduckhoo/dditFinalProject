package kr.or.onesome.menu.vo;

import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.CtgryDetailVO;
import kr.or.onesome.vo.RecipeVO;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

@Data
public class MenuVO  {

    private int menuNo;                  //메뉴번호 (p.k)
    private String menuNm;               //메뉴명
    private int menuPrice;               //메뉴 판매가
    private String ctgryDetailId;        //카테고리 상세 ID
    private String menuDescription;      //메뉴설명
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date menuStrtDt;             //메뉴 출시일
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date menuEndDt;              //메뉴 단종일자
    private double calories;             //메뉴 영양정보 칼로리
    private double sugar;                //메뉴 영양정보 당류
    private double sodium;               //메뉴 영양정보 나트륨
    private double protein;              //메뉴 영양정보 단백질
    private double saturatedFat;         //메뉴 영양정보 포화지방
    private double caffeine;             //메뉴 영양정보 카페인
    private int atchFileNo;           //파일 번호
    private int rnum;                    //페이징 처리를 위한 행번호


    MultipartFile[] uploadFile;            //view로부터 전달받은 파일 객체

    CtgryDetailVO ctgryDetailVO;         //메뉴의 카테고리정보 VO

    List<RecipeVO> recipeVOList;         //각 메뉴의 레시피정보 VO 리스트

    AtchFileVO atchFileVO; //파일정보 VO

}
