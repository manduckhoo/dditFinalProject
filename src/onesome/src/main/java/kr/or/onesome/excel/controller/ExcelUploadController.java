package kr.or.onesome.excel.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.excel.service.ExcelUploadService;
import kr.or.onesome.menu.vo.MenuVO;
import kr.or.onesome.util.ArticlePage;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/menu")
public class ExcelUploadController {
	
	@Autowired
	private ExcelUploadService excelUploadService;
	
	@GetMapping("/uploadExcel")
	public String uploadExcelForm(
			@RequestParam(value = "keyword", defaultValue = "") String keyword, 
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		
		List<MenuVO> getMenuList = excelUploadService.getMenuList(map);
		int getTotal = excelUploadService.getTotal(map);
		
		ArticlePage<MenuVO> menuList = new ArticlePage<MenuVO>(getTotal, currentPage, 5, getMenuList);
		
		menuList.setUrl("admin/excel/excelUpload");
		model.addAttribute("menuList", menuList);
		return "admin/excel/excelUpload";
	}
	
	@ResponseBody
	@PostMapping("/excelUpload")
	public int excelUpload(@RequestBody MultipartFile file) throws IOException {
		log.info("uploadExcel"+file);
		
		int result = this.excelUploadService.excelUpload(file);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/excelList")
	public List<MenuVO> getExcelList() {
		List<MenuVO> menuExcelList = excelUploadService.getExcelList();
		
		log.info("menuExcelList: {}", menuExcelList);
		
		return menuExcelList;
	}
	
	@PostMapping("/download")
    public void download(HttpServletResponse response, String menuNo) throws IOException {
		log.info("menuNo : " + menuNo);
		
		String[] menuNoArr = menuNo.split(",");
		
		List<String> menuNoList = new ArrayList<String>();
		
		log.info("///////시작////////////");
		for(int i=0;i<menuNoArr.length;i++) {
			log.info("menuNoArr["+i+"] : " + menuNoArr[i]);
			menuNoList.add(menuNoArr[i]);
		}
		log.info("///////끝////////////");
		
		log.info("menuNoList : " + menuNoList);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("menuNoList", menuNoList);
		
		List<MenuVO> menuVOList = this.excelUploadService.download(map);
		
		log.info("download->menuVOList : " + menuVOList);
		
		Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("메뉴리스트");
        int rowNum = 0;
        Cell cell = null;
        Row row = null;
        int cellNum = 0;
        
        // 셀 스타일 지정
 		CellStyle headerStyle = wb.createCellStyle();
 		CellStyle listStyle = wb.createCellStyle();
 		
 		// 폰트 지정
 		Font headFont = wb.createFont();
 		Font listFont = wb.createFont();
 		
        // 헤더 스타일 지정
 		headerStyle.setAlignment(HorizontalAlignment.CENTER);
 		
        // 헤더 폰트지정
        headFont.setBold(true);
        headFont.setFontHeight((short)250);
        headFont.setFontName("맑은 고딕");
        headerStyle.setFont(headFont);
        
        // 리스트 스타일 지정
        listStyle.setAlignment(HorizontalAlignment.CENTER);
        
        // 리스트 폰트지정
        listFont.setBold(true);
        listFont.setFontHeight((short)150);
        listFont.setFontName("맑은 고딕");
        listStyle.setFont(listFont);
        
        // Header
        String[] cellHeader = {
        	"메뉴번호", "메뉴명", "가격", "칼로리", "당류",
        	"나트륨", "단백질", "포화지방", "카페인", "출시일", "판매종료일", "판매상태"
        };
        
        row = sheet.createRow(rowNum++);
        
        for(String head : cellHeader) {
        	cell = row.createCell(cellNum++);
        	cell.setCellValue(head);
        	
        	cell.setCellStyle(headerStyle);
        }
        
//        cell = row.createCell(cellNum++);
//        cell.setCellValue("판매상태");
        
        Date now = new Date();
        
        // 엑셀 다운로드 할 때 날짜 포맷 해줘야함
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        
        log.info("현재날짜: {}", now);
        // Body
        for (int i = 0; i < menuVOList.size(); i++) {
            cellNum = 0;
            row = sheet.createRow(rowNum++);
            cell = row.createCell(cellNum++);
            cell.setCellValue(menuVOList.get(i).getMenuNo());
            
            cell = row.createCell(cellNum++);
            cell.setCellValue(menuVOList.get(i).getMenuNm());
            
            cell = row.createCell(cellNum++);
            cell.setCellValue(menuVOList.get(i).getMenuPrice() + "원");
            
            cell = row.createCell(cellNum++);
            cell.setCellValue(menuVOList.get(i).getCalories());
            
            cell = row.createCell(cellNum++);
            cell.setCellValue(menuVOList.get(i).getSugar());
            
            cell = row.createCell(cellNum++);
            cell.setCellValue(menuVOList.get(i).getSodium());
            
            cell = row.createCell(cellNum++);
            cell.setCellValue(menuVOList.get(i).getProtein());
            
            cell = row.createCell(cellNum++);
            cell.setCellValue(menuVOList.get(i).getSaturatedFat());
            
            cell = row.createCell(cellNum++);
            cell.setCellValue(menuVOList.get(i).getCaffeine());
            
            cell = row.createCell(cellNum++);
            cell.setCellValue(sdf.format(menuVOList.get(i).getMenuStrtDt()));
            
            cell = row.createCell(cellNum++);
            if(menuVOList.get(i).getMenuEndDt() == null) {
            	cell.setCellValue("미정");
            } else {
            	cell.setCellValue(sdf.format(menuVOList.get(i).getMenuEndDt()));
            }
            
            // 날짜 비교해서 0이 나오면 동일한날짜, 0보다 작으면 현재보다 이전날짜, 0보다 크면 현재보다 이후 날짜
            int result = sdf.format(menuVOList.get(i).getMenuStrtDt()).compareTo(sdf.format(now));
            int result2 = 0;
            
            if(menuVOList.get(i).getMenuEndDt() != null) {
            	result2 = sdf.format(menuVOList.get(i).getMenuEndDt()).compareTo(sdf.format(now));
            }
            
            cell = row.createCell(cellNum++);
            if(result > 0) {
            	cell.setCellValue("판매 준비중");
            } else if(result < 0 && (result2 > 0 || menuVOList.get(i).getMenuEndDt() == null)) {
            	cell.setCellValue("판매중");	
            } else {
            	cell.setCellValue("단종");
            }
            
            // 리스트 스타일 적용
            for(int j = 0; j < cellNum; j++) {
            	cell = row.getCell(j);
            	cell.setCellStyle(listStyle);
            }
        }
 
        // Download
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=menu.xlsx");
        try {
            wb.write(response.getOutputStream());
        } finally {
            wb.close();
        }
    }
}

//if(menuStrtDt > now){
//		str += `<span class="badge bg-Warning-subtle text-Warning fw-semibold fs-2">판매준비중</span>`;
//	} else if(menuStrtDt < now && (menuEndDt > now || menuEndDt == null)) {
//		str += `<span class="badge bg-success-subtle text-success fw-semibold fs-2">판매중</span>`;
//	} else {
//		str += `<span class="badge bg-Dark-subtle fw-semibold fs-2">단종</span>`;
//	}
