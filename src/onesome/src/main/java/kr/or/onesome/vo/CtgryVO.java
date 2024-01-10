package kr.or.onesome.vo;

import lombok.Data;

import java.util.List;

@Data
public class CtgryVO {

    private String ctgryId;       //카테고리 ID(p.k)
    private String ctgryName;     //카테고리명

    List<CtgryDetailVO> ctgryDetailVOList; //카테고리 상세 List
}
