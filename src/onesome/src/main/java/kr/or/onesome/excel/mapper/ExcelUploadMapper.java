package kr.or.onesome.excel.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.onesome.menu.vo.MenuVO;

@Mapper
public interface ExcelUploadMapper {

	int insertMenuList(MenuVO menuVO);

	List<MenuVO> getExcelList();

	List<MenuVO> download(Map<String,Object> map);

	List<MenuVO> getMenuList(Map<String, Object> map);

	int getTotal(Map<String, Object> map);

}
