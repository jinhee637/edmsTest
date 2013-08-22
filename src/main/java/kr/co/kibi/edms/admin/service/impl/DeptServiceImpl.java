package kr.co.kibi.edms.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.kibi.edms.admin.service.DeptService;
import kr.co.kibi.edms.admin.service.DeptVO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("DeptService")
public class DeptServiceImpl extends AbstractServiceImpl implements DeptService {

	@Resource(name = "DeptDAO")
	private DeptDAO deptDAO;
	
	public static final Logger LOGGER = Logger.getLogger(DeptServiceImpl.class.getName());
	
	/**
	 * 그룹 목록 조회
	 * @author 이진희
	 */
	public List<DeptVO> selectDeptList(DeptVO dvo) throws Exception {
		return deptDAO.selectDeptList(dvo);
	}
	
	/**
	 * 그룹 생성
	 * @author 이진희
	 */
	public void insertDept(DeptVO dvo) throws Exception {
		deptDAO.insertDept(dvo);
	}

	/**
	 * 그룹 삭제
	 * @author 이진희
	 */
	public void deleteDept(DeptVO dvo) throws Exception {
		deptDAO.updateDocGroup(dvo);
		deptDAO.updateUserGroup(dvo);
		deptDAO.updateAuthorityGroup(dvo);
		deptDAO.deleteDept(dvo);
	}

	/**
	 * 그룹 SEQ 조회
	 * @author 이진희
	 */
	public String selectDeptSq() throws Exception {
		String result = deptDAO.selectDeptSq();
		return result;
	}
	
	/**
	 * selectbox에 사용할 그룹 목록 조회
	 */
	public List<DeptVO> selectDept() throws Exception {
		return deptDAO.selectDept();
	}

}
