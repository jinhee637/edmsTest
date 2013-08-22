<%@ tag body-content="empty" description="페이지 네비게이션을 위한 태그" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="pageURL" rtexprvalue="true" description="폼 URL을 바꾸고 싶을때" %>
<%@ attribute name="formName" required="true" rtexprvalue="true" %>
<%@ attribute name="pvo" required="true" rtexprvalue="true" type="kr.co.kibi.edms.com.service.PagingVO" %>

<script type="text/javascript">
function goPage(pageno) {
	var form = $('#${formName}');
	var pageURL = '${pageURL}';
	form.attr("action", pageURL);
	form.append('<input type="hidden" name="currentPage" value="' + pageno + '" />');
	form.submit();
}
</script>
<div class="paging">
	<ul>
		<li class="none">
			<c:if test="${pvo.allPageCount > 1 }">
				<a href="#" onclick="return goPage(1); return false;" title="맨앞으로" class="first"><img src="/images/img/btn-page-first.gif" alt="첫번째 페이지로 이동" /></a>
			</c:if>
			<c:if test="${pvo.prevPage != 0 }">
				<a href="#" onclick="return goPage(${pvo.prevPage }); return false;" title="앞으로" class="pre"><img src="/images/img/btn-page-prev.gif" alt="이전 블럭 이동" /></a>
			</c:if>
		</li>
		
		<li class="on">
			<c:forEach begin="${pvo.firstPageNaviNum }" end="${pvo.endPageNaviNum }" varStatus="idx">
				<c:set value="${pvo.firstPageNaviNum + (idx.count-1) }" var="page" />
				<c:if test="${page == 0}">
					<c:set value="1" var="page" />
				</c:if>
				<a href="#" onclick="return goPage('<c:out value='${page}' />'); return false;"
					<c:if test="${page == pvo.currentPage}">class="on"</c:if> title="${page } 페이지" class="page">${page}
				</a>
			</c:forEach>
		</li>
		<li class="none">
		<c:if test="${pvo.nextPage != 0 }">
			<a href="#" onclick="return goPage(${pvo.nextPage }); return false;" title="다음으로" class="next"><img src="/images/img/btn-page-next.gif" alt="다음 블럭 이동" /></a>
		</c:if>
		<c:if test="${pvo.allPageCount > 1 }">&nbsp;&nbsp;
			<a href="#" onclick="return goPage(${pvo.allPageCount }); return false;" title="맨뒤로" class="last"><img src="/images/img/btn-page-last.gif" alt="마지막 페이지로 이동" /></a>
		</c:if>
		</li>
	</ul>
</div>
