package kr.or.onesome.atchFile.service;

import kr.or.onesome.atchFile.mapper.AtchFileMapper;
import kr.or.onesome.util.FileUtil;
import kr.or.onesome.vo.AtchFileVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
public class AtchFileService {

    @Autowired
    String uploadFolder;

    @Autowired
    private AtchFileMapper atchFileMapper;

    
    // insert
    public List<AtchFileVO> uploadFile(MultipartFile[] uploadFile, String folder) {

    	
    	log.info("uploadFile->uploadFile : " + uploadFile[0].getOriginalFilename());
    	
        // 첨부파일 insert 성공건수
        List<AtchFileVO> fileVOList = new ArrayList<>();
        // 연월일
        File uploadPath = new File(uploadFolder, folder + "/" + FileUtil.getFolder());
        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        // AtchFileNo 생성
        int atchFileNo = atchFileMapper.getAtchFileNo();
        log.info("uploadFile->atchFileNo : " + atchFileNo);

        for (MultipartFile multipartFile : uploadFile) {
            String uploadFileName = multipartFile.getOriginalFilename();

            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;
            log.info("uploadFile->uploadFileName : " + uploadFileName);

            // uploadPath: 연월일+upload
            // uuid + "_" + 파일명
            File saveFile = new File(uploadPath, uploadFileName);

            try {
                multipartFile.transferTo(saveFile);

                // ATCH_FILE_DETAIL 테이블에 insert
                // ATCH_FILE_ID, FILE_SN, FILE_STRE_COURS, STRE_FILE_NM
                // , ORIGNL_FILE_NM, FILE_EXTSN, FILE_CN, FILE_SIZE
                AtchFileVO athAtchFileVO = new AtchFileVO();
                athAtchFileVO.setAtchFileNo(atchFileNo);
                athAtchFileVO.setFileSn(0); // P.K
                athAtchFileVO.setFileStreCours(uploadPath + "\\" + uploadFileName);
                // 2023\\10\\31\\safdlkdsfj_개똥이2.jpg
                // getFolder() : 2023\\10\\31
                // uploadFileName : safdlkdsfj_개똥이2.jpg
                // 2023/10/31/safdlkdsfj_개똥이2.jpg
                athAtchFileVO.setStreFileNm(FileUtil.getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);
                athAtchFileVO.setOrignlFileNm(multipartFile.getOriginalFilename());
                athAtchFileVO.setFileExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));
                athAtchFileVO.setFileSize(multipartFile.getSize());

                log.info("atchFileDetailVO : " + athAtchFileVO);

                this.atchFileMapper.insertAtchFile(athAtchFileVO);
                fileVOList.add(athAtchFileVO);
            } catch (IllegalStateException | IOException e) {
                log.error(e.getMessage());
            }
        }
        return fileVOList;
    }

    /**
     * <p>업로드 된 파일을 삭제하고</p>
     * <p>db에서 파일정보를 삭제하기 위한 메서드</p>
     * @param atchFileNo 삭제할 파일 번호
     * @param folder 삭제할 파일이 저장된 폴더명
     */
    public void deleteFile(int atchFileNo, String folder){

        //입력받은 파일번호로 db에 저장된 파일정보를 조회
        List<AtchFileVO> atchFileVOList
                = atchFileMapper.getFilesByAtchFileNo(atchFileNo);

        for (AtchFileVO atchFileVO : atchFileVOList) {

            //각각의 파일경로를 지정
            String filePath = uploadFolder+"/"+folder+"/"+atchFileVO.getStreFileNm();

            try {
                //업로드 폴더의 파일 삭제
                FileUtils.delete(new File(filePath));
                log.warn("파일 삭제 성공");
            } catch (IOException e) {
                log.error(e.getMessage());
                log.error("파일 삭제 실패");
            }
        }

        //db에 저장된 파일정보 삭제
        atchFileMapper.deleteFile(atchFileNo);
    }
    
    // 기존파일 삭제 메서드
    private void deleteExistingFiles(int atchFileNo) {
        // 기존 파일 정보를 가져와
//        List<AtchFileVO> existingFiles = atchFileMapper.getFilesByAtchFileNo(atchFileNo);
        
        AtchFileVO existingFile = atchFileMapper.getAttachDetail(atchFileNo);
        
        log.info("existingFiles: {}", existingFile); // 이게 왜 널일까 ㅡㅡ;;
//		File deleteFile = new File(existingFile.getFileStreCours());
//		if (deleteFile.exists()) {
//			deleteFile.delete();
//		}
        // 기존 파일 삭제
//        for (AtchFileVO file : existingFiles) {
//            File deleteFile = new File(file.getFileStreCours());
//            if (deleteFile.exists()) {
//                deleteFile.delete();
//            }

            // 데이터베이스에서 파일 정보 삭제 진행시켜
//            atchFileMapper.deleteFile(file.getAtchFileNo());
//        }
    }
    
    // update
    public List<AtchFileVO> updateUploadFile(MultipartFile[] uploadFile, String folder) {
    	
    	
        // 첨부파일 insert 성공건수
        List<AtchFileVO> fileVOList = new ArrayList<>();
        // 연월일
        File uploadPath = new File(uploadFolder, folder + "/" + FileUtil.getFolder());
        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        // AtchFileNo 생성
        int atchFileNo = atchFileMapper.getAtchFileNo();
        
        log.info("atchFileNo >>>>  {}", atchFileNo);
        // 기존파일 삭제
        deleteExistingFiles(atchFileNo);
        
        for (MultipartFile multipartFile : uploadFile) {
            String uploadFileName = multipartFile.getOriginalFilename();

            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;

            // uploadPath: 연월일+upload
            // uuid + "_" + 파일명
            File saveFile = new File(uploadPath, uploadFileName);

            try {
                multipartFile.transferTo(saveFile);

                // ATCH_FILE_DETAIL 테이블에 insert
                // ATCH_FILE_ID, FILE_SN, FILE_STRE_COURS, STRE_FILE_NM
                // , ORIGNL_FILE_NM, FILE_EXTSN, FILE_CN, FILE_SIZE
                AtchFileVO athAtchFileVO = new AtchFileVO();
                athAtchFileVO.setAtchFileNo(atchFileNo);
                athAtchFileVO.setFileSn(0); // P.K
                athAtchFileVO.setFileStreCours(uploadPath + "\\" + uploadFileName);
                // 2023\\10\\31\\safdlkdsfj_개똥이2.jpg
                // getFolder() : 2023\\10\\31
                // uploadFileName : safdlkdsfj_개똥이2.jpg
                // 2023/10/31/safdlkdsfj_개똥이2.jpg
                athAtchFileVO.setStreFileNm(FileUtil.getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);
                athAtchFileVO.setOrignlFileNm(multipartFile.getOriginalFilename());
                athAtchFileVO.setFileExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));
                athAtchFileVO.setFileSize(multipartFile.getSize());

                log.info("atchFileDetailVO : " + athAtchFileVO);

                this.atchFileMapper.insertAtchFile(athAtchFileVO);
                fileVOList.add(athAtchFileVO);
            } catch (IllegalStateException | IOException e) {
                log.error(e.getMessage());
            }
        }
        return fileVOList;
    }

}
