package kr.co.kibi.edms.util;

import kr.co.kibi.edms.com.service.PagingVO;


/**
 * @author : h.s kang   (@ria soft)
 * @project : epki_webmanager
 * @type : 
 * @2011. 11. 26.
 * last modify : 
 * CalcPaging.java 
 * kr.co.riasoft.epki.util.paging
 * comment : 페이징 계산하는 유틸 클래스
 */
public class CalcPaging {
	public static PagingVO calcPageNavigation(PagingVO vo) {
		int totalcnt = vo.getAllCount();
		int articlePerPage = vo.getArticlePerPage();
		int pageBlockCount = vo.getPageBlockCount();
		int cur_page = vo.getCurrentPage();
		if (totalcnt > 0) {
			// 전체 페이지 수
			int allPageCount = (int) (Math.ceil((double) totalcnt / (double) articlePerPage)); // 전체 페이지수를 구한다.
			// 페이지 블럭의 첫번째
			int first = (int) (((int) Math.floor((double) (cur_page-1)  / (double) pageBlockCount))*pageBlockCount+1);
			// 페이지 블럭의 마지막
			int end = first + (pageBlockCount - 1) > allPageCount ? allPageCount : first + (pageBlockCount - 1);
			
			vo.setFirstPageNaviNum(first);
			vo.setEndPageNaviNum(end);
			vo.setAllPageCount(allPageCount);
			
			int firstIndex = (cur_page-1) * articlePerPage+1;
			int endIndex = firstIndex + articlePerPage;
			vo.setCalcFirstIndex(firstIndex);
			vo.setCalcEndIndex(endIndex);
			
			if( first != 1 ) {
				vo.setPrevPage(first-1);
			}
			if( end < allPageCount ) {
				vo.setNextPage(end+1);
			}
			if( allPageCount < cur_page )
				vo.setCurrentPage(allPageCount);
		}
		return vo;
	}
}
