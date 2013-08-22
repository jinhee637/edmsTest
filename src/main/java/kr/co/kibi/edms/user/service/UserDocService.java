package kr.co.kibi.edms.user.service;

import java.util.List;

import kr.co.kibi.edms.admin.service.DocVO;
import kr.co.kibi.edms.com.service.FileVO;

public interface UserDocService {
	
	/**
	 * 카테고리별 문서 목록
	 * @author 이진희 
	 */
	public List<DocVO> selectCategoryDocList(DocVO dvo) throws Exception;
	
	/**
	 * 문서 목록(Meta 검색)
	 * @author 이진희
	 */
	public List<DocVO> selectMetaDocList(DocVO dvo) throws Exception;
	
	/**
	 * 문서 상세보기
	 * @author 이진희 
	 */
	public DocVO selectDocView(DocVO dvo) throws Exception;
	
	/**
	 * 문서에 달린 의견 조회
	 *  @author 이진희
	 */
	public List<DocVO> selectSuggestList(DocVO dvo) throws Exception;
	
	/**
	 * 문서에 의견 달기
	 * @author 이진희
	 */
	public void insertSuggest(DocVO dvo) throws Exception;
	
	/**
	 * 문서 등록
	 * @author 이진희
	 */
	public void insertDoc(DocVO dvo) throws Exception;

	/**
	 * 문서 조회 수 증가
	 * @author 이진희
	 */
	public void updateViewCnt(DocVO dvo) throws Exception;
	
	/**
	 * 문서 다운로드 수 증가
	 * @author 이진희
	 */
	public void updateDownCnt(DocVO dvo) throws Exception;
}
