<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : regUser.jsp
  * @Description : 관리자 사용자 추가
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" type="text/css" href="/css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/common.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/content.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/defaultAuto.css" media="screen" />
<title>EDMS</title>
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/admin/user.js'/>"></script>
<script type="text/javaScript" language="javascript">
$(document).ready(
		function() {
			fnInit();
		}
		
);
</script>
</head>
<body>

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
									<p><img src="/images/img/infoentry_img.jpg" alt="회원정보입력" /></p>
								</div>
								<div class="serviceHeaderCont">
									<h3><img src="/images/img/title-infoedit.gif" alt="회원정보수정" /></h3>
									<p>회원님의 정확한 정보를 입력하여 주시기 바랍니다.</p>
								</div>
							</div><!--// serviceHeader-->
					<form name="updateForm" id="updateForm" action ="<c:url value='/admin/viewUser.do'/>" method="post">
						<input type="hidden" id="message" name="message" value="${message}">
						<input type="hidden" name="pageIndex" value="1"/>
						<input type="hidden" name="party_seq" value="<c:out value='${vo.party_seq }'/>"/>
					<!-- 표 시작 -->
					<div class="serviceBox">
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
						<table summary="회원정보 입력" class="introTable">
							<!-- <thead> -->
							  <colgroup>
									<col width="20%" /><col width="30%" /><col width="20%" /><col width="30%" />
							  </colgroup>
							<!-- </thead>	 -->
								<tbody>
									<tr>
										<th>사번</th>
										<td><div><c:out value="${vo.id_if }"></c:out></div></td>
									    <td colspan="2">&nbsp;</td>
								    </tr>
									<tr>
										<th>비밀번호</th>
										<td><div><input type="password" id="pw_if" name="pw_if" maxlength="20"/></div></td>
									    <td colspan="2"><input type="button"  style="background:url(/images/img/bt_pw.gif) left top; background-repeat:no-repeat; width:73px; height:21px; border:0; cursor:hand" onclick="changePW();"/></td>
									</tr>
									<tr>
										<th>성명</th>
										<td><div><input type="text" id="user_nm" name="user_nm" value="<c:out value="${vo.user_nm }"></c:out>"/></div></td>
									    <th>직급</th>
									    <td>
									    	<div><input type="text" id="duty_if" name="duty_if" value="<c:out value="${vo.duty_if }"></c:out>"/></div>
										</td>
									</tr>
									<tr>
										<th>부서</th>
										<td>
											<div><select name="group_seq" style="height: 26px; width:150px;" class="input_f" tabindex="12" title="비밀번호힌트선택">
												    <option selected value='1'>--선택하세요--</option>
												    <c:forEach var="result" items="${groupList}" varStatus="status">
													<option value='<c:out value="${result.group_seq}"/>' <c:if test='${result.group_seq == vo.group_seq }'> selected="selected"</c:if>><c:out value="${result.group_nm}"/></option>
													</c:forEach>
												  </select>									    		
											</div>
										</td>
									    <td colspan="2">&nbsp;</td>
								    </tr>
									<tr>
										<th>회사이메일</th>
										<td><div><input type="text" id="email_if" name="email_if" value="<c:out value="${vo.email_if }"></c:out>"/></div></td>
									    <th>회사번호</th>
									    <td><div><input type="text" id="tel_no_no" name="tel_no_no" value="<c:out value="${vo.tel_no_no }"></c:out>"/></div></td>
									</tr>
									<tr>
										<th>회원상태</th>
										<td>
											<div>
												<select name="partystt_cd" <c:if test="${vo.partystt_cd == 'D'}">disabled="disabled""</c:if>>
													<c:forEach items="${codeList}" var="citem" varStatus="stats">
														<c:choose>
															<c:when test="${vo.partystt_cd == 'Y'}">
																<c:if test="${citem.dcode != 'N' }">
																	<option value="${citem.dcode}" <c:if test="${vo.partystt_cd == citem.dcode}">selected="selected"</c:if>><c:out value="${citem.dcode_nm }"></c:out></option>
																</c:if>		
															</c:when>
															<c:when test="${vo.partystt_cd == 'W'}">
																<c:if test="${citem.dcode != 'D' }">
																	<option value="${citem.dcode}" <c:if test="${vo.partystt_cd == citem.dcode}">selected="selected"</c:if>><c:out value="${citem.dcode_nm }"></c:out></option>
																</c:if>		
															</c:when>
															<c:otherwise>
																<option value="${citem.dcode}" <c:if test="${vo.partystt_cd == citem.dcode}">selected="selected"</c:if>><c:out value="${citem.dcode_nm }"></c:out></option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>											
											</div>
										</td>
									    <th>문서업로드</th>
									    <td>
									    	<div>
									    		<select name="docregaut_yn">
										  			<option value="Y" <c:if test="${vo.docregaut_yn == 'Y'}">selected="selected"</c:if>>YES</option>
										  			<option value="N" <c:if test="${vo.docregaut_yn == 'N'}">selected="selected"</c:if>>NO</option>
										  		</select>
									    	</div>
									    </td>
									</tr>
									<tr class="bottom">
									  <td colspan="4"><div>* 회원님의 변경된 정보를 입력하여 주시기 바랍니다. </div></td>
							      </tr>
								</tbody>
							</table>
							<p style=" padding-top:30px; text-align:right;">
								<a href="#" onclick="fn_select_userDetail();return false;"><img src="/images/img/bt_cancel.gif" alt="취소"></a>&nbsp;&nbsp;&nbsp;
								<a href="#" onclick="fn_update_user();return false;"><img src="/images/img/bt_save.gif" alt="저장"></a>
							</p>
					  </div><!-- 표 끝 -->
						</form></div>
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
		<span class="Click Pro-open" onclick="javascript:OpenPro();"><img src="/Common/btn-promotion-open.gif" alt="Open"/></span>
		<a class="Click Pro-close" href="#" onclick="javascript:ClosePro();"><img src="/btn-promotion-close.gif" alt="Close"/></a>
		<a href="#"><img src="/btn-content-top.gif" alt="top으로"/></a>
	</div> --> 
</div>
		<!-- 메뉴끝 -->	
</div>
</body>
</html>


