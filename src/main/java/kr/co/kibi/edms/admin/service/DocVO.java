package kr.co.kibi.edms.admin.service;

import java.io.Serializable;

import kr.co.kibi.edms.com.service.PagingVO;

@SuppressWarnings("serial")
public class DocVO implements Serializable {
	/**
	 * 문서 번호
	 */
	public int docSeq;
	
	/**
	 * 문서 제목
	 */
	public String titIf;
	
	/**
	 * 부서 순번
	 */
	public int deptSeq;
	
	/**
	 * 부서 명
	 */
	public String deptNm;
	
	/**
	 * 최초 게시일자
	 */
	public String fregDt;
	
	/**
	 * 문서 주제
	 */
	public String sbjNt;
	
	/**
	 * 문서 작성일자
	 */
	public String metafregDt;
	
	/**
	 * 사용자 번호
	 */
	public int partySeq;
	
	/**
	 * 사용자 명
	 */
	public String userNm;
	
	/**
	 * 조회 수
	 */
	public int viewCnt;
	
	/**
	 * 다운로드 수
	 */
	public int downCnt;
	
	/**
	 * 카테고리 명
	 */
	public String catNm;
	
	/**
	 * 카테고리 번호
	 */
	public int catSeq;
	
	/**
	 * 아티클 일련번호
	 */
	public int articleId;
	
	/**
	 * 원본 파일 명
	 */
	public String orgfileNm;
	
	/**
	 * 문서 작성자
	 */
	public String writmanNm;
	
	/**
	 * 문서 키워드
	 */
	public String keywordIf;
	
	/**
	 * 의견 작성자 번호
	 */
	public int regptSeq;
	
	/**
	 * 의견 작성자
	 */
	public String regptNm;
	
	/**
	 * 의견 번호
	 */
	public int sgtSeq;
	
	/**
	 * 의견 내용
	 */
	public String sgtDc;
	
	/**
	 * 의견 작성  날짜
	 */
	public String regTm;
	
	/**
	 * 페이징 처리 모델
	 */
	public PagingVO pagingVO;
	
	/**
	 * 조회수로 정렬
	 */
	public String orderViewCnt;
	
	/**
	 * 다운로드수로 정렬
	 */
	public String orderDownCnt;
	
	/**
	 * 등록날짜로 정렬 
	 */
	public String orderDt;
	
	/**
	 * 문서 Meta 검색 시 글 제목
	 */
	public String titSearch;
	
	/**
	 * 문서 Meta 검색 시 작성자
	 */
	public String writmanSearch;
	
	/**
	 * 문서 Meta 검색 시 주제
	 */
	public String sbjSearch;
	
	/**
	 * 문서 Meta 검색 시 키워드
	 */
	public String keywordSearch;
	
	/**
	 * 통합 검색 구분
	 */
	public String allSearch;
	
	/**
	 * 통합 검색 값
	 */
	public String all;
	
	/**
	 * 카테고리 검색이냐 Meta검색이냐 구분 값
	 */
	public String gubun;
	
	/**
	 * 의견달기 여부
	 */
	public String sug;
	
	/**
	 * 권한 코드
	 */
	public String bizroleCd;
	
	/**
	 * 문서 수정에 사용 될 문서 제목
	 */
	public String uptTitIf;
	
	/**
	 * 문서 수정에 사용 될 작성자
	 */
	public String uptWritmanNm;
	
	/**
	 * 문서 수정에 사용 될 주제
	 */
	public String uptSbjNt;
	
	/**
	 * 문서 수정에 사용 될 키워드
	 */
	public String uptKeywordIf;
	
	/**
	 * getter, setter start
	 * 
	 */
	public int getDocSeq() {
		return docSeq;
	}
	
	public void setDocSeq(int docSeq) {
		this.docSeq = docSeq;
	}
	
	public String getTitIf() {
		return titIf;
	}
	
	public void setTitIf(String titIf) {
		this.titIf = titIf;
	}

	public String getDeptNm() {
		return deptNm;
	}

	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	
	public String getFregDt() {
		return fregDt;
	}

	public void setFregDt(String fregDt) {
		this.fregDt = fregDt;
	}

	public String getSbjNt() {
		return sbjNt;
	}

	public void setSbjNt(String sbjNt) {
		this.sbjNt = sbjNt;
	}

	public String getMetafregDt() {
		return metafregDt;
	}

	public void setMetafregDt(String metafregDt) {
		this.metafregDt = metafregDt;
	}
	
	public int getPartySeq() {
		return partySeq;
	}

