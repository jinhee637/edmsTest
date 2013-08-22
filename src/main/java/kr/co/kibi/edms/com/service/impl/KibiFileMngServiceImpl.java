package kr.co.kibi.edms.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.kibi.edms.com.service.FileVO;
import kr.co.kibi.edms.com.service.KibiFileMngService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

	@Service("KibiFileMngService")
	public class KibiFileMngServiceImpl extends AbstractServiceImpl implements KibiFileMngService {

	    @Resource(name = "FileManageDAO")
	    private FileManageDAO fileMngDAO;

	    public static final Logger LOGGER = Logger.getLogger(KibiFileMngServiceImpl.class.getName());

	    /**
	     * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	     * @author 이진희
	     */
	    public String insertFileInf(FileVO fvo) throws Exception {
		String articleId = fvo.getArticleId();
		
		fileMngDAO.insertFileInf(fvo);
		
		return articleId;
	    }

	    /**
	     * 하나의 파일을 삭제한다.
	     * @author 이진희
	     */
	    public void deleteFileInf(FileVO fvo) throws Exception {
	    	fileMngDAO.deleteFileDetail(fvo);
	    	fileMngDAO.deleteFile(fvo);
	    }

	    /**
	     * 파일에 대한 상세정보를 조회한다.
	     * @author 이진희
	     */
	    public FileVO selectFileInf(FileVO fvo) throws Exception {
		return fileMngDAO.selectFileInf(fvo);
	    }

	    /**
	     * ArticleId 조회
	     * @author 이진희
	     */
		public FileVO selectArticleId() throws Exception {
			return fileMngDAO.selectAticleId();
		}
		
		/**
		 * 파일명 중복 체크
		 * @author 이진희
		 */
		public int selectOrgfileNm(FileVO fvo) throws Exception {
			return fileMngDAO.selectOrgfileNm(fvo);
		}

		
}
