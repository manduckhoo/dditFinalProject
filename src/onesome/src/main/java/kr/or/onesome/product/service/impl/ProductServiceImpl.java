package kr.or.onesome.product.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.atchFile.controller.FileController;
import kr.or.onesome.atchFile.service.AtchFileService;
import kr.or.onesome.product.mapper.ProductMapper;
import kr.or.onesome.product.service.ProductService;
import kr.or.onesome.product.vo.ProductVO;
import kr.or.onesome.vo.AtchFileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;

	@Autowired
	private AtchFileService atchFileService;

	@Override
	public List<ProductVO> productList() {
		return productMapper.productList();
	}

	@Override
	public ProductVO productDetail(int prdctNo) {
		log.info("productDetail: {}", productMapper.productDetail(prdctNo));
		return productMapper.productDetail(prdctNo);
	}

	@Override
	public int addProduct(ProductVO productVO) {
		
		// 파일 업로드
		List<AtchFileVO> fileVOList = atchFileService.uploadFile(productVO.getUploadFile(), "product");
		productVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());

		return productMapper.addProduct(productVO);
	}

	@Override
	public int getPrdctNm(String prdctNm) {
		return productMapper.getPrdctNm(prdctNm);
	}

	@Override
	public int modifyProduct(ProductVO productVO) {
		
		for(MultipartFile multipartFile : productVO.getUploadFile()) {
			if(!multipartFile.getOriginalFilename().equals("")) {
				
				List<AtchFileVO> fileVOList = atchFileService.updateUploadFile(productVO.getUploadFile(), "product");
				
				// 파일 삭제
				atchFileService.deleteFile(productVO.getAtchFileNo(), "product");

				log.info("modifyProduct productVO : {}", productVO.getAtchFileNo());
				log.info("modifyProduct fileVOList : {}", fileVOList.get(0).getAtchFileNo());

				productVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());
			}
		}

		return productMapper.modifyProduct(productVO);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return productMapper.getTotal(map);
	}

	@Override
	public int delProduct(ProductVO productVO) {
		// 기존파일 삭제
		atchFileService.deleteFile(productVO.getAtchFileNo(), "product");
		
		return productMapper.delProduct(productVO);
	}

}
