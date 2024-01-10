package kr.or.onesome.menu.service;

import kr.or.onesome.menu.vo.MenuVO;
import kr.or.onesome.product.vo.ProductVO;
import kr.or.onesome.vo.CtgryDetailVO;
import kr.or.onesome.vo.CtgryVO;
import kr.or.onesome.vo.RecipeVO;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface MenuService {

    /**
     * 메뉴를 수정하기 위한 메서드
     * @param menuVO 수정할 메뉴의 정보가 담긴 VO
     * @return 수정 성공시 1을, 실패시 0을 반환
     */
    int modifyMenu(MenuVO menuVO);

    /**
     * 메뉴를 삭제하기 위한 메서드
     * @param menuVO 삭제할 메뉴번호가 담긴 VO
     * @return 삭제된 메뉴의 레시피 수 + 1을 반환
     */
    int deleteMenu(MenuVO menuVO);

    /**
     * 메뉴 상세정보를 조회하기 위한 메서드
     * @param menuNo 조회할 메뉴 번호
     * @return 조회된 메뉴정보를 담은 VO
     */
    MenuVO adminMenuDetail(int menuNo);

    /**
     * <p>메뉴를 등록하기 위한 메서드</p>
     * <p>레시피를 동시에 등록하므로 레시피 등록 매퍼도 함께 호출</p>
     * @param menuVO 입력한 메뉴 정보가 담긴 VO
     * @return 등록 성공시 1을, 실패시 0을 반환
     */
    int menuRegistration(MenuVO menuVO);

    /**
     * 레시피에 등록될 제품 목록을 조회하는 매퍼
     * @return 제품목록
     */
    List<ProductVO> getProductList();

    /**
     * 상세 메뉴 카테고리 목록을 조회하기 위한 메서드
     * @return 상세 메뉴 카테고리
     */
    List<CtgryDetailVO> getCtgryDetailList();

    /**
     * 메뉴 카테고리 목록을 조회하기 위한 메서드
     * @return 메뉴 카테고리 목록
     */
    List<CtgryVO> getCtgryList();

    /**
     * 등록된 메뉴의 목록을 조회하기 위한 메서드
     * @param map 메뉴목록의 현재 페이지 번호, 검색 키워드가 담긴 맵
     * @return 조회된 메뉴 리스트
     */
    List<MenuVO> adminMenuList(Map<String, Object> map);

    /**
     * 페이징 처리를 위해 검색된 매뉴의 갯수를 확인
     * @param map 검색 키워드가 담긴 맵
     * @return 검색된 메뉴의 갯수를 반환
     */
    int getTotal(Map<String, Object> map);
    
    
}
