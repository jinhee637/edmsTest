package kr.co.kibi.edms.admin.service;

import java.util.List;

public interface DeptService {
	/**
	 * 그룹에 대한 목록을 조회한다.
	 * @param dvo
	 * @author 이진희
	 */
	public List<DeptVO> selectDeptList(DeptVO dvo) throws Exception;
	
	/**
	 * 그룹를 생성한다.
	 * @param dvo
	 * @author 이진희
	 */
	public void insertDept(DeptVO dvo) throws Exception;
	
	/**
	 * 그룹의 다음 순번을 체크한다.
	 * @author 이진희
	 */
	public String selectDeptSq() throws Exception;
	
	/**
	 * 그룹를 삭제한다.
	 * @param dvo 
	 * @author 이진희
	 */
	public void deleteDept(DeptVO dvo) throws Exception;
	
	/**
	 * 그룹 목록 조회(Select용)
	 */
	public List<DeptVO> selectDept() throws Exception;
}
