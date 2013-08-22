<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ed_usermodify.jsp
  * @Description : 사용자정보수정
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
<script type="text/javascript" src="<c:url value='/js/user/user.js'/>"></script>
<script type="text/javaScript" language="javascript">
$(document).ready(
		function() {
			fnInit();
		}
		
);
</script>
</head>
<body>
<div class="Wrap">
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
					<form name="updateForm" id="updateForm" action ="<c:url value='/user/forUpdateUser.do'/>" method="post">
						<input type="hidden" id="message" name="message" value="${message}">
						<input type="hidden" name="pageIndex" value="1"/>
						<input type="hidden" name="party_seq" value="<c:out value='${vo.party_seq }'/>"/>
					<!-- 표 시작 -->
					<div class="serviceBox">
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
							<table summary="회원정보입력" class="introTable">
								<colgroup>
									<col width="20%" /><col width="30%" /><col width="20%" /><col width="30%" />
								</colgroup>
								<tbody>
									<tr>
										<th>사번</th>
										<td><div><c:out value="${vo.id_if }"></c:out></div></td>
									    <td colspan="2">&nbsp;</td>
								    </tr>
									<tr>
										<th>비밀번호</th>
										<td><div><input type="password" id="pw_if" name="pw_if" maxlength="20" class="input_f" size="23"/></div></td>
										<th>비밀번호 확인</th>
									    <td><div><input type="password" id="pw_re" name="pw_re" maxlength="20" class="input_f" size="23"/></div></td>
									</tr>
									<tr>
										<td colspan="4"><div>* 비밀번호는 6자리이상 입력해주십시요.</div></td>
									</tr>
									<tr>
										<th>성명</th>
										<td><div><input type="text" id="user_nm" class="input_f"  size="23" name="user_nm" value="<c:out value="${vo.user_nm }"></c:out>"/></div></td>
									    <th>직급</th>
									    <td>
									    	<div>
												 <input type="text" id="duty_if" name="duty_if" class="input_f"  size="23" value="<c:out value="${vo.duty_if }"></c:out>"/>								    		
											</div>
										</td>
									</tr>
									<tr>
										<th>부서</th>
										<td>
											<div>
												 <select name="group_seq" style="height: 23px; width: 155px; border: 1px solid #CCCCCC; margin: 0px; padding: 0px; font-size:14px" class="select" tabindex="12" title="그룹선택" disabled="disabled">
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
										<td><div><input type="text" id="email_if" name="email_if" class="input_f" size="23" value="<c:out value="${vo.email_if }"></c:out>"/></div></td>
									    <th>회사번호</th>
									    <td><div><input type="text" id="tel_no_no" name="tel_no_no" class="input_f" size="23" value="<c:out value="${vo.tel_no_no }"></c:out>"/></div></td>
									</tr>
									<tr class="bottom">
									  <td colspan="4"><div>* 전자문서 관리시스템 접속 ID는 사번 정보입니다. 가입 본인의 사번을 입력하세요.</div></td>
							      </tr>
								</tbody>
							</table>
							<p style=" padding-top:30px; text-align:right;">
								<a href="${pageContext.request.contextPath}/user/metaDocList.do" ><img src="/images/img/bt_cancel.gif"></a>&nbsp;&nbsp;&nbsp;
								<a href="#" onclick="fn_update_user();"><img src="/images/img/bt_save.gif"></a>
							</p>
						</div><!-- 표 끝 -->
						</form>
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
</div></div>
</body>
</html>