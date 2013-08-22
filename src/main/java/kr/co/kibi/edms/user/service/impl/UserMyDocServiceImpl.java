package kr.co.kibi.edms.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.kibi.edms.admin.service.DocVO;
import kr.co.kibi.edms.user.service.UserMyDocService;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("UserMyDocService")
public class UserMyDocServiceImpl extends AbstractServiceImpl implements UserMyDocService {
	
	@Resource(name = "UserMyDocDAO")
	private UserMyDocDAO userMyDocDAO;

	/**
	 * 내문서 목록 조회
	 * @author 이진희
	 */
	public List<DocVO> selectMyDocList(DocVO dvo) throws Exception {
		return userMyDocDAO.selectMyDocList(dvo);
	}
	
	/**
	 * 내문서 상세 조회
	 * @author 이진희
	 */
	public DocVO selectMyDocView(DocVO dvo) throws Exception {
		return userMyDocDAO.selectMyDocView(dvo);
	}
	
	/**
	 * 내문서 의견 조회
	 * @author 이진희
	 */
	public List<DocVO> selectMySuggestList(DocVO dvo) throws Exception {
		return userMyDocDAO.selectMySuggestList(dvo);
	}
	
	/**
	 * 내문서 문서 삭제
	 * @author 이진희
	 */
	public void deleteMyDoc(DocVO dvo) throws Exception {
		userMyDocDAO.deleteDoc(dvo);
		userMyDocDAO.deletePdfMeta(dvo);
		userMyDocDAO.deleteSgt(dvo);
	}
	
	/**
	 * 내문서 문서 수정
	 * @author 이진희
	 */
	public void updateMyDoc(DocVO dvo) throws Exception {
		userMyDocDAO.updateDoc(dvo);
		userMyDocDAO.updatePdfMeta(dvo);
	}
}
