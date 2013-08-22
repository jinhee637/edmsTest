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

<title>사용자 문서 상세 보기</title>

<script type="text/javascript" src="<c:url value='/js/jquery-latest.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-cookie-plugin.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.blockUI.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/loading.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.alerts.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/user/doc.js' />"></script>
<script type="text/javascript">
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
				<c:choose>	
					<c:when test='${lvo.bizrole_cd == "ADMIN" }'>			
						<ul class="location">
							<li class="home">[<c:out value="${lvo.id_if}"></c:out>]입니다.</li>  
							<li class="user"><a href="${pageContext.request.contextPath }/com/actionLogout.do" target="_top">로그아웃</a></li>				  
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="location">
							<li class="home">[<c:out value="${lvo.id_if}"></c:out>]입니다.</li>  
							<li class="uie"><a href="${pageContext.request.contextPath }/user/forUpdateUser.do"  target="content">사용자정보수정</a></li>
							<li class="user"><a href="${pageContext.request.contextPath }/com/actionLogout.do" target="_top">로그아웃</a></li>				  
						</ul>
					</c:otherwise>
				</c:choose>
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
									<p>문서에 대한 정보를 자세히 보실 수 있습니다.</p>
								</div>
							</div><!--// serviceHeader-->
					<!-- 표 시작 -->
					<div class="mat30 tableSt04 Maplist">
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
<!--  						<p style=" padding:5px 0; text-align:right;border-top:1px solid #7892c5;border-bottom:1px solid #d9d9d9;"><input type="text" size="30" maxlength="30">
 						&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/img/bt_search2.gif" align="absmiddle" alt="자료검색"></p>  -->

							<table summary="문서상세정보"  class="recruitBoardList borderList">
								<form id="detailForm" name="detailForm" method="post" action="/user/docView.do" >
									<input type="hidden" id="allSearch" name="allSearch" value="<c:out value='${dvo.allSearch }' />" />
									<input type="hidden" id="all" name="all" value="<c:out value='${dvo.all }' />" />
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
									<input type="hidden" id="catSeq" name="catSeq" value="<c:out value='${dvo.catSeq }' />" />
									<input type="hidden" id="articleId" name="articleId" value="0" />
									<input type="hidden" id="docSeq" name="docSeq" value="<c:out value='${rvo.docSeq }' />" />
									<colgroup>
										<col width="20%" />
										<col width="30%" />
										<col width="20%" />
										<col width="30%" />
									</colgroup>
									<tbody>
										<tr>
											<th>등록자</th>
											<td class="last"><div><c:out value='${rvo.userNm }' /></div></td>
											<th class="last">등록일</th>
											<td class="last"><div><c:out value="${fn:substring(rvo.fregDt, 0, 10) }" /></div></td>
																												
									    </tr>								
										<tr>
											<th>다운로드횟수</th>
											<td class="last"><div><c:out value='${rvo.downCnt }' /></div></td>
											<th class="last">문서조회수</th>
											<td class="last"><div><c:out value='${rvo.viewCnt }' /></div></td>
	
									    </tr>
										<tr>
											<th>카테고리</th>
											<td colspan="3" class="alignLlast"><c:out value='${rvo.catNm }' /></td>                                        
										</tr>
										<tr>
											<th>파일명</td>
											<td colspan="3" class="alignLlast"><a href="#" onclick="downLoadFile('${rfvo.articleId}'); return false;">
		 											<c:out value='${rfvo.orgfileNm }' />
		 										</a></td>                                        
										</tr>
										<tr>
											<th>제목</td>
											<td colspan="3" class="alignLlast"><div><c:out value='${rvo.titIf }' /></div></td>                                        
										</tr>									
										<tr>
											<th>작성자</th>
											<td class="last"><div><c:out value='${rvo.writmanNm }' /></div></td>                                        
											<th class="last"><div>문서작성일</th>                                        
											<td class="last"><div><c:out value='${fn:substring(rvo.metafregDt,0,10) }' /></div></td>                                        																
										</tr>
										<tr>
											<th>주제</th>
											<td colspan="3" class="alignLlast"><div><c:out value='${rvo.sbjNt }' /></div></td>                                        
										</tr>
										<tr class="bottom">
											<th>키워드</th>
											<td colspan="3" class="alignLlast"><div><c:out value='${rvo.keywordIf }' /></div></td>                                        
										</tr>																						
									</tbody>
								</form>
							</table>		
						</div>								
						<p style=" padding-top:15px; text-align:right;"><img src="${pageContext.request.contextPath}/images/img/bt_list.gif" alt="목록" id="btn_list" onclick="docList('<c:out value='${dvo.gubun }' />' ); return false;" style="cursor:hand"></p>		
																				
						<div class="serviceBox2">							
							<table summary="회원정보 입력" class="recruitBoardList borderList2">
								<colgroup>
									<col width="20%" /><col width="65%" /><col width="15%" />
								</colgroup>
								<tbody>
									<form id="sgtForm" name="sgtForm" method="post" action="/user/suggestInsert.do" >
										<input type="hidden" id="allSearch" name="allSearch" value="<c:out value='${dvo.allSearch }' />" />
										<input type="hidden" id="all" name="all" value="<c:out value='${dvo.all }' />" />
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
										<input type="hidden" id="catSeq" name="catSeq" value="<c:out value='${dvo.catSeq }' />" />
							 			<input type="hidden" id="docSeq" name="docSeq" value="<c:out value='${rvo.docSeq }' />" />
								 		<input type="hidden" id="regptNm" name="regptNm" value="<c:out value='${lvo.user_nm }' />" />
										<input type="hidden" id="regptSeq" name="regptSeq" value="<c:out value='${lvo.party_seq }' />" />
										<input type="hidden" id="gubun" name="gubun" value="<c:out value='${dvo.gubun }' />" />
										<input type="hidden" id="sug" name="sug" value="<c:out value='${dvo.sug }' />" />
										<input type="hidden" id="bizrole_cd" name="bizrole_cd" value="<c:out value='${lvo.bizrole_cd }' />" />
										<c:choose>
							 				<c:when test='${lvo.bizrole_cd == "ADMIN" }'>
							 					<tr>
							 						<td colspan="3" class="last">관리자는 의견을 달을 수 없습니다.</td> 
							 					</tr>
							 				</c:when>
							 				<c:otherwise>
												<tr>
													<th>의견 작성 </th>
													<td class="last"><input id="sgtDc" name="sgtDc" type="text" size="70" maxlength="70" class="input_f"></td>                                        
												    <td class="last"><img src="${pageContext.request.contextPath}/images/img/bt_enter.gif" id="btn_sgt" name="btn_sgt" onclick="suggestInsert(); return false;" style="cursor:hand " /></td>
												</tr>
							 				</c:otherwise>
							 			</c:choose>
									</form>
									<c:choose>
					 					<c:when test="${empty suggestList}">
						 					<tr>
					 							<td colspan="3">등록된 의견이 없습니다.</td>
						 					</tr>
					 					</c:when>
					 					<c:otherwise>
					 						<c:forEach items="${suggestList }" var="item" varStatus="stat">
					 							<tr>
					 								<th><c:out value='${item.regptNm }' /></th>
					 								<td><div><c:out value='${item.sgtDc }' /></div></td>
					 								<td class="last"><c:out value='${fn:substring(item.regTm, 0, 10) }' /></td>
					 							</tr>
					 						</c:forEach>
					 					</c:otherwise>							
									</c:choose>																					
								</tbody>
							</table>
							
							<br /><br />
					 		
					 		<object type="application/pdf" data="http://kibi2013.codns.com:7075/upload/<c:out value='${rfvo.savefileNm }' />" width="770" height="600" >
								<param name="src" value="http://kibi2013.codns.com:7075/upload/<c:out value='${rfvo.savefileNm }' />" />
							</object>	
								
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
		
