package kr.or.onesome.product.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.onesome.product.vo.ProductVO;

@Mapper
public interface ProductMapper {
	
	/**
	 * 상품 리스트 조회
	 * @return
	 */
	public List<ProductVO> productList();
	
	/**
	 * 상품 상세조회
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
	 * 상품 이름 중복체크
	 * @param prdctNm
	 * @return
	 */
	public int getPrdctNm(String prdctNm);
	
	/**
	 * 상품 수정
	 * @param productVO
	 * @return
	 */
	public int modifyProduct(ProductVO productVO);
	
	/**
	 * 상품 총 갯수
	 * @param map 
	 * @return
	 */
	public int getTotal(Map<String, Object> map);
	
	/**
	 * 상품삭제(단종된것만)
	 * @param productVO
	 * @return
	 */
	public int delProduct(ProductVO productVO);
	
}
