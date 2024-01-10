package kr.or.onesome.frcsordermanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.onesome.frcsorder.vo.FrcsOrderVO;
import kr.or.onesome.frcsordermanage.mapper.FrcsOrderManageMapper;
import kr.or.onesome.frcsordermanage.service.FrcsOrderManageService;

@Service
public class FrcsOrderManageSeriviceImpl implements FrcsOrderManageService {

    @Autowired
    FrcsOrderManageMapper frcsOrderManageMapper;

    @Override
    public List<FrcsOrderVO> frcsOrderList() {
        return frcsOrderManageMapper.frcsOrderList();
    }

    @Override
    public int frcsOrderManageCancel(FrcsOrderVO frcsOrderVO) {
        return frcsOrderManageMapper.frcsOrderManageCancel(frcsOrderVO);
    }

    @Override
    public int frcsOrderManageSubmit(FrcsOrderVO frcsOrderVO) {

        int cnt = 0;

        //주문번호 갖고 상태코드 조회하기 - 화면에서 가져오지 않는 이유는 화면에서 값을 위조하는 경우를 방지하기 위해
        String frcsOrderTypeCd = frcsOrderManageMapper.confirmTypeCd(frcsOrderVO);
        System.out.println("상태코드 보이나?? ==> " + frcsOrderTypeCd);

        if ("FODST01".equals(frcsOrderTypeCd)){
            cnt += frcsOrderManageMapper.frcsOrderManageSubmit(frcsOrderVO);
            cnt += frcsOrderManageMapper.frcsOrderManageFrcsPrdctPlus(frcsOrderVO);
            cnt += frcsOrderManageMapper.frcsOrderManageAdminPrdctMinus(frcsOrderVO);
        } else {
            cnt = 4004;
        }

        return cnt;
    }

}
