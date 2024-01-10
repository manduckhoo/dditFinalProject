package kr.or.onesome.menu.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.atchFile.service.AtchFileService;
import kr.or.onesome.menu.mapper.MenuMapper;
import kr.or.onesome.menu.service.MenuService;
import kr.or.onesome.menu.vo.MenuVO;
import kr.or.onesome.product.vo.ProductVO;
import kr.or.onesome.vo.AtchFileVO;
import kr.or.onesome.vo.CtgryDetailVO;
import kr.or.onesome.vo.CtgryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    MenuMapper menuMapper;

    @Autowired
    AtchFileService atchFileService;
    
    @Transactional
    @Override
    public int modifyMenu(MenuVO menuVO) {

        //파일을 수정했는지 검증 후 새파일로 수정했다면 기존파일을 삭제 후
        //새 파일로 업로드
        for (MultipartFile multipartFile : menuVO.getUploadFile()) {
            if (!multipartFile.getOriginalFilename().equals("")){

                List<AtchFileVO> fileVOList
                        = atchFileService.uploadFile(menuVO.getUploadFile(), "menu");

                atchFileService.deleteFile(menuVO.getAtchFileNo(), "menu");
                menuVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());

            }
        }

        return menuMapper.modifyMenu(menuVO);
    }

    @Transactional
    @Override
    public int deleteMenu(MenuVO menuVO) {

        //메뉴 이미지 삭제
        atchFileService.deleteFile(menuVO.getAtchFileNo(), "menu");

        return menuMapper.deleteMenu(menuVO);
    }

    @Override
    public MenuVO adminMenuDetail(int menuNo) {
        return menuMapper.adminMenuDetail(menuNo);
    }

    @Transactional
    @Override
    public int menuRegistration(MenuVO menuVO) {
        
        int cnt = 0;

        List<AtchFileVO> fileVOList
                = atchFileService.uploadFile(menuVO.getUploadFile(), "menu");

        menuVO.setAtchFileNo(fileVOList.get(0).getAtchFileNo());

        return menuMapper.menuRegistration(menuVO);
    }

    @Override
    public List<ProductVO> getProductList() {
        return menuMapper.getProductList();
    }

    @Override
    public List<CtgryDetailVO> getCtgryDetailList() {
        return menuMapper.getCtgryDetailList();
    }

    @Override
    public List<CtgryVO> getCtgryList() {
        return menuMapper.getCtgryList();
    }

    @Override
    public List<MenuVO> adminMenuList(Map<String, Object> map) {
        return menuMapper.adminMenuList(map);
    }

    @Override
    public int getTotal(Map<String, Object> map) {
        return menuMapper.getTotal(map);
    }

}


















