<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="pageNavi" tagdir="/WEB-INF/tags" %>
<html lang="ko">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/common.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/content.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/defaultAuto.css" media="screen" />
<script type="text/javascript" src="<c:url value='/js/jquery-latest.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-cookie-plugin.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.blockUI.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/loading.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.alerts.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/admin/doc.js' />"></script>
<script type="text/javascript">
	$(function(){
			// 체크 값 세팅 start
			if($('#chk_tit').val() == "Y"){
				$('#titSearch').attr('checked', true);
			}else{
				$('#titSearch').attr('checked', false);
				$('#titIf').val("");
			}
			
			if($('#chk_writman').val() == "Y"){
				$('#writmanSearch').attr('checked', true);
			}else{
				$('#writmanSearch').attr('checked', false);
				$('#writmanNm').val("");
			}
			
			if($('#chk_sbj').val() == "Y"){
				$('#sbjSearch').attr('checked', true);
			}else{
				$('#sbjSearch').attr('checked', false);
				$('#sbjNt').val("");
			}
			
			if($('#chk_keyword').val() == "Y"){
				$('#keywordSearch').attr('checked', true);
			}else{
				$('#keywordSearch').attr('checked', false);
				$('#keywordIf').val("");
			}
			// 체크 값 세팅 end
		});
</script>
</head>

<body>
 <!-- container start -->
		<div class="Container">
			<div class="contTit CompanyTit">
				<h2><img src="${pageContext.request.contextPath}/images/img/tit-pdfdoc.gif" alt="PDF문서목록보기" /></h2>
