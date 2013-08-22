<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html lang="ko">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/content.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/defaultAuto.css' />" media="screen" />

<link href="<c:url value='/css/jqueryui/base/jquery-ui.css' />" rel="stylesheet" />

<title>관리자 문서 수정</title>

<script type="text/javascript" src="<c:url value='/js/jquery-latest.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-cookie-plugin.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.blockUI.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/loading.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.alerts.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui-1.8.16.custom.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/admin/doc.js' />"></script>
<script type="text/javascript">
	$(function(){
		$('#metafregDt').datepicker({
			dateFormat:'yy-mm-dd',
			 showMonthAfterYear: true,
			 changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			 showOn: 'both', // both/button
			 yearRange: 'c-99:c+99'
		});
	});
</script>  
</head>

<body>
	<div class="Wrap">

<!-- container // -->
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
									<p><img src="${pageContext.request.contextPath}/images/img/docview_img.jpg" alt="PDF문서상세보기" /></p>
								</div>
								<div class="serviceHeaderCont2">
									<h3><img src="${pageContext.request.contextPath}/images/img/title-docview.gif" alt="PDF문서목록보기" /></h3>
									<p>PDF 문서에 대한 정보를 자세히 보실 수 있습니다.</p>
								</div>
							</div><!--// serviceHeader-->
					<!-- 표 시작 -->
					<div class="mat30 tableSt04 Maplist">
						<form id="uptForm" name="uptForm" method="post" action="/admin/docView.do">
					  		<input type="hidden" id="allSearch" name="allSearch" value="<c:out value='${dvo.allSearch }' />" />
							<input type="hidden" id="all" name="all" value="<c:out value='${dvo.all }' />" />
					  		<input type="hidden" id="docSeq" name="docSeq" value="<c:out value='${rvo.docSeq }' />" />
					  		<input type="hidden" id="savepathIf" name="savepathIf" value="<c:out value='${rfvo.savepathIf }' />" />
							<input type="hidden" id="savefileNm" name="savefileNm" value="<c:out value='${rfvo.savefileNm }' />" />
							<input type="hidden" id="orderViewCnt" name="orderViewCnt" value="<c:out value='${dvo.orderViewCnt }' />" />
							<input type="hidden" id="orderDownCnt" name="orderDownCnt" value="<c:out value='${dvo.orderDownCnt }' />" />
							<input type="hidden" id="orderDt" name="orderDt" value="<c:out value='${dvo.orderDt }' />" />
							<input type="hidden" id="titSearch" name="titSearch" value="<c:out value='${dvo.titSearch }' />" />
							<input type="hidden" id="writmanSearch" name="writmanSearch" value="<c:out value='${dvo.writmanSearch }' />" />
							<input type="hidden" id="sbjSearch" name="sbjSearch" value="<c:out value='${dvo.sbjSearch }' />" />
							<input type="hidden" id="keywordSearch" name="keywordSearch" value="<c:out value='${dvo.keywordSearch }' />" />
							<input type="hidden" id="titIf" name="titIf" value="<c:out value='${dvo.titIf }' />" />
							<input type="hidden" id="writmanNm" name="writmanNm" value="<c:out value='${dvo.writmanNm }' />" />
							<input type="hidden" id="sbjNt" name="sbjNt" value="<c:out value='${dvo.sbjNt }' />" />
							<input type="hidden" id="keywordIf" name="keywordIf" value="<c:out value='${dvo.keywordIf }' />" />
							
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
<!--  						<p style=" padding:5px 0; text-align:right;border-top:1px solid #7892c5;border-bottom:1px solid #d9d9d9;"><input type="text" size="30" maxlength="30">
 						&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/img/bt_search2.gif" align="absmiddle" alt="자료검색"></p>  -->

							<table summary="문서상세정보"  class="recruitBoardList borderList">
								<colgroup>
									<col width="20%" /><col width="30%" /><col width="20%" /><col width="30%" />
								</colgroup>
								<tbody>
									<tr>
										<th>등록자</th>
										<td class="last"><div><c:out value='${rvo.userNm }' /></div></td>
										<th class="last">등록일</th>
										<td class="last"><div><c:out value='${fn:substring(rvo.fregDt,0,10) }' /></div></td>
																											
								    </tr>								
									<tr>
										<th>다운로드횟수</th>
										<td class="last"><div><c:out value='${rvo.downCnt }' /></div></td>
										<th class="last">문서조회수</th>
										<td class="last"><div><c:out value='${rvo.viewCnt }' /></div></td>

								    </tr>
									<tr>
										<th>카테고리</th>
										<td colspan="3" class="last">
											<div><input type="hidden" id="catSeq" name="catSeq" value="<c:out value='${rvo.catSeq }' />"/>
							 					<input type="text" id="catNm" name="catNm" value="<c:out value='${rvo.catNm }' /> " OnKeyDown="this.blur(); return false;"  size="55"/>&nbsp;&nbsp;
							 					<input type="button" id="btn_goCatPop" onclick="goCatUpt(); return false;" style="background:url(${pageContext.request.contextPath}/images/img/bt_cate.gif) left top; border:0; width:79px; height:21px; cursor:hand"/>
							 				</div>
						 				</td>                                        
									</tr>
									<tr>
										<th>파일명</td>
										<td colspan="3" class="last"><div><c:out value='${rfvo.orgfileNm }' /></div></td>                                        
									</tr>
									<tr>
										<th>제목</td>
										<td colspan="3" class="last"><div><input type="text" id="uptTitIf" name="uptTitIf" value="<c:out value='${rvo.titIf }' />" maxlength="100" size="70"/></div></td>                                        
									</tr>									
									<tr>
										<th>작성자</th>
										<td class="last"><div><input type="text" id="uptWritmanNm" name="uptWritmanNm" value="<c:out value='${rvo.writmanNm }' />" maxlength="50" size="17"/></div></td>                                        
										<th class="last">문서작성일</th>                                        
										<td class="last"><div><input type="text" id="metafregDt" name="metafregDt" value="<c:out value='${rvo.metafregDt }' />" OnKeyDown="this.blur(); return false;" size="17"/></div></td>                                        																
									</tr>
									<tr class="bottom">
										<th>주제</th>
										<td class="last"><div><input type="text" id="uptSbjNt" name="uptSbjNt" value="<c:out value='${rvo.sbjNt }' />" maxlength="100" size="17"/></div></td>                                        
									<th class="last">키워드</th>
								      	<td class="last"><div><input type="text" id="uptKeywordIf" name="uptKeywordIf" value="<c:out value='${rvo.keywordIf }' />" maxlength="50" size="19"/></div></td>
									</tr>																			
								</tbody>
							</table>		
					  </form>
							<form id="popupForm" name="popupForm">
							</form>
						</div>								
						<p style=" padding-top:15px; text-align:right;">
							<img src="${pageContext.request.contextPath}/images/img/bt_edit.gif" alt="문서수정" id="btn_uptOk" onclick="docUptOk(); return false;" style="cursor:hand;">&nbsp;&nbsp;
							<img src="${pageContext.request.contextPath}/images/img/bt_cancel.gif" alt="취소" id="btn_cancel" onclick="docCancel(); return false;">
						</p>		
																				
						</div><!-- 표 끝 -->
						</div>
					</div>
				</div>
				<!-- // content -->
				
				<!-- 오른쪽 -->
<div class="DimArea notScroll">
</div>
		<!-- 메뉴끝 -->	
</div>
</body>
</html>
