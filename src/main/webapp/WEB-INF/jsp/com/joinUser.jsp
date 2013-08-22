<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : joinUser.jsp
  * @Description : 회원가입
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
<title>회원정보 입력</title>
<script type="text/javascript" src="<c:url value='/js/jquery-1.4.2.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/user/user.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/util/util.js'/>"></script>
<script type="text/javaScript" language="javascript">
$(document).ready(
		function() {
			fnInit();
		}
);
</script>
</head>
<body>

	<!-- 메뉴 -->
<div class="Header">
 <div class="Gnb" >
	  <h1><a href="${pageContext.request.contextPath}/com/LoginUsr.do" target="_top"><img src="${pageContext.request.contextPath}/images/img/stas_logo.jpg" alt="stas" border="0"/></a></h1>
		  <a href="#" name="gnbS"></a>
		  <ul class="GnbUl" id="gnbS">
			  <li id="LeftNavi1_rootmenu_02" class="current"><a href="#"><img src="${pageContext.request.contextPath}/images/img/menu4_off.gif" alt="문서검색" border="0"/></a>
			  		<ul id="LeftNavi1_submenu_01">
						  <li id="LeftNavi1_submenu_01_01" class="on"><a href="#" id="LeftNavi1_hlnkSubmenu_01_01"><img src = "${pageContext.request.contextPath}/images/img/gnb-2depth01-01-on.gif" alt="문서등록"  border="0"/></a>
						  </li>
						  <li id="LeftNavi1_submenu_01_02"><a href="#" id="LeftNavi1_hlnkSubmenu_01_02"><img src = "${pageContext.request.contextPath}/images/img/gnb-2depth01-02-off.gif" alt="문서검색"  border="0"/></a></li>
						  <li id="LeftNavi1_submenu_01_03"><a href="#" id="LeftNavi1_hlnkSubmenu_01_03"><img src = "${pageContext.request.contextPath}/images/img/gnb-2depth01-03-off.gif" alt="내문서"  border="0"/></a></li>    
				    </ul>
			  </li>
			  <li id="LeftNavi1_rootmenu_03"><a href="#"><img src="${pageContext.request.contextPath}/images/img/menu5_off.gif" alt="문서등록" border="0"/></a></li>
			  <li id="LeftNavi1_rootmenu_04"><a href="#"><img src="${pageContext.request.contextPath}/images/img/menu6_off.gif" alt="내문서" border="0"/></a></li>		  
		  </ul>
		  	  <div class="footer" id="footer">
		  <p><img src="${pageContext.request.contextPath}/images/img/txt-copyright.gif" alt="COPYRIGHT ⓒ 2013 KOGAS. ALL RIGHTS RESERVED."/></p>		
	  			</div>
  </div>
  </div>
<!-- container // -->
		<div class="Container2">
			<div class="contTit CompanyTit">
				<h2><img src="/images/img/tit-info.gif" alt="회원정보" /></h2>
<!-- 				<p></p> -->
			</div>
			<div class="ContentArea">
	
			<ul class="location">
				<li class="home"></li>
				<li class="user"></li>				  
			</ul>
			
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
					<form name="joinUserForm" id="joinUserForm" action ="<c:url value='/com/regUser.do'/>" method="post">
					<input type="hidden" id="message" name="message" value="${message}">
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
							<table summary="회원정보 입력" class="introTable3">
								<colgroup>
									<col width="17%" />
									<col width="33%" />
									<col width="17%" />
									<col width="33%" />
								</colgroup>
								<tbody>
									<tr>
										<th>사번</th>
										<td><div><input type="text" id="id_if" name="id_if" maxlength="8" onKeyPress="NumObj(this);" size="22" class="input_f"/></div></td>
									    <td colspan="2">&nbsp;</td>
								    </tr>
									<tr>
										<th>비밀번호</th>
										<td><div><input type="password" id="pw_if" name="pw_if" maxlength="20" size="22" class="input_f"/></div></td>
									    <th>비밀번호 변경</td>
									    <td><div><input type="password" id="pw_re" name="pw_re" maxlength="20" size="22" class="input_f"/></div></td>
									</tr>
									<tr>
										<td colspan="4"> * 비밀번호는 6자리이상 입력해주십시요.</th>
									</tr>
									<tr>
										<th>성명</th>
										<td><div><input type="text" id="user_nm" name="user_nm" size="22" class="input_f"/></div></td>
									    <th>직급</th>
									    <td><div><input type="text" id="duty_if" name="duty_if" size="22" class="input_f"/></div></td>
									</tr>
									<tr>
										<th>부서</th>
										<td>
											<div>
												 <select name="group_seq" style="height: 23px; width: 150px; border: 1px solid #CCCCCC; margin: 0px; padding: 0px;" class="select" tabindex="12" title="비밀번호힌트선택">
												    <option selected value='1'>--선택하세요--</option>
												    <c:forEach var="result" items="${groupList}" varStatus="status">
													<option value='<c:out value="${result.group_seq}"/>'><c:out value="${result.group_nm}"/></option>
													</c:forEach>
												  </select>
											</div>
										</td>
									    <td colspan="2">&nbsp;</td>
								    </tr>
									<tr>
										<th>회사이메일</th>
										<td><div><input type="text" id="email_if" name="email_if" size="22" class="input_f"/></div></td>
									    <th>회사번호</td>
									    <td><div><input type="text" id="tel_no_no" name="tel_no_no" size="22" class="input_f"/></div></td>
									</tr>
									<tr class="bottom">
									  <td colspan="4"><div>* 전자문서 관리시스템 접속 ID는 사번 정보입니다. 가입 본인의 사번을 입력하세요.</div></td>
							      </tr>
								</tbody>
							</table>
							<p style=" padding-top:30px; text-align:right;">
								<a href="${pageContext.request.contextPath}/com/LoginUsr.do" target="_top"><img src="/images/img/bt_cancel.gif" ></a>&nbsp;&nbsp;&nbsp;
								<a href="#" onclick="regUser(); return false;"><img src="/images/img/bt_confirm.gif" ></a>
							</p>
							</form>
						</div><!-- 표 끝 -->
						</div>
					</div>
				</div></div>
				<!-- // content -->
				
				<!-- 오른쪽 -->
<div class="DimArea3 notScroll">
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
		<!-- 메뉴끝 -->	
</div>
</body>
</html>