<!-- 				<p></p> -->
</div>
			<div class="ContentArea">
			
				<!-- location // -->				
				<%@ include file="/WEB-INF/jsp/com/inc_location.jsp" %>
				<!-- // location -->
				<!-- content // -->
				<div class="content" id="content">
					<div class="serviceWrap">
						<div class="serviceContentWrap">
							<div class="serviceHeader">
								<div class="serviceHeaderImg">
									<p><img src="${pageContext.request.contextPath}/images/img/doclist_img.jpg" alt="PDF문서리스트" /></p>
								</div>
								<div class="serviceHeaderCont2">
									<h3><img src="${pageContext.request.contextPath}/images/img/title-doclist.gif" alt="PDF문서목록보기" /></h3>
									<p>PDF 업로드가 가능합니다. </p>
								</div>
							</div><!--// serviceHeader-->
					<!-- 검색 시작 -->
					<div class="serviceBox">					
						<!-- content start -->
						<form:form commandName="dvo" id="searchForm" name="searchForm" method="post" action="/admin/docView.do">
							<input type="hidden" id="docSeq" name="docSeq" value="<c:out value='${dvo.docSeq }'/>" />
							<input type="hidden" id="chk_tit" name="chk_tit" value="<c:out value='${dvo.titSearch }' />" />
							<input type="hidden" id="chk_writman" name="chk_writman" value="<c:out value='${dvo.writmanSearch }' />" />
							<input type="hidden" id="chk_sbj" name="chk_sbj" value="<c:out value='${dvo.sbjSearch }' />" />
							<input type="hidden" id="chk_keyword" name="chk_keyword" value="<c:out value='${dvo.keywordSearch }' />" />
							<input type="hidden" id="allSearch" name="allSearch" value="<c:out value='${dvo.allSearch }' />" />
							<table summary="회원정보 입력"  class="introTable3">
								<colgroup>
									<col width="5%" />
									<col width="15%" />
									<col width="67%" />
									<col width="13%" />
								</colgroup>
								<thead>
									<tr>
										<th class="bor">선택</th>
										<th class="bor">metadata</td>
										<th class="bor">검색 단어 입력</td>
										<th>검색</th>																						
								    </tr>	
								</thead>
								<tbody>
								<tr>
										<td class="bor"></td>
										<td class="bor"><div>통합검색</div></td>
										<td class="bor"><div><input type="text" id="all" size="60" name="all" value="<c:out value='${dvo.all }' />" onKeyDown="if(event.keyCode==13){ searchDoc(); return false;}" /></div></td>
										<td><div><input type="button" style="background:url(${pageContext.request.contextPath}/images/img/bt_search3.gif) left top; background-repeat:no-repeat; width:42px; height:20px; border:0;cursor:hand;" id="btn_search" name="btn_search"  onclick="searchDoc(); return false;" /></div></td>		
								</tr>			
								<tr>
										<td class="bor"><div><input type="checkbox" id="titSearch"  name="titSearch" value="Y"></div></td>
										<td class="bor"><div>제목</div></td>
										<td class="bor"><div><input type="text" id="titIf" name="titIf" size="60" value="<c:out value='${dvo.titIf }' />" onKeyDown="if(event.keyCode==13){ searchDoc(); return false;}" title="문서 제목 입력" /></div></td>
										<td><div><input type="button" id="btn_search" style="background:url(${pageContext.request.contextPath}/images/img/bt_search3.gif) left top; background-repeat:no-repeat; width:42px; height:20px; border:0;cursor:hand;" name="btn_search"  onclick="searchDoc(); return false;" /></div></td>		
								</tr>	
								<tr>
										<td class="bor"><div><input type="checkbox" id="writmanSearch" name="writmanSearch" value="Y"></div></td>
										<td class="bor"><div>작성자</div></td>
										<td class="bor"><div><input type="text" id="writmanNm"size="60" name="writmanNm" value="<c:out value='${dvo.writmanNm }' />" onKeyDown="if(event.keyCode==13){ searchDoc(); return false;}" /></div></td>
										<td><div><input type="button" id="btn_search" style="background:url(${pageContext.request.contextPath}/images/img/bt_search3.gif) left top; background-repeat:no-repeat; width:42px; height:20px; border:0;cursor:hand;" name="btn_search"  onclick="searchDoc(); return false;" /></div></td>		
								</tr>			
								<tr>
										<td class="bor"><div><input type="checkbox" id="sbjSearch" name="sbjSearch" value="Y"></div></td>
										<td class="bor"><div>주제</div></td>
										<td class="bor"><div><input type="text" id="sbjNt"size="60" name="sbjNt" value="<c:out value='${dvo.sbjNt }' />" onKeyDown="if(event.keyCode==13){ searchDoc(); return false;}" /></div></td>
										<td><div><input type="button" id="btn_search" style="background:url(${pageContext.request.contextPath}/images/img/bt_search3.gif) left top; background-repeat:no-repeat; width:42px; height:20px; border:0;cursor:hand;" name="btn_search"  onclick="searchDoc(); return false;" /></div></td>		
								</tr>	
								<tr>
										<td class="bor"><div><input type="checkbox" id="keywordSearch" name="keywordSearch" value="Y"></div></td>
										<td class="bor"><div>키워드</div></td>
										<td class="bor"><div><input type="text" id="keywordIf"size="60" name="keywordIf" value="<c:out value='${dvo.keywordIf }' />" onKeyDown="if(event.keyCode==13){ searchDoc(); return false;}" /></div></td>
										<td><div><input type="button" id="btn_search" style="background:url(${pageContext.request.contextPath}/images/img/bt_search3.gif) left top; background-repeat:no-repeat; width:42px; height:20px; border:0;cursor:hand;" name="btn_search"  onclick="searchDoc(); return false;" /></div></td>		
								</tr>		
								<tr>
									<td height="38" colspan="3"></td>
									<td><div>&nbsp;&nbsp;&nbsp;<input type="button" style="background:url(${pageContext.request.contextPath}/images/img/bt_search_all.gif) left top; background-repeat:no-repeat; width:81px; height:24px; border:0; padding:0;cursor:hand; margin:2px 0 0 5px;" id="btn_all" name="btn_all" onclick="allDoc(); return false;" /></div></td>									
								</tr>																																		
							</table>							

						</form:form>
						<!-- 검색 끝-->
						<!--  -->
						<div class="tot_bt">
							<div style=" float:left">
								<c:choose>
								<c:when test="${empty docList }">
									
										총 문서 수 : 0 개
										
								</c:when>
								<c:otherwise>
									
										총 문서 수 : ${pvo.allCount } 개
										
								</c:otherwise>
							</c:choose></div>
							
							<div style=" float:right">
							<input type="hidden" id="orderViewCnt" name="orderViewCnt" value="<c:out value='${dvo.orderViewCnt }' />" />
							<input type="hidden" id="orderDownCnt" name="orderDownCnt" value="<c:out value='${dvo.orderDownCnt }' />" />
							<input type="hidden" id="orderDt" name="orderDt" value="<c:out value='${dvo.orderDt }' />" />
							<input type="button" style="background:url(${pageContext.request.contextPath}/images/img/bt_inquiry.gif) left top; background-repeat:no-repeat; width:75px; height:25px; border:0;cursor:hand; margin:3px 0 0 6px;" id="btn_viewCnt" name="btn_viewCnt"  onclick="fnOrderViewCnt(); return false;" />
							<input type="button" style="background:url(${pageContext.request.contextPath}/images/img/bt_down.gif) left top; background-repeat:no-repeat; width:96px; height:25px; border:0; padding:0;cursor:hand; margin:3px 0 0 6px;" id="btn_downCnt" name="btn_downCnt" onclick="fnOrderDownCnt(); return false;" />
							<input type="button" style="background:url(${pageContext.request.contextPath}/images/img/bt_update.gif) left top; background-repeat:no-repeat; width:73px; height:25px; border:0; padding:0;cursor:hand; margin:3px 0 0 6px;"  id="btn_dt" name="btn_dt" onclick="fnOrderDt(); return false;" />
										</div>
							</div>
											
						<!--  -->
						<div class="mat30 tableSt04 Maplist" style="margin-top:20px;">								
							<table summary="문서 리스트, 제목, 부서명, 등록일, 조회, 다운로드" class="introTable3">
			          				<thead>
									 <colgroup>
										<col width="30%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="5%" />
										<col width="5%" />
								    </colgroup>
			          					<tr>
			          						<th scope="col" class="bor">문서 제목</th>
			          						<th scope="col" class="bor">부서명</th>
			          						<th scope="col" class="bor">작성자</th>
			          						<th scope="col" class="bor">등록일</th>
			          						<th scope="col" class="bor">등록위치</th>
			          						<th scope="col" class="bor">조회</th>
			          						<th scope="col" class="last">다운로드</th>
			          					</tr>
			          				</thead>
									<tbody>
									<c:choose>
										<c:when test="${empty  docList}">
											<tr>
												<td colspan="7"><div>등록된 문서가 없습니다.</div></td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:set var="calcIndexNum" value="<c:out value='${pvo.allCount - ((pvo.currentPage-1)*pvo.articlePerPage) }' />" />
											<c:forEach items="${ docList}" var="item" varStatus="stat">
												<tr>
													<td class="bor"><div><a href="#" onclick="docView('<c:out value="${item.docSeq }" />'); return false;"><c:out value='${item.titIf }' /></a></div></td>
													<td class="bor"><div><c:out value='${item.deptNm }' /></div></td>
													<td class="bor"><div><c:out value='${item.writmanNm }' /></div></td>
													<td class="bor"><div>
														<c:set var="fregDt" value="${item.fregDt }" /> 
														<c:out value="${fn:substring(fregDt, 0, 10) }" /></div>
													</td>
													<td class="bor"><div><c:out value='${item.catNm }' /></div></td>
													<td class="bor"><div><c:out value='${item.viewCnt }' /></div></td>
													<td class="last"><div><c:out value='${item.downCnt }' /></div></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>	
									</tbody>
	          			  </table>
          						<!-- content end -->
					  </div>
		 						<!-- // Paging -->	
								<pageNavi:pageNavigation formName="searchForm" pvo="${pvo }" />				
						  		<!-- Paging // -->
					</div>
				</div>
				  </div>
				</div>
					 <div class="DimArea notScroll">
					 </div>
        			<!-- container end -->
</body>
</html>