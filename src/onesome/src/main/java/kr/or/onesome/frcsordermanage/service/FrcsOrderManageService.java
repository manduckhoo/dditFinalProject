package kr.or.onesome.frcsordermanage.service;


import kr.or.onesome.frcsorder.vo.FrcsOrderDetailVO;
import kr.or.onesome.frcsorder.vo.FrcsOrderVO;

import java.util.List;

public interface FrcsOrderManageService {

    List<FrcsOrderVO> frcsOrderList();

    int frcsOrderManageCancel(FrcsOrderVO frcsOrderVO);

    int frcsOrderManageSubmit(FrcsOrderVO frcsOrderVO);
}
