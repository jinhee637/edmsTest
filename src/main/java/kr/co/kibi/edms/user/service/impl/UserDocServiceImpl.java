package kr.co.kibi.edms.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.kibi.edms.admin.service.DocVO;
import kr.co.kibi.edms.com.service.FileVO;
import kr.co.kibi.edms.user.service.UserDocService;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("UserDocService")
public class UserDocServiceImpl extends AbstractServiceImpl implements UserDocService {
	
	@Resource(name = "UserDocDAO")
	private UserDocDAO userDocDAO;
	
	/**
	 * 문서 카테고리로 목록 조회
	 * @author 이진희
	 */
	public List<DocVO> selectCategoryDocList(DocVO dvo) throws Exception {
		return userDocDAO.selectCategoryDocList(dvo);
	}

	/**
	 * 문서 Metadata로 목록 조회
	 * @author 이진희
	 */
	public List<DocVO> selectMetaDocList(DocVO dvo) throws Exception {
		return userDocDAO.selectMetaDocList(dvo);
	}

	/**
	 * 문서 상세 조회
	 * @author 이진희
	 */
	public DocVO selectDocView(DocVO dvo) throws Exception {
		return userDocDAO.selectDocView(dvo);
	}
	
	/**
	 * 문서 의견 조회
	 * @author 이진희
	 */
	public List<DocVO> selectSuggestList(DocVO dvo) throws Exception {
		return userDocDAO.selectSuggestList(dvo);
	}

	/**
	 * 문서 의견 작성
	 * @author 이진희
	 */
	public void insertSuggest(DocVO dvo) throws Exception{
		userDocDAO.insertSuggest(dvo);
	}
	
	/**
	 * 문서 삽입
	 * @author 이진희
	 */
	public void insertDoc(DocVO dvo) throws Exception {
		userDocDAO.insertDoc(dvo);
		userDocDAO.insertPdfMeta(dvo);
		
	}
	
	/**
	 * 조회수 증가
	 * @author 이진희
	 */
	public void updateViewCnt(DocVO dvo) throws Exception {
		userDocDAO.updateViewCnt(dvo);
	}

	/**
	 * 다운로드 횟 수 증가
	 * @author 이진희
	 */
	public void updateDownCnt(DocVO dvo) throws Exception {
		userDocDAO.updateDownCnt(dvo);
	}

}
