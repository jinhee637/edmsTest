package kr.co.kibi.edms.com.service;

import java.io.Serializable;

/**
 * 페이징하는데 필요한 VO
 * @author KangHS
 *
 */
@SuppressWarnings("serial")
public class PagingVO implements Serializable {
	/**
	 * 입력받은 현재 페이지 번호
	 */
	public int currentPage = 1;
	/**
	 * 검색 혹은 목록의 총 카운트
	 */
	public int allCount;
	/**
	 * 총 페이지 카운트
	 */
	public int allPageCount;
	/**
	 * 이전 페이지
	 */
	public int prevPage;
	/**
	 * 다음 페이지
	 */
	public int nextPage;
	/**
	 * 현재 페이지 기준으로 
	 * 페이지 블럭의 첫 페이지 숫자
	 */
	public int firstPageNaviNum;
	/**
	 * 현재 페이지 기준으로 
	 * 페이지 블럭의 마지막 페이지 숫자
	 */
	public int endPageNaviNum;
	/**
	 * 한 페이지에 몇개의 게시글이 나올것인가
	 * 기본 10개
	 */
	public int articlePerPage = 20;
	/**
	 * 페이지당 페이지 번호 표시 개수
	 * ex: 1 2 3 4 5 6 7 8 9 10 를 표시하고 싶을 경우 10
	 * 기본은 10개
	 */
	public int pageBlockCount = 10;
	/**
	 * 계산된 첫 인덱스
	 * MagicOPPJ에서 인덱스 단위로만 페이징을 지원하기 때문에 
	 * 이 값은 항상 자동으로 계산된다.
	 */
	public int calcFirstIndex = 1;
	/**
	 * 계산된 마지막 인덱스
	 * MagicOPPJ에서 인덱스 단위로만 페이징을 지원하기 때문에
	 * 이 값은 항상 자동으로 계산된다.
	 */
	public int calcEndIndex = 10;
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}
	public int getAllCount() {
		return allCount;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setFirstPageNaviNum(int firstPageNaviNum) {
		this.firstPageNaviNum = firstPageNaviNum;
	}
	public int getFirstPageNaviNum() {
		return firstPageNaviNum;
	}
	public void setEndPageNaviNum(int endPageNaviNum) {
		this.endPageNaviNum = endPageNaviNum;
	}
	public int getEndPageNaviNum() {
		return endPageNaviNum;
	}
	public void setArticlePerPage(int articlePerPage) {
		this.articlePerPage = articlePerPage;
	}
	public int getArticlePerPage() {
		return articlePerPage;
	}
	public void setPageBlockCount(int pageBlockCount) {
		this.pageBlockCount = pageBlockCount;
	}
	public int getPageBlockCount() {
		return pageBlockCount;
	}
	public void setCalcFirstIndex(int calcFirstIndex) {
		this.calcFirstIndex = calcFirstIndex;
	}
	public int getCalcFirstIndex() {
		return calcFirstIndex;
	}
	public void setCalcEndIndex(int calcEndIndex) {
		this.calcEndIndex = calcEndIndex;
	}
	public int getCalcEndIndex() {
		return calcEndIndex;
	}
	public void setAllPageCount(int allPageCount) {
		this.allPageCount = allPageCount;
	}
	public int getAllPageCount() {
		return allPageCount;
	}
	
}
