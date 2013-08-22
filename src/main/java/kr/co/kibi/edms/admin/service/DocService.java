package kr.co.kibi.edms.admin.service;

import java.util.List;

public interface DocService {
	
	/**
	 * 문서 목록(Meta검색 조건)
	 * @param dvo
	 * @author 이진희
	 * @throws Exception
	 */
	public List<DocVO> selectDocList(DocVO dvo) throws Exception;
	
	/**
	 * 문서 상세 보기
	 * @param dvo
	 * @author 이진희
	 * @throws Exception
	 */
	public DocVO selectDocView(DocVO dvo) throws Exception;
	
	/**
	 * 문서에 달린 의견 조회
	 * @param dvo
	 * @author 이진희
	 * @throws Exception
	 */
	public List<DocVO> selectSuggestList(DocVO dvo) throws Exception;
	
	/**
	 * 문서 삭제
	 * @param dvo
	 * @author 이진희
	 * @throws Exception
	 */
	public void deleteDoc(DocVO dvo) throws Exception;
	
	/**
	 * 문서 수정
	 * @param dvo
	 * @author 이진희
	 * @throws Exception
	 */
	public void updateDoc(DocVO dvo) throws Exception;
}
