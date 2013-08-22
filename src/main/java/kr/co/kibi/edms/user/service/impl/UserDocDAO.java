package kr.co.kibi.edms.user.service.impl;

import java.util.List;

import kr.co.kibi.edms.admin.service.DocVO;
import kr.co.kibi.edms.com.service.FileVO;
import kr.co.kibi.edms.com.service.impl.ComAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("UserDocDAO")
public class UserDocDAO extends ComAbstractDAO{
	
	/**
	 * 문서 카테고리로 조회
	 * @param dvo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<DocVO> selectCategoryDocList(DocVO dvo) throws Exception{
		return list("UserDocDAO.selectCategoryDocList", dvo);
	}
	
	/**
	 * 문서 Metadata로 조회
	 * @param dvo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<DocVO> selectMetaDocList(DocVO dvo) throws Exception{
		return list("UserDocDAO.selectMetaDocList", dvo);
	}
	
	/**
	 * 문서 상세 보기
	 * @param dvo
	 * @return
	 * @throws Exception
	 */
	public DocVO selectDocView(DocVO dvo) throws Exception{
		return (DocVO) selectByPk("UserDocDAO.selectDocView", dvo);
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
	 * 문서 삽입
	 * @param dvo
	 * @throws Exception
	 */
	public void insertDoc(DocVO dvo) throws Exception{
		insert("UserDocDAO.insertDoc", dvo);
	}
	
	public void insertPdfMeta(DocVO dvo) throws Exception{
		insert("UserDocDAO.insertPdfMeta", dvo);
	}
	
	/**
	 * 문서 의견 작성
	 * @param dvo
	 * @throws Exception
	 */
	public void insertSuggest(DocVO dvo) throws Exception{
		insert("UserDocDAO.insertSuggest", dvo);
	}
	
	/**
	 * 문서 파일 삭제
	 * @param fvo
	 * @throws Exception
	 */
	public void deleteFile(FileVO fvo) throws Exception{
		delete("UserDocDAO.deleteFile", fvo);
	}
	
	/**
	 * 문서 파일 수정
	 * @param fvo
	 * @throws Exception
	 */
	public void updateFile(FileVO fvo) throws Exception{
		update("UserDocDAO.updateFile", fvo);
	}
	
	/**
	 * 조회수 증가
	 * @param dvo
	 * @throws Exception
	 */
	public void updateViewCnt(DocVO dvo) throws Exception{
		update("UserDocDAO.updateViewCnt", dvo);
	}
	
	/**
	 * 다운로드 횟 수 증가
	 * @param dvo
	 * @throws Exception
	 */
	public void updateDownCnt(DocVO dvo) throws Exception{
		update("UserDocDAO.updateDownCnt", dvo);
	}
 }
