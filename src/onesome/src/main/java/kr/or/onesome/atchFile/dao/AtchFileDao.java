//package kr.or.onesome.atchFile.dao;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import kr.or.onesome.vo.AtchFileVO;
//
//@Repository
//public class AtchFileDao {
//
//	@Autowired
//	SqlSessionTemplate sqlSessionTemplate;
//	
//	//ATCH_FILE 테이블에 insert
//	public int insertAtchFile(AtchFileVO atchFileVO) {
//		return this.sqlSessionTemplate.insert("atchFile.insertAtchFile", atchFileVO);
//	}
//}
