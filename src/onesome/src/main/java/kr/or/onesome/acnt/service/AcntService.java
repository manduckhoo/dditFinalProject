package kr.or.onesome.acnt.service;

import kr.or.onesome.vo.AcntVO;

import java.util.List;
import java.util.Map;

public interface AcntService {
    List<AcntVO> acntList();

    AcntVO selectAjax(Map<String, String> acntMap);

    int createAcnt(AcntVO acntVO);

    int deleteAcnt(AcntVO acntVO);

    int modifyAcnt(AcntVO acntVO);

    List<AcntVO> searchAjax(Map<String, String> acntMap);
}
