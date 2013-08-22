package kr.co.kibi.edms.com.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

public interface KibiFileMngService {

	/**
     * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
     * @author 이진희
     */
    public String insertFileInf(FileVO fvo) throws Exception;

    /**
     * 파일명 중복 체크
     * @author 이진희
     */
    public int selectOrgfileNm(FileVO fvo) throws Exception;
    
    /**
     * ArticleId 조회
     * @author 이진희
     */
    public FileVO selectArticleId() throws Exception;
    
    /**
     * 하나의 파일을 삭제한다.
     * @author 이진희
     */
    public void deleteFileInf(FileVO fvo) throws Exception;

    /**
     * 파일에 대한 상세정보를 조회한다.
     * @author 이진희
     */
    public FileVO selectFileInf(FileVO fvo) throws Exception;
}
