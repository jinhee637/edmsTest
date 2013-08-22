package kr.co.kibi.edms.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.kibi.edms.admin.service.DocService;
import kr.co.kibi.edms.admin.service.DocVO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("DocService")
public class DocServiceImpl extends AbstractServiceImpl implements DocService {
	
	@Resource(name = "DocDAO")
	private DocDAO docDAO;
	
	public static final Logger LOGGER = Logger.getLogger(DocServiceImpl.class.getName());
	
	/**
	 * 문서 목록 조회 Meta 검색 조건
	 * @author 이진희
	 */
	public List<DocVO> selectDocList(DocVO dvo) throws Exception {
		return docDAO.selectDocList(dvo);
	}

	/**
	 * 문서 상세 조회
	 * @author 이진희
	 */
	public DocVO selectDocView(DocVO dvo) throws Exception {
		return docDAO.selectDocView(dvo);
	}
	
	/**
	 * 문서 의견 조회
	 * @author 이진희
	 */
	public List<DocVO> selectSuggestList(DocVO dvo) throws Exception {
		return docDAO.selectSuggestList(dvo);
	}
	
	/**
	 * 문서 삭제
	 * @author 이진희
	 */
	public void deleteDoc(DocVO dvo) throws Exception {
		docDAO.deleteDoc(dvo);
		docDAO.deletePdfMeta(dvo);
		docDAO.deleteSgt(dvo);
	}
	
	/**
	 * 문서 수정
	 * @author 이진희
	 */
	public void updateDoc(DocVO dvo) throws Exception {
		docDAO.updateDoc(dvo);
		docDAO.updatePdfMeta(dvo);
	}

}
