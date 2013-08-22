package kr.co.kibi.edms.user.service;

import java.util.List;

import kr.co.kibi.edms.admin.service.DocVO;

public interface UserMyDocService {
	
	/**
	 * 내문서 문서 목록
	 * @author 이진희
	 */
	public List<DocVO> selectMyDocList(DocVO dvo) throws Exception;
	
	/**
	 * 내문서 문서 상세 보기
	 * @author 이진희
	 */
	public DocVO selectMyDocView(DocVO dvo) throws Exception;
	
	/**
	 * 내문서 문서 의견 목록
	 * @author 이진희
	 */
	public List<DocVO> selectMySuggestList(DocVO dvo) throws Exception;
	
	/**
	 * 내문서 문서 삭제
	 *@author 이진희
	 */
	public void deleteMyDoc(DocVO dvo) throws Exception;
	
	/**
	 * 내문서 문서 수정
	 * @author 이진희
	 */
	public void updateMyDoc(DocVO dvo) throws Exception;
	
}
