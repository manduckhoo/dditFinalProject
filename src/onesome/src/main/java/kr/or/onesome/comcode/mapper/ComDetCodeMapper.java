package kr.or.onesome.comcode.mapper;


import kr.or.onesome.vo.ComDetCodeInfoVO;

import java.util.List;

public interface ComDetCodeMapper {

    /**
     * 공통코드를 기준으로 공통 상세 코드들을 조회하기 위한 매퍼 메서드
     * @param comCode 공통코드
     * @return 해당 공통코드의 상세 코드의 코드와 코드명이 담긴 VO객체의 리스트
     */
    List<ComDetCodeInfoVO> comDetCodeListByComCode(String comCode);
}
