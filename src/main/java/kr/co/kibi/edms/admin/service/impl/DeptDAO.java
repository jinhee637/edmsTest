package kr.co.kibi.edms.admin.service.impl;

import java.util.List;

import kr.co.kibi.edms.admin.service.DeptVO;
import kr.co.kibi.edms.com.service.impl.ComAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("DeptDAO")
public class DeptDAO extends ComAbstractDAO {
	
	/**
	 * 그룹 목록
	 * @param dvo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<DeptVO> selectDeptList(DeptVO dvo) throws Exception{
		return list("DeptDAO.selectDeptList", dvo);
	}
	
	/**
	 * 그룹 생성
	 * @param dvo
	 * @throws Exception
	 */
	public void insertDept(DeptVO dvo) throws Exception {
		insert("DeptDAO.insertDept", dvo);
	}
	
	/**
	 * 그룹 삭제
	 * @param dvo
	 * @throws Exception
	 */
	public void deleteDept(DeptVO dvo) throws Exception{
		delete("DeptDAO.deleteDept", dvo);
	}
	
	/**
	 * 그룹 삭제 후 문서 그룹 미지정으로 변경
	 * @param dvo
	 * @throws Exception
	 */
	public void updateDocGroup(DeptVO dvo) throws Exception{
		update("DeptDAO.updateDocGroup", dvo);
	}
	
	/**
	 * 그룹 삭제 후 사용자 그룹 미지정으로 변경
	 * @param dvo
	 * @throws Exception
	 */
	public void updateUserGroup(DeptVO dvo) throws Exception{
		update("DeptDAO.updateUserGroup", dvo);
	}
	
	/**
	 * 그룹 삭제 후 권한 그룹 미지정으로 변경
	 * @param dvo
	 * @throws Exception
	 */
	public void updateAuthorityGroup(DeptVO dvo) throws Exception{
		update("DeptDAO.updateAuthorityGroup", dvo);
	}
	
	/**
	 * 다음 생성 될 그룹 순번 체크 
	 */
	public String selectDeptSq() throws Exception{
		return (String)selectByPk("DeptDAO.selectDeptSq", null);
	}
	/**
	 * 그룹 조회
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<DeptVO> selectDept() throws Exception{
		return list("DeptDAO.selectDept", null);
	}
}
