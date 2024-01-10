package kr.or.onesome.excel.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.excel.mapper.ExcelUploadMapper;
import kr.or.onesome.excel.service.ExcelUploadService;
import kr.or.onesome.menu.mapper.MenuMapper;
import kr.or.onesome.menu.service.MenuService;
import kr.or.onesome.menu.vo.MenuVO;
import kr.or.onesome.vo.CtgryDetailVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ExcelUploadServiceImpl implements ExcelUploadService {

	@Autowired
	private ExcelUploadMapper excelUploadMapper;

	@Autowired
	private MenuMapper menuMapper;

	@Override
	public int excelUpload(MultipartFile file) {
		log.info("service: {}", file);
		if ((!file.getOriginalFilename().endsWith(".xlsx"))) {
			return 0;
		}

		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();

		try {
			XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
			XSSFSheet sheet = workbook.getSheetAt(0);
			XSSFRow row = null;
			XSSFCell cell = null;

			List<String> categoryList = new ArrayList<String>();

			log.info("rowNum: {}", sheet.getLastRowNum());

			for (int i = 0; i < sheet.getLastRowNum(); i++) {

				Map<String, Object> map = new HashMap<String, Object>();

				row = sheet.getRow(i);
				log.info("cellNum:  {}", row.getLastCellNum());

				for (int j = 0; j < row.getLastCellNum(); j++) {
					// 한줄의 셀을 불러와서 하나씩 넣어줌
					cell = row.getCell(j);
					if (cell == null) {
						continue;
					}

					if (i == 0) {
						categoryList.add(j, cell.getStringCellValue());
						continue;
					} else {
						switch (cell.getCellType()) {
						case NUMERIC:

							if (DateUtil.isCellDateFormatted(cell)) {
								Date date = cell.getDateCellValue();

								log.info("cellString(Date) ->" + date);

								map.put(categoryList.get(j), date);
							} else {
								int cellString = 0;
								cellString = (int) cell.getNumericCellValue();
								log.info("cellString(Numeric) ->" + cellString);
								map.put(categoryList.get(j), cellString);
							}

//							int numericCellValue = (int) cell.getNumericCellValue();
//							if (DateUtil.isCellDateFormatted(cell)) {
//								
//								map.put(categoryList.get(j), cell.getDateCellValue());
//							}
//
//							map.put(categoryList.get(j), numericCellValue);
							break;
						case STRING:
							String stringCellValue = cell.getStringCellValue();
							map.put(categoryList.get(j), stringCellValue);
							log.info("cellString(String) ->" + stringCellValue);
							break;
						default:
							break;
						}
					}
				}
				if (!map.isEmpty()) {
					mapList.add(map);
				}
			}

		} catch (IOException e) {
			log.error(e.getMessage());
		}
		log.info("JYB ==> {}", mapList);

		List<MenuVO> menuList = new ArrayList<MenuVO>();
//		List<CtgryDetailVO> cateList = new ArrayList<CtgryDetailVO>();

		int sum = 1;
		
		log.info("mapList 첫번째: >>>> {}", mapList);
		
		for (Map<String, Object> map : mapList) {

			MenuVO menuVO = new MenuVO();
			log.info("map: {}", map);
			
			map.forEach((key, value) -> {
				log.info("key: {}", key);
				log.info("value: {}", value);
//				if(key.equals("메뉴번호"))		menuVO.setMenuNo((int)value);
				if (key.equals("메뉴명"))
					menuVO.setMenuNm((String) value);
				else if (key.equals("카테고리")) {
					CtgryDetailVO ctgryDetailVO = this.menuMapper.getCtgryDetailNm((String) value);
					log.info("ctgryDetailVO: {}", ctgryDetailVO);
					menuVO.setCtgryDetailId(ctgryDetailVO.getCtgryDetailId());
					
				} else if (key.equals("가격"))
					menuVO.setMenuPrice((int) value);
				else if (key.equals("메뉴설명"))
					menuVO.setMenuDescription((String) value);
				else if (key.equals("출시일"))
					menuVO.setMenuStrtDt((Date) value);
				else if (key.equals("판매종료일"))
					menuVO.setMenuEndDt((Date) value);
			});
			log.info("menuVO: {}", menuVO);
			menuList.add(menuVO);

			sum++;
		}

		log.info("menuList >>>>>> : {}", menuList);
		int result = 0;
		for(MenuVO menuVO : menuList) {
			result += this.excelUploadMapper.insertMenuList(menuVO);
			
		}
		log.info("result: >>>> {}", result);
		
		return result;
	}

	@Override
	public List<MenuVO> getExcelList() {
		return this.excelUploadMapper.getExcelList();
	}

	@Override
	public List<MenuVO> download(Map<String,Object> map) {
		return this.excelUploadMapper.download(map);
	}

	@Override
	public List<MenuVO> getMenuList(Map<String, Object> map) {
		return this.excelUploadMapper.getMenuList(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.excelUploadMapper.getTotal(map);
	}
}
