package kr.co.kibi.edms.admin.service.impl;

import java.util.List;

import kr.co.kibi.edms.admin.service.DocVO;
import kr.co.kibi.edms.com.service.impl.ComAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("DocDAO")
public class DocDAO extends ComAbstractDAO{
	
	/**
	 * 문서 목록(Meta 검색조건)
	 * @param dvo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<DocVO> selectDocList(DocVO dvo) throws Exception{
		return list("DocDAO.selectDocList", dvo);
	}
	
	/**
	 * 문서 상세 보기
	 * @param dvo
	 * @return
	 * @throws Exception
	 */
	public DocVO selectDocView(DocVO dvo) throws Exception{
		return (DocVO)selectByPk("DocDAO.selectDocView", dvo);
	}
	
	/**
	 * 문서 의견 조회
	 * @param dvo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<DocVO> selectSuggestList(DocVO dvo) throws Exception{
		return list("DocDAO.selectSuggestList", dvo);
	}
	
	/**
	 * 문서 삭제
	 * @param dvo
	 * @throws Exception
	 */
	public void deleteDoc(DocVO dvo) throws Exception{
		delete("DocDAO.deleteDoc", dvo);
	}
	
	/**
	 *문서 PDF META 삭제
	 * @param dvo
	 * @throws Exception
	 */
	public void deletePdfMeta(DocVO dvo) throws Exception{
		delete("DocDAO.deletePdfMeta", dvo);
	}
	
	/**
	 * 문서 의견 삭제
	 * @param dvo
	 * @throws Exception
	 */
	public void deleteSgt(DocVO dvo) throws Exception{
		delete("DocDAO.deleteSgt", dvo);
	}
	
	/**
	 * 문서 수정
	 * @param dvo
	 * @throws Exception
	 */
	public void updateDoc(DocVO dvo) throws Exception{
		update("DocDAO.updateDoc", dvo);
	}
	
	/**
	 * 문서 PDF데이터 수정
	 */
	public void updatePdfMeta(DocVO dvo) throws Exception{
		update("DocDAO.updatePdfMeta", dvo);
	}
}
