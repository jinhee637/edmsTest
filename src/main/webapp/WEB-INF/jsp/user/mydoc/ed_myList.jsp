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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/content.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/defaultAuto.css' />" media="screen" />

<title>내문서 목록</title>

<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/user/mydoc.js' />"></script>

</head>

<body>
	<div class="Wrap">
<!-- container // -->
		<div class="Container">
			<div class="contTit CompanyTit">
				<h2><img src="${pageContext.request.contextPath}/images/img/tit-pdfdoc_my.gif" alt="PDF문서목록보기" /></h2>
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
									<p><img src="${pageContext.request.contextPath}/images/img/mydoclist_img.jpg" alt="PDF내문서리스트" /></p>
								</div>
								<div class="serviceHeaderCont2">
									<h3><img src="${pageContext.request.contextPath}/images/img/title-mylist.gif" alt="PDF문서내목록보기" /></h3>
									<p>PDF 업로드가 가능합니다. </p>
								</div>
							</div><!--// serviceHeader-->
					<!-- 표 시작 -->
					<div class="serviceBox">
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
<!--  						<p style=" padding:5px 0; text-align:right;border-top:1px solid #7892c5;border-bottom:1px solid #d9d9d9;"><input type="text" size="30" maxlength="30">
 						&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/img/bt_search2.gif" align="absmiddle" alt="자료검색"></p>  -->
							<table summary="회원정보 입력" class="introTable3">
								<form:form commandName="dvo" id="searchForm" name="searchForm" method="post" action="/user/myDocView.do">
									<input type="hidden" id="docSeq" name="docSeq" value="${dvo.docSeq }"/>
									<input type="hidden" id="chk_tit" name="chk_tit" value="${dvo.titSearch }" />
									<input type="hidden" id="chk_writman" name="chk_writman" value="${dvo.writmanSearch }" />
									<input type="hidden" id="chk_sbj" name="chk_sbj" value="${dvo.sbjSearch }" />
									<input type="hidden" id="chk_keyword" name="chk_keyword" value="${dvo.keywordSearch }" />
									<input type="hidden" id="orderViewCnt" name="orderViewCnt" value="${dvo.orderViewCnt }"/>
									<input type="hidden" id="orderDownCnt" name="orderDownCnt" value="${dvo.orderDownCnt }" />
									<input type="hidden" id="orderDt" name="orderDt" value="${dvo.orderDt }"/>
									<colgroup>
										<col width="25%" /><col width="60%" /><col width="15%" />
									</colgroup>
									<tbody>
										<tr>							
											<th class="last">문서제목</th>
											<td class="last"><div><input type="text" id="titIf" name="titIf" size="60" value="${dvo.titIf }" onKeyDown="if(event.keyCode==13){ searchMyDoc(); return false;}" /></div></th>
											<td><div><img src="${pageContext.request.contextPath}/images/img/bt_search2.gif" align="absmiddle" alt="자료검색" id="btn_search" name="btn_search" onclick="searchMyDoc(); return false;" style="cursor:hand; "></div></th>
									    </tr>
									</tbody>
								</form:form>
							</table>	
						<div class="tot_bt">
						<div style="float:left ">
						<c:choose>
									<c:when test="${empty myDocList }">
										
											총 문서 수 : 0 개
										
									</c:when>
									<c:otherwise>
										
											총 문서 수 : ${pvo.allCount } 개
										
									</c:otherwise>
								</c:choose>	
						</div>
						<div style="float:right "><input type="button" style="background:url(${pageContext.request.contextPath}/images/img/bt_inquiry.gif) left top; background-repeat:no-repeat; width:72px; height:24px; border:0; cursor:hand; margin:2px 0 0 5px;" id="btn_viewCnt" name="btn_viewCnt"  onclick="fnOrderViewCnt(); return false;" />
												<input type="button" style="background:url(${pageContext.request.contextPath}/images/img/bt_down.gif) left top; background-repeat:no-repeat; width:94px; height:24px; border:0; cursor:hand; margin:2px 0 0 5px;" id="btn_downCnt" name="btn_downCnt" onclick="fnOrderDownCnt(); return false;" />
												<input type="button" style="background:url(${pageContext.request.contextPath}/images/img/bt_update.gif) left top; background-repeat:no-repeat; width:72px; height:24px; border:0; cursor:hand; margin:2px 0 0 5px;"  id="btn_dt" name="btn_dt" onclick="fnOrderDt(); return false;" /></div>
						</div>
						<div class="mat30 tableSt04 Maplist" style="margin-top:20px;">								
							<table summary="문서 리스트, 제목, 부서명, 등록일, 조회, 다운로드"  class="recruitBoardList borderList">
							<thead>
								<colgroup>
									<col width="35%" />
									<col width="22%" />
									<col width="15%" />
									<col width="18%" />
									<col width="5%" />
									<col width="5%" />
								</colgroup>
								<tr>
									<th class="bor">문서제목</th>
									<th class="bor">부서명</th>
									<th class="bor">작성자</th>
									<th class="bor">등록일</th>
									<th class="bor">조회</th>
									<th class="last">다운로드</th>																												
								</tr>		
								</thead>
									<tbody>						
									<c:choose>
										<c:when test="${empty myDocList}">
											<tr>
												<td colspan="6" class="last"><div>등록된 문서가 없습니다.</div></td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:set var="calcIndexNum" value="${pvo.allCount - ((pvo.currentPage-1)*pvo.articlePerPage) }" />
											<c:forEach items="${ myDocList}" var="item" varStatus="stat">
												<tr>
													<td class="bor"><a href="#" onclick="docView('<c:out value='${item.docSeq }' />'); return false;"><c:out value="${item.titIf }"></c:out></a></td>
													<td class="bor"><div><c:out value="${item.deptNm }"></c:out></div></td>
													<td class="bor"><div><c:out value="${item.writmanNm }"></c:out></div></td>
													<td class="bor"><div>
														<c:set var="fregDt" value="${item.fregDt }" /> 
														<c:out value="${fn:substring(fregDt, 0, 10) }" /></div>
													</td>
													<td class="bor"><div><c:out value="${item.viewCnt }"></c:out></div></td>
													<td class="last"><div><c:out value="${item.downCnt }"></c:out></div></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>																						
								</tbody>
							</table>		
							
						</div>		
						<pageNavi:pageNavigation formName="searchForm" pvo="${pvo }" />
<!-- 							<p style=" padding-top:20px; text-align:right;"><img src="${pageContext.request.contextPath}/images/img/bt_regist.gif"></p>		 -->																		
						</div><!-- 표 끝 -->
						</div>
					</div>
				</div>
				<!-- // content -->
				
				<!-- 오른쪽 -->
<div class="DimArea notScroll">
<!-- 	<div class="ScrollBox">
 		<ul class="Promotion">
		        <li class="box"><a href="http://www.kogas.or.kr" target="blank" ><img src="${pageContext.request.contextPath}/images/img/kogas_ban2.gif" alt="" /></a></li>              
		</ul> 
	</div> -->
<!-- 	<div class="Bg"></div> -->
<!--  	<div class="Opener">
		<span class="Click Pro-open" onclick="javascript:OpenPro();"><img src="/btn-promotion-open.gif" alt="Open"/></span>
		<a class="Click Pro-close" href="#" onclick="javascript:ClosePro();"><img src="/btn-promotion-close.gif" alt="Close"/></a>
		<a href="#"><img src="/btn-content-top.gif" alt="top으로"/></a>
	</div> --> 
</div>
		<!-- 메뉴끝 -->	
</div>
</body>
</html>
