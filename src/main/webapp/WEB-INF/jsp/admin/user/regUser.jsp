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
<title>EDMS</title>
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/admin/user.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/util/util.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/content.css'/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/defaultAuto.css'/>" media="screen" />
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
									<h3><img src="/images/img/title-infoentry.gif" alt="회원정보입력" /></h3>
									<p>회원님의 정확한 정보를 입력하여 주시기 바랍니다.</p>
								</div>
							</div><!--// serviceHeader-->
					<!-- 표 시작 -->
					<div class="serviceBox">
						<form name="regUserForm" id="regUserForm" action ="<c:url value='/admin/regUserProc.do'/>" method="post">
						<input type="hidden" id="message" name="message" value="${message}">
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
							<table summary="회원정보 입력" class="introTable">
								<colgroup>
									<col width="20%" /><col width="30%" /><col width="20%" /><col width="30%" />
								</colgroup>
								<tbody>
									<tr>
										<th>사번</th>
										<td><div><input type="text" id="id_if" name="id_if" maxlength="8" onKeyPress="NumObj(this);"/></div></td>
										<td colspan="2">&nbsp;</td>
								    </tr>
									<tr>
										<th>비밀번호</th>
										<td><div><input type="password" id="pw_if" name="pw_if" maxlength="20"/></div></td>
									    <th>비밀번호 확인</th>
									    <td><div><input type="password" id="pw_re" name="pw_re" maxlength="20"/></div></td>
									</tr>
									<tr>
										<th>성명</th>
										<td><div><input type="text" id="user_nm" name="user_nm"/></div></td>
									    <th>직급</th>
									    <td><div><input type="text" id="duty_if" name="duty_if"/></div></td>
									</tr>
									<tr>
										<th>부서</th>
										<td><div>
											 <select name="group_seq" style="height:23px; width:150px; border: 1px solid #CCCCCC; margin: 0px; padding: 0px;" class="select" tabindex="12" title="비밀번호힌트선택">
											    <option selected value='1'>--선택하세요--</option>
											    <c:forEach var="result" items="${groupList}" varStatus="status">
												<option value='<c:out value="${result.group_seq}"/>'><c:out value="${result.group_nm}"/></option>
												</c:forEach>
											  </select></div>
										</td>
									    <td colspan="2">&nbsp;</td>
								    </tr>
									<tr>
										<th>회사이메일</th>
										<td><div><input type="text" id="email_if" name="email_if"/></div></td>
									    <th>회사번호</th>
									    <td><div><input type="text" id="tel_no_no" name="tel_no_no"/></div></td>
									</tr>
									<tr class="bottom">
									  <td colspan="4"><div>* 전자문서 관리시스템 접속 ID는 사번 정보입니다. 가입 본인의 사번을 입력하세요.</div></td>
							      </tr>
								</tbody>
							</table>
							<p style=" padding-top:30px; text-align:right;">
								<a href="#" onclick="document.regUserForm.reset();"><img src="/images/img/bt_cancel.gif"></a>&nbsp;&nbsp;&nbsp;
								<a href="#" onclick="regUser(); return false;"><img src="/images/img/bt_confirm.gif"></a>
							</p>
						</form>
						</div><!-- 표 끝 -->
						</div>
					</div>
				<!-- // content -->
				</div>
				<!-- 오른쪽 -->
<div class="DimArea notScroll">
</div>
		<!-- 메뉴끝 -->	

</body>
</html>


