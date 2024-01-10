package kr.or.onesome.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberMenuVO extends AtchFileVO{
	public int menuNo;               //메뉴 번호 
    public String menuNm;            //메뉴명   
    public int menuPrice;            //메뉴 판매가
    public String menuSize;          //사이즈 (S / L)
    public String ctgryDetailId;     //카테고리 상세 ID
    public String menuDescription;   //설명
    @DateTimeFormat(pattern="yyyy-MM-dd")
    public Date menuStrtDt;          //판매 시작일
    @DateTimeFormat(pattern="yyyy-MM-dd")
    public Date menuEndDt;           //판매 종료일
    public String menuIceYn;         //핫/아이스(0, 1)
    public int calories;             //칼로리
    public int sugar;                //당류
    public int sodium;               //나트륨
    public int protein;              //단백질
    public int saturatedFat;         //포화지방
    public int caffeine;             //카페인
    public int atchFileNo;		     //첨부파일 번호
    public int memNo;				 //회원고유번호 => 장바구니 메뉴번호 따올때 회원고유번호 필요해서 추가함(2023-12-11 추가, KHM)
    public int cartCnt;				 //장바구니 수량 => 장바구니 수량 업데이트할때  필요해서 추가함(2023-12-12 추가, KHM)
    
    //첨부파일 경로
  	private MultipartFile[] uploadFile;
}

