<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ad_user_list.jsp
  * @Description : 관리자 사용자 리스트
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/common.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/content.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/defaultAuto.css" media="screen" />
<title>사용자관리리스트</title>
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/admin/user.js'/>"></script>
<title>Insert title here</title>
<script type="text/javascript" >
$(document).ready(
		function() {
			fnInit();
		}
);
</script>
</head>
<body>
<!-- <div class="Wrap"> -->
<!-- container // -->
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
									<p><img src="/images/img/user_img.jpg" alt="사용자관리" /></p>
								</div>
								<div class="serviceHeaderCont2">
									<h3><img src="/images/img/title-user.gif" alt="PDF사용자관리" /></h3>
									<p>사용자 관리 목록입니다.</p>
								</div>
							</div><!--// serviceHeader-->
				<!-- 표 시작 -->
				<div class="serviceBox">
				<form id="searchForm" name="searchForm" action ="<c:url value='/admin/userList.do'/>" method="post">
					<input type="hidden" id="message" name="message" value="${message}">
					<input type="hidden" id="pageIndex" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
					<input type="hidden" name="partystt_cd" id="partystt_cd"/>
					<input type="hidden" name="party_seq" id="party_seq" value="0" />
					<input type="hidden" name="docregaut_yn" id="docregaut_yn"/>							
					
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
<!--  						<p style=" padding:5px 0; text-align:right;border-top:1px solid #7892c5;border-bottom:1px solid #d9d9d9;"><input type="text" size="30" maxlength="30">
 						&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/img/bt_search2.gif" align="absmiddle" alt="자료검색"></p>  -->
							<table summary="회원정보 입력" class="introTable3">
								<colgroup>
									<col width="18%" />
									<col width="17%" />
									<col width="47%" />
									<col width="13%" />
								</colgroup>
								<tbody>
									<tr>
										<th class="last"><a href="${pageContext.request.contextPath}/admin/deptList.do" target="content"><img src="/images/img/bt_group.gif" alt="그룹관리" style=" margin-top:2px"></a></th>
										<td class="last">&nbsp;&nbsp;&nbsp;
											<select id="searchSel" name="searchSel" height="20">
												<option value="U" <c:if test="${searchVO.searchSel == 'U'}">selected="selected"</c:if>>회원성명</option>
												<option value="D" <c:if test="${searchVO.searchSel == 'D'}">selected="selected"</c:if>>부서명</option>
											</select>
										</td>
										<td class="last">
											<input type="text" id="searchWord" name="searchWord" size="50" value='<c:out value="${searchVO.searchWord}"/>' class="input_f"/>
										</td>
										<td><div><a href="#" onclick="$('#searchForm').submit();return false;"><img src="/images/img/bt_search2.gif" alt="회원검색" style=" margin-top:2px"></a></div></td>																						
								    </tr>	
								</tbody>
							</table>	
							</form>
							
							<div class="tot_bt">총${totalCnt}명</div>
							
						<div class="mat30 tableSt04 Maplist" style="margin-top:20px;">							
							<table summary="회원정보 입력" class="recruitBoardList borderList">
								<colgroup>
									<col width="20%" /><col width="15%" /><col width="20%" /><col width="21%" /><col width="12%" /><col width="12%" />
								</colgroup>
								<tbody>
					
									<tr>
										<th class="bor">사번</th>
										<th class="bor">성명</th>
										<th class="bor">직급</th>
										<th class="bor">부서</th>
										<th class="bor">문서업로드</th>
										<th class="last">상태</th>																												
								    </tr>
								    <c:choose>
										<c:when test="${empty  userList}">
											<tr>
												<td colspan="6"><div>등록된 사용자가 없습니다.</div></td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${userList}" var="item" varStatus="stat">								
													<tr>
														<td class="bor"><div><c:out value="${item.id_if }"></c:out></div></td>
														<td class="bor"><div><a href="#" onclick="viewUser('${item.party_seq }');"><c:out value="${item.user_nm }"></c:out></a></div></td>
														<td class="bor"><div><c:out value="${item.duty_if }"></c:out></div></td>
														<td class="bor"><div><c:out value="${item.dept_nm }"></c:out></div></td>
														<td class="bor">
															<div>
																<c:if test="${item.docregaut_yn=='Y'}">
																	<input type="button" style="background:url(/images/img/bt_yes.gif) left top; background-repeat:no-repeat; width:35px; height:20px; border:0;cursor:hand;" onclick="updateDocAuth('N','${item.party_seq }');"/>
																</c:if>
																<c:if test="${item.docregaut_yn=='N'}">
																	<input type="button" style="background:url(/images/img/bt_no.gif) left top; background-repeat:no-repeat; width:35px; height:20px; border:0;cursor:hand;" onclick="updateDocAuth('Y','${item.party_seq }');"/>
																</c:if>
															</div>
														</td>                                      
														<td class="last">
															<div>
																<select <c:if test="${item.partystt_cd == 'D'}">disabled="disabled""</c:if> onchange="updateStatus(this.value,'${item.party_seq }');">
																	<c:forEach items="${codeList}" var="citem" varStatus="stats">
																		<c:if test="${item.partystt_cd == 'Y'}">
																			<c:if test="${citem.dcode != 'N' && citem.dcode != 'W' }">
																				<option value="${citem.dcode}" <c:if test="${item.partystt_cd == citem.dcode}">selected="selected"</c:if>>${citem.dcode_nm }</option>
																			</c:if>		
																		</c:if>
																		<c:if test="${item.partystt_cd == 'W'}">
																			<c:if test="${citem.dcode != 'D' }">
																				<option value="${citem.dcode}" <c:if test="${item.partystt_cd == citem.dcode}">selected="selected"</c:if>>${citem.dcode_nm }</option>
																			</c:if>		
																		</c:if>
																		<c:if test="${item.partystt_cd == 'N'}">
																			<c:if test="${citem.dcode != 'W' }">
																				<option value="${citem.dcode}" <c:if test="${item.partystt_cd == citem.dcode}">selected="selected"</c:if>>${citem.dcode_nm }</option>
																			</c:if>		
																		</c:if>
																	</c:forEach>
																</select>
															</div>
														</td>
												    </tr>
											</c:forEach>					
											</c:otherwise>
										</c:choose>													    
								</tbody>
							</table>	
						</div>	
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <tr>
						    <td height="10"></td>
						  </tr>
						</table>
				  <!-- // Paging -->
					<div class="paging">
						<ul>	
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_select_userList" />
						</ul>
					</div>
				  <!-- Paging // -->	
					<div align="right">
						<input type="button"  style="background:url(/images/img/bt_add2.gif) left top; background-repeat:no-repeat; width:78px; height:28px; border:0;cursor:hand; margin-right:10px" onclick="addUser();"/>
					</div>		
<!-- 							<p style=" padding-top:20px; text-align:right;"><img src="/images/img/bt_regist.gif"></p>		 -->
					</div><!-- 표 끝 -->
					</div>
					</div>
				</div>
				<!-- // content -->
				
				<!-- 오른쪽 -->
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
</div></div>
		<!-- 메뉴끝 -->	
</div>
</body>
</html>