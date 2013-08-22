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
<!--  -->
<!--  -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/content.css' />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/defaultAuto.css' />" media="screen" />
<script type="text/javascript" src="<c:url value='/js/jquery-latest.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-cookie-plugin.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.blockUI.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/loading.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.alerts.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/admin/dept.js' />"></script>
</head>

<body>
        			<!-- container start -->
		<div class="Container">
			<div class="contTit CompanyTit">
				<h2><img src="/images/img/tit-info.gif" alt="회원정보" /></h2>
<!-- 				<p></p> -->
			</div>
			<div class="ContentArea">
			
				<!-- location // -->				
				<jsp:include page="/WEB-INF/jsp/com/inc_location.jsp"></jsp:include>
				<!-- // location -->
				<!-- content // -->
				<div class="content" id="content">
					<div class="serviceWrap">
						<div class="serviceContentWrap">
							<div class="serviceHeader">
								<div class="serviceHeaderImg">
									<p><img src="/images/img/doclist_img.jpg" alt="PDF문서리스트" /></p>
								</div>
								<div class="serviceHeaderCont2">
									<h3><img src="/images/img/title-group.gif" alt="그룹관리" /></h3>
									<p>그룹 관리 목록입니다.</p>
								</div>
							</div><!--// serviceHeader-->
				
				<!-- content start -->
				<div class="serviceBox">								
						<table summary="회원정보 입력" class="introTable3">
							<colgroup>
								<col width="10%" />
								<col width="28%" />															
								<col width="10%" />
								<col width="28%" />										
								<col width="12%" />								
								<col width="12%" />
							</colgroup>
							<tbody>
								<tr>
								<form:form commandName="dvo" id="insertForm" name="insertForm" method="post">
									<th><strong>부서명</strong></th>
									<td>&nbsp;<input type="text" id="deptNm" name="deptNm" maxlength="50" value="" class="input_f" size="25" style=" margin:0"/>&nbsp;&nbsp;</td>	
									<th><strong>설명</strong></th>
									<td>&nbsp;<input type="text" id="deptDc" name="deptDc" maxlength="100" value="" class="input_f" size="25"/></td>	
									<td><input type="button" style="background:url(/images/img/bt_regist2.gif) left top; background-repeat:no-repeat; width:54px; height:21px; border:0;cursor:hand; margin:1px 0 -3px 0" id="btn_insert" name="btn_insert" onclick="insertDept(); return false;"></td>	
									</form:form>
									<form id="deleteForm" name="deleteForm" method="post">
										<input type="hidden" id="deptCd" name="deptCd" />
									</form>		
									<th><input type="button" style="background:url(/images/img/bt_useradmin.gif) left top; background-repeat:no-repeat; width:71px; height:24px; border:0;cursor:hand;" id="btn_goUser" name="btn_goUser" onclick="goUser(); return false;"></th>																					
								</tr>	
							</tbody>
						</table>		
						</div>	
						
						<div class="tot_bt">
							<c:choose>
								<c:when test="${empty deptList }">
									총 문서 수 : 0 개
								</c:when>
								<c:otherwise>
									총 문서 수 : ${pvo.allCount } 개
								</c:otherwise>
							</c:choose>		
						</div>
						
						<div class="mat30 tableSt04 Maplist" style="margin-top:10px;">					
							<table summary="회원정보 입력" class="recruitBoardList borderList">
						<colgroup>
							<col width="5%" />
							<col width="37%" />
							<col width="50%" />
							<col width="8%" />
						</colgroup>		
						<thead>
										
          					<tr>
          						<th scope="col">번호</th>
          						<th scope="col">그룹명</th>
          						<th scope="col">그룹설명</th>
          						<th scope="col" class="last">삭제</th>
          					</tr>
          					
  						</thead>
									<tbody>
									<c:choose>
										<c:when test="${empty  deptList}">
											<tr>
												<td>등록된 그룹이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:set var="calcIndexNum" value="<c:out value='${pvo.allCount - ((pvo.currentPage-1)*pvo.articlePerPage) }' />" />
											<c:forEach items="${ deptList}" var="item" varStatus="stat">
												<tr>
													<td><c:out value="${stat.index + 1 }" /></td>
													<td><c:out value="${item.deptNm }" /></td>
													<td><c:out value="${item.deptDc }" /></td>
													<td class="last"><input type="button" id="btn_del" name="btn_del" style="background:url(${pageContext.request.contextPath}/images/img/bt_del2.gif) left top; background-repeat:no-repeat; width:36px; height:21px; border:0;cursor:hand;"  onclick="deleteDept('<c:out value='${ item.deptSeq}' />'); return false;"/></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>	
									</tbody>			            			
			          			</table>
			          			<pageNavi:pageNavigation formName="insertForm" pvo="${pvo }" />
          						<!-- content end -->
          					</td>
          				</tr>
						</tbody>									
       				 </table>
        			<!-- container end -->
						</div>
		</div>		
<div class="DimArea notScroll">
<!-- 	<div class="ScrollBox">
 		<ul class="Promotion">
		        <li class="box"><a href="http://www.kogas.or.kr" target="blank" ><img src="/images/img/kogas_ban2.gif" alt="" /></a></li>              
		</ul> 
	</div> -->
<!-- 	<div class="Bg"></div> -->
<!--  	<div class="Opener">
		<span class="Click Pro-open" onclick="javascript:OpenPro();"><img src="/btn-promotion-open.gif" alt="Open"/></span>
		<a class="Click Pro-close" href="#" onclick="javascript:ClosePro();"><img src="/btn-promotion-close.gif" alt="Close"/></a>
		<a href="#"><img src="/btn-content-top.gif" alt="top으로"/></a>
	</div> --> 
</div>						
	</div>
</div>
</body>
</html>