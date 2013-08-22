package kr.co.kibi.edms.com.service.impl;

import kr.co.kibi.edms.com.service.FileVO;

import org.springframework.stereotype.Repository;

@Repository("FileManageDAO")
public class FileManageDAO extends ComAbstractDAO {
	
	/**
	 * 파일명 중복체크
	 * @author 이진희
	 */
    public int selectOrgfileNm(FileVO fvo) throws Exception{
    	return (Integer) selectByPk("FileManagerDAO.selectOrgfileNm", fvo);
    }

    /**
     * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
     * @author 이진희
     */
    public void insertFileInf(FileVO vo) throws Exception {
		insert("FileManageDAO.insertFileMaster", vo);
		insert("FileManageDAO.insertFileDetail", vo);
    }
    
    /**
     * 등록할 파일의 다음 ArticleId조회
     * @author 이진희
     */
    public FileVO selectAticleId() throws Exception {
    	return (FileVO)selectByPk("FileManagerDAO.selectArticleId", null);
    }
    
    /**
     * 파일 삭제.(CO_ARTICLE)
     * @author 이진희
     */
    public void deleteFile(FileVO fvo) throws Exception {
    	delete("FileManageDAO.deleteFile", fvo);
    }
    
    /**
     * 파일을 삭제한다.(CO_ATI_FILE)
     * @author 이진희
     */
    public void deleteFileDetail(FileVO fvo) throws Exception {
    	delete("FileManageDAO.deleteFileDetail", fvo);
    }

    /**
     * 파일에 대한 상세정보를 조회한다.
     * @author 이진희
     */
    public FileVO selectFileInf(FileVO fvo) throws Exception {
	return (FileVO)selectByPk("FileManageDAO.selectFileInf", fvo);
    }
}
