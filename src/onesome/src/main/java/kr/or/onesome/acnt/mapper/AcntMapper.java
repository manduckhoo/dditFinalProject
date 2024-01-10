package kr.or.onesome.acnt.mapper;

import kr.or.onesome.vo.AcntVO;

import java.util.List;
import java.util.Map;

public interface AcntMapper {

    //거래처 조회
    List<AcntVO> acntList();

    //거래처 상세 조회
    AcntVO selectAjax(Map<String, String> acntMap);

    //새로운 거래처 등록
    int createAcnt(AcntVO acntVO);

    //거래처 삭제
    int deleteAcnt(AcntVO acntVO);

    //거래처 정보 수정
    int modifyAcnt(AcntVO acntVO);

    List<AcntVO> searchAjax(Map<String, String> acntMap);
}
