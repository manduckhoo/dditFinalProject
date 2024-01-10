package kr.or.onesome.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberWishVO extends MemberMenuVO{
	public int memNo;               //회원고유번호
    public int menuNo;           	//메뉴번호
    
    //첨부파일 경로
  	private MultipartFile[] uploadFile;
  	
//  	//위시리스트VO : 메뉴VO => 1:1
//  	private MemberMenuVO memberMenuVO;
}

