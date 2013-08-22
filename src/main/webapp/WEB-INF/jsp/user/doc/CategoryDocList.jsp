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

<title>카테고리별 문서 목록보기</title>

<script type="text/javascript" src="<c:url value='/js/jquery-latest.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-cookie-plugin.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.blockUI.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/loading.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.alerts.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/user/doc.js' />"></script>
<script type="text/javascript">
	function fnOrderViewCnt(){
		$('#orderViewCnt').val("on");
		$('#orderDownCnt').val("off");
		$('#orderDt').val("off");
		$('#searchForm').attr('action','/user/categoryDocList.do');
		$('#searchForm').submit();
	};
	
	function fnOrderDownCnt(){
		$('#orderViewCnt').val("off");
		$('#orderDownCnt').val("on");
		$('#orderDt').val("off");
		$('#searchForm').attr('action','/user/categoryDocList.do');
		$('#searchForm').submit();
	};
	
	function fnOrderDt(){
		$('#orderViewCnt').val("off");
		$('#orderDownCnt').val("off");
		$('#orderDt').val("on");
		$('#searchForm').attr('action','/user/categoryDocList.do');
		$('#searchForm').submit();
	};
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
									<p><img src="${pageContext.request.contextPath}/images/img/doclist_img.jpg" alt="PDF문서리스트" /></p>
								</div>
								<div class="serviceHeaderCont2">
									<h3><img src="${pageContext.request.contextPath}/images/img/title-categorydoc.gif" alt="카테고리문서목록보기" /></h3>
									<p>카테고리 문서 목록입니다. 조회순, 다운로드순, 등록일순 조회가 가능합니다.</p>
								</div>
							</div><!--// serviceHeader-->
					<!-- 표 시작 -->
					<div class="serviceBox">
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
<!--  						<p style=" padding:5px 0; text-align:right;border-top:1px solid #7892c5;border-bottom:1px solid #d9d9d9;"><input type="text" size="30" maxlength="30">
 						&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/img/bt_search2.gif" align="absmiddle" alt="자료검색"></p>  -->
							<table summary="회원정보 입력" class="introTable3">
								<form:form commandName="dvo" id="searchForm" name="searchForm" method="post">
									<input type="hidden" id="docSeq" name="docSeq" value="<c:out value='${dvo.docSeq }' />" />
									<input type="hidden" id="gubun" name="gubun" value="category" />
									<input type="hidden" id="orderViewCnt" name="orderViewCnt" value="<c:out value='${dvo.orderViewCnt }' />" />
									<input type="hidden" id="orderDownCnt" name="orderDownCnt" value="<c:out value='${dvo.orderDownCnt }' />" />
									<input type="hidden" id="orderDt" name="orderDt" value="<c:out value='${dvo.orderDt }' />" />
									<input type="hidden" id="bizrole_cd" name="bizrole_cd" value="<c:out value='${lvo.bizrole_cd }' />" />
									<input type="hidden" id="catSeq" name="catSeq" value="<c:out value='${dvo.catSeq }' />" />
									<input type="hidden" id="sug" name="sug" value="N" />
									
									<colgroup>
										<col width="20%" /><col width="66%" /><col width="14%" />
									</colgroup>
									<tbody>
										<tr>						
											<th class="last">문서제목</th>
											<td class="last"><div><input type="text" id="titIf" name="titIf" onKeyDown="if(event.keyCode==13){ searchCategoryDoc(); return false;}" value="<c:out value='${dvo.titIf }'/>" size="60" maxlength="50"  class="input_f"/></div></td>
											<td><div><img src="${pageContext.request.contextPath}/images/img/bt_search2.gif" align="absmiddle" alt="자료검색" id="btn_search" name="btn_search" onclick="searchCategoryDoc(); return false;"  style="cursor:hand; padding-top:2px" ></div></th>																						
									    </tr>	
										<tr>
									</tbody>
								</form:form>
							</table>	
					<div class="tot_bt">
						<div style="float:left ">
								<c:choose>
									<c:when test="${empty categoryDocList }">
										총 문서 수 : 0 개
									</c:when>
									<c:otherwise>
										총 문서 수 : ${pvo.allCount } 개
									</c:otherwise>
								</c:choose>
							</div>	
							<div style="float:right "><input type="button" style="background:url(${pageContext.request.contextPath}/images/img/bt_inquiry.gif) left top; background-repeat:no-repeat; width:72px; height:26px; border:0; cursor:hand; margin:2px 0 0 5px;" id="btn_viewCnt" name="btn_viewCnt"  onclick="fnOrderViewCnt(); return false;" />
										<input type="button" style="background:url(${pageContext.request.contextPath}/images/img/bt_down.gif) left top; background-repeat:no-repeat; width:94px; height:26px; border:0; cursor:hand; margin:2px 0 0 5px;" id="btn_downCnt" name="btn_downCnt" onclick="fnOrderDownCnt(); return false;" />
										<input type="button" style="background:url(${pageContext.request.contextPath}/images/img/bt_update.gif) left top; background-repeat:no-repeat; width:72px; height:26px; border:0; cursor:hand; margin:2px 0 0 5px;"  id="btn_dt" name="btn_dt" onclick="fnOrderDt(); return false;" /></div>
						</div>	
						
						<div class="mat30 tableSt04 Maplist" style="margin-top:20px;">										
							<table summary="문서 리스트, 제목, 부서명, 등록일, 조회, 다운로드" class="introTable3">
							<thead>
								<colgroup>
									<col width="35%" /><col width="22%" /><col width="15%" /><col width="18%" /><col width="5%" /><col width="5%" />
								</colgroup>
									<tr>
										<th class="bor">문서제목</th>
										<th class="bor">등록일</th>
										<th class="bor">부서명</th>
										<th class="bor">등록자</th>
										<th class="bor">조회</th>
										<th class="last">다운로드</th>																												
								    </tr>	
								</thead>		
								<tbody>									
								    <c:choose>
										<c:when test="${empty  categoryDocList}">
											<tr>
												<td colspan="6"><div>등록된 문서가 없습니다.</div></td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:set var="calcIndexNum" value="<c:out value='${pvo.allCount - ((pvo.currentPage-1)*pvo.articlePerPage) }'/>" />
											<c:forEach items="${ categoryDocList}" var="item" varStatus="stat">
												<tr>
													<td class="bor"><div><a href="#" onclick="docView('<c:out value='${item.docSeq }' />'); return false;"><c:out value='${item.titIf }' /></a></div></td>
													<td class="bor"><div><c:set var="fregDt" value="${item.fregDt }" /> 
														<c:out value="${fn:substring(fregDt, 0, 10) }" /></div></td>
													<td class="bor"><div><c:out value='${item.deptNm }' /></div></td>
													<td class="bor"><div><c:out value='${item.userNm }' /></div></td>
													<td class="bor"><div><c:out value='${item.viewCnt }' /></div></td>
													<td class="last"><div><c:out value='${item.downCnt }' /></div></td>
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

