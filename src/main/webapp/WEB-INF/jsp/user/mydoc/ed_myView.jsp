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

<title>내문서 문서 상세보기</title>

<script type="text/javascript" src="<c:url value='/js/jquery-latest.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-cookie-plugin.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.blockUI.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/loading.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.alerts.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/user/mydoc.js' />"></script>
<script type="text/javascript">

</script>  
</head>

<body>


<!-- container // -->
		<div class="Container">
			<div class="contTit CompanyTit">
				<h2><img src="${pageContext.request.contextPath}/images/img/tit-pdfdoc_my.gif" alt="PDF내문서" /></h2>
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
									<p><img src="${pageContext.request.contextPath}/images/img/mydoclist_img.jpg" alt="PDF내문서상세보기" /></p>
								</div>
								<div class="serviceHeaderCont2">
									<h3><img src="${pageContext.request.contextPath}/images/img/title-myview.gif" alt="PDF문서목록보기" /></h3>
									<p>PDF 문서에 대한 정보를 자세히 보실 수 있습니다.</p>
								</div>
							</div><!--// serviceHeader-->
					<!-- 표 시작 -->
					<div class="mat30 tableSt04 Maplist">
						<form id="detailForm" name="detailForm" method="post" action="/user/myDocView.do">
					  		<input type="hidden" id="docSeq" name="docSeq" value="<c:out value='${rvo.docSeq }'/>"/>
					  		<input type="hidden" id="partySeq" name="partySeq" value="${rvo.partySeq }" />
					  		<input type="hidden" id="titIf" name="titIf" value="<c:out value='${dvo.titIf }' />" />
					  		<input type="hidden" id="articleId" name="articleId" value="0" />
					  		<input type="hidden" id="savepathIf" name="savepathIf" value="<c:out value='${rfvo.savepathIf }' />" />
							<input type="hidden" id="savefileNm" name="savefileNm" value="<c:out value='${rfvo.savefileNm }' />" />
						
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
<!--  						<p style=" padding:5px 0; text-align:right;border-top:1px solid #7892c5;border-bottom:1px solid #d9d9d9;"><input type="text" size="30" maxlength="30">
 						&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/img/bt_search2.gif" align="absmiddle" alt="자료검색"></p>  -->

							<table summary="문서상세정보"  class="recruitBoardList borderList">
								<colgroup>
									<col width="15%" /><col width="25%" /><col width="20%" /><col width="20%" />
								</colgroup>
								<tbody>
									<tr>
										<th>등록자</th>
										<td class="last"><div><c:out value='${rvo.userNm }'/></div></td>
										<th class="last">등록일</th>
										<td class="last"><div><c:out value="${fn:substring(rvo.fregDt, 0, 10) }" /></div></td>
																											
								    </tr>								
									<tr>
										<th>다운로드횟수</th>
										<td class="last"><div><c:out value='${rvo.downCnt }'/></div></td>
										<th class="last">문서조회수</th>
										<td class="last"><div><c:out value='${rvo.viewCnt }'/></div></td>

								    </tr>
									<tr>
										<th>카테고리</th>
										<td colspan="3" class="alignLlast"><c:out value='${rvo.catNm }'/></td>                                        
									</tr>
									<tr>
										<th>파일명</td>
										<td colspan="3" class="alignLlast"><div>
											<a href="#" onclick="downLoadFile('${rfvo.articleId}'); return false;">
						 						<c:out value='${rfvo.orgfileNm }' />
						 					</a></td>                                        
									</tr>
									<tr>
										<th>제목</td>
										<td colspan="3" class="alignLlast"><c:out value='${rvo.titIf }'/></td>                                        
									</tr>									
									<tr>
										<th>작성자</th>
										<td class="last"><div><c:out value='${rvo.writmanNm }'/></div></td>                                        
										<th class="last"><div>문서작성일</th>                                        
										<td class="last"><div><c:out value='${fn:substring(rvo.metafregDt,0, 10) }'/></div></td>                                        																
									</tr>
									<tr>
										<th>주제</th>
										<td colspan="3" class="alignLlast"><c:out value='${rvo.sbjNt }'/></td>                                        
									</tr>
									<tr class="bottom">
										<th>키워드</th>
										<td colspan="3" class="alignLlast"><c:out value='${rvo.keywordIf }'/></td>                                        
									</tr>																						
								</tbody>
							</table>	</form>	
						</div>								
						<p style=" padding-top:15px; text-align:right;">
							<img src="${pageContext.request.contextPath}/images/img/bt_delete.gif" alt="문서삭제" style=" cursor:hand" id="btn_del" onclick="docDel('${rvo.docSeq }', '<c:out value='${rfvo.articleId }' />' ); return false;">&nbsp;&nbsp;
							<img src="${pageContext.request.contextPath}/images/img/bt_edit.gif" alt="문서수정" style=" cursor:hand" id="btn_upt" onclick="docUpt('${rvo.docSeq }'); return false;">&nbsp;&nbsp;
							<img src="${pageContext.request.contextPath}/images/img/bt_list.gif" alt="목록" style=" cursor:hand" id="btn_list" onclick="docList(); return false;" >
						</p>		
					
						<div class="serviceBox2">							
							<table summary="회원정보 입력" class="recruitBoardList borderList2">
								<colgroup>
									<col width="20%" /><col width="65%" /><col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th colspan="3">의견 보기 </th>
									</tr>
									<c:choose>
					 					<c:when test="${empty suggestList}">
						 					<tr>
					 							<td colspan="3">등록된 의견이 없습니다.</td>
						 					</tr>
					 					</c:when>
					 					<c:otherwise>
					 						<c:forEach items="${suggestList }" var="item" varStatus="stat">
					 							<tr>
					 								<td><c:out value='${item.regptNm }' /></td>
					 								<td><c:out value='${item.sgtDc }' /></td>
					 								<td class="last"><c:out value='${fn:substring(item.regTm, 0, 10) }' /></td>
					 							</tr>
					 						</c:forEach>
					 					</c:otherwise>
					 				</c:choose>
								</tbody>
							</table>		
						</div>							
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
	
	
	
 		<table>
 			<colgroup>
	 			<col width="20%" />
	 			<col width="60%" />
	 			<col width="20%" />
 			</colgroup>
 			<tr>
 				<th scope="row">의견 작성자</th>
 				<th scope="row">의견 내용</th>
 				<th scope="row">입력 날짜</th>
 			</tr>
 			<tbody>
 				
 			</tbody>
 		</table>

		<!-- content end -->
</body>
</html>