package kr.co.kibi.edms.user.service.impl;

import java.util.List;

import kr.co.kibi.edms.admin.service.DocVO;
import kr.co.kibi.edms.com.service.impl.ComAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("UserMyDocDAO")
public class UserMyDocDAO extends ComAbstractDAO{
	
	/**
	 * 내문서 조회
	 * @param dvo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<DocVO> selectMyDocList(DocVO dvo) throws Exception{
		return list("UserMyDocDAO.selectMyDocList", dvo);
	}
	/**
	 * 문서 상세 보기
	 * @param dvo
	 * @return
	 * @throws Exception
	 */
	public DocVO selectMyDocView(DocVO dvo) throws Exception{
		return (DocVO) selectByPk("UserMyDocDAO.selectMyDocView", dvo);
	}
	
	/**
	 * 문서 의견 조회
	 * @param dvo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<DocVO> selectMySuggestList(DocVO dvo) throws Exception{
		return list("UserMyDocDAO.selectMySuggestList", dvo);
	}
	/**
	 * 문서 수정
	 * @param dvo
	 * @throws Exception
	 */
	public void updateDoc(DocVO dvo) throws Exception{
		update("UserMyDocDAO.updateMyDoc", dvo);
	}
	
	/**
	 * 문서 PDF데이터 수정
	 */
	public void updatePdfMeta(DocVO dvo) throws Exception{
		update("UserMyDocDAO.updateMyPdfMeta", dvo);
	}
	/**
	 * 문서 삭제
	 * @param dvo
	 * @throws Exception
	 */
	public void deleteDoc(DocVO dvo) throws Exception{
		delete("UserMyDocDAO.deleteMyDoc", dvo);
	}
	/**
	 * 문서 PDF META 삭제
	 * @param dvo
	 * @throws Exception
	 */
	public void deletePdfMeta(DocVO dvo) throws Exception{
		delete("UserMyDocDAO.deleteMyPdfMeta", dvo);
	}
	
	/**
	 * 문서 의견 삭제
	 * @param dvo
	 * @throws Exception
	 */
	public void deleteSgt(DocVO dvo) throws Exception{
		delete("UserMyDocDAO.deleteMySgt", dvo);
	}
 }
