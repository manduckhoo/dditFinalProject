package kr.or.onesome.product.service;

import java.util.List;
import java.util.Map;

import kr.or.onesome.product.vo.ProductVO;

public interface ProductService {
	
	/**
	 * 상품 리스트 조회
	 * @return
	 */
	public List<ProductVO> productList();

	/**
	 * 상품 상세
	 * @param prdctNo
	 * @return
	 */
	public ProductVO productDetail(int prdctNo);
	
	/**
	 * 상품 등록
	 * @param productVO
	 * @return
	 */
	public int addProduct(ProductVO productVO);
	
	/**
	 * 상품이름 체크
	 * @param prdctNm
	 * @return
	 */
	public int getPrdctNm(String prdctNm);
	
	/**
	 * 상품 변경
	 * @param prdctNo
	 * @return
	 */
	public int modifyProduct(ProductVO productVO);
	
	/**
	 * 전체 글 수
	 * @param map 
	 * @return
	 */
	public int getTotal(Map<String, Object> map);
	
	/**
	 * 상품 삭제(단종된것만)
	 * @param productVO
	 * @return
	 */
	public int delProduct(ProductVO productVO);

}