	public void setPartySeq(int partySeq) {
		this.partySeq = partySeq;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getDownCnt() {
		return downCnt;
	}

	public void setDownCnt(int downCnt) {
		this.downCnt = downCnt;
	}

	public String getCatNm() {
		return catNm;
	}

	public void setCatNm(String catNm) {
		this.catNm = catNm;
	}

	public int getDeptSeq() {
		return deptSeq;
	}

	public void setDeptSeq(int deptSeq) {
		this.deptSeq = deptSeq;
	}

	public int getCatSeq() {
		return catSeq;
	}

	public void setCatSeq(int catSeq) {
		this.catSeq = catSeq;
	}

	public String getOrgfileNm() {
		return orgfileNm;
	}

	public void setOrgfileNm(String orgfileNm) {
		this.orgfileNm = orgfileNm;
	}

	public String getWritmanNm() {
		return writmanNm;
	}

	public void setWritmanNm(String writmanNm) {
		this.writmanNm = writmanNm;
	}

	public String getKeywordIf() {
		return keywordIf;
	}

	public void setKeywordIf(String keywordIf) {
		this.keywordIf = keywordIf;
	}

	public int getRegptSeq() {
		return regptSeq;
	}

	public void setRegptSeq(int regptSeq) {
		this.regptSeq = regptSeq;
	}

	public String getRegptNm() {
		return regptNm;
	}

	public void setRegptNm(String regptNm) {
		this.regptNm = regptNm;
	}
	
	public int getSgtSeq() {
		return sgtSeq;
	}

	public void setSgtSeq(int sgtSeq) {
		this.sgtSeq = sgtSeq;
	}

	public String getSgtDc() {
		return sgtDc;
	}

	public void setSgtDc(String sgtDc) {
		this.sgtDc = sgtDc;
	}

	public String getRegTm() {
		return regTm;
	}

	public void setRegTm(String regTm) {
		this.regTm = regTm;
	}

	public PagingVO getPagingVO() {
		return pagingVO;
	}

	public void setPagingVO(PagingVO pagingVO) {
		this.pagingVO = pagingVO;
	}

	public String getOrderViewCnt() {
		return orderViewCnt;
	}

	public void setOrderViewCnt(String orderViewCnt) {
		this.orderViewCnt = orderViewCnt;
	}

	public String getOrderDownCnt() {
		return orderDownCnt;
	}

	public void setOrderDownCnt(String orderDownCnt) {
		this.orderDownCnt = orderDownCnt;
	}

	public String getOrderDt() {
		return orderDt;
	}

	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}

	public String getTitSearch() {
		return titSearch;
	}

	public void setTitSearch(String titSearch) {
		this.titSearch = titSearch;
	}

	public String getWritmanSearch() {
		return writmanSearch;
	}

	public void setWritmanSearch(String writmanSearch) {
		this.writmanSearch = writmanSearch;
	}

	public String getSbjSearch() {
		return sbjSearch;
	}

	public void setSbjSearch(String sbjSearch) {
		this.sbjSearch = sbjSearch;
	}

	public String getKeywordSearch() {
		return keywordSearch;
	}

	public void setKeywordSearch(String keywordSearch) {
		this.keywordSearch = keywordSearch;
	}
	
	public String getAllSearch() {
		return allSearch;
	}

	public void setAllSearch(String allSearch) {
		this.allSearch = allSearch;
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getSug() {
		return sug;
	}

	public void setSug(String sug) {
		this.sug = sug;
	}

	public String getBizroleCd() {
		return bizroleCd;
	}

	public void setBizroleCd(String bizroleCd) {
		this.bizroleCd = bizroleCd;
	}

	public String getAll() {
		return all;
	}

	public void setAll(String all) {
		this.all = all;
	}

	public String getUptTitIf() {
		return uptTitIf;
	}

	public void setUptTitIf(String uptTitIf) {
		this.uptTitIf = uptTitIf;
	}

	public String getUptWritmanNm() {
		return uptWritmanNm;
	}

	public void setUptWritmanNm(String uptWritmanNm) {
		this.uptWritmanNm = uptWritmanNm;
	}

	public String getUptSbjNt() {
		return uptSbjNt;
	}

	public void setUptSbjNt(String uptSbjNt) {
		this.uptSbjNt = uptSbjNt;
	}

	public String getUptKeywordIf() {
		return uptKeywordIf;
	}

	public void setUptKeywordIf(String uptKeywordIf) {
		this.uptKeywordIf = uptKeywordIf;
	}
	
	/**
	 * getter, setter end
	 * 
	 */
}
