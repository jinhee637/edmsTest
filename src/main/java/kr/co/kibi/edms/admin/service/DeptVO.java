package kr.co.kibi.edms.admin.service;

import java.io.Serializable;

import kr.co.kibi.edms.com.service.PagingVO;


@SuppressWarnings("serial")
public class DeptVO implements Serializable {
	 /**
	  * 그룹 코드
	  */
	public String deptCd;
	
	/**
	 * 그룹일련번호
	 */
	public int deptSeq;
	
	/**
	 * 그룹명
	 */
	public String deptNm;
	
	/**
	 * 그룹 설명
	 */
	public String deptDc;
	
	/**
	 * 페이징 처리 모델
	 */
	public PagingVO pagingVO;
	
	/**
	 * getter, setter start
	 * 
	 */
	public String getDeptCd() {
		return deptCd;
	}

	public void setDeptCd(String deptCd) {
		this.deptCd = deptCd;
	}

	public int getDeptSeq() {
		return deptSeq;
	}

	public void setDeptSeq(int deptSeq) {
		this.deptSeq = deptSeq;
	}

	public String getDeptNm() {
		return deptNm;
	}

	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}

	public String getDeptDc() {
		return deptDc;
	}

	public void setDeptDc(String deptDc) {
		this.deptDc = deptDc;
	}

	public PagingVO getPagingVO() {
		return pagingVO;
	}

	public void setPagingVO(PagingVO pagingVO) {
		this.pagingVO = pagingVO;
	}
	
	/**
	 * getter, setter end
	 * 
	 */
}
