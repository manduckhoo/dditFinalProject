package kr.or.onesome.excel.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.onesome.menu.vo.MenuVO;

public interface ExcelUploadService {

	public int excelUpload(MultipartFile file);

	public List<MenuVO> getExcelList();

	public List<MenuVO> download(Map<String,Object> map);

	public List<MenuVO> getMenuList(Map<String, Object> map);

	public int getTotal(Map<String, Object> map);

}
