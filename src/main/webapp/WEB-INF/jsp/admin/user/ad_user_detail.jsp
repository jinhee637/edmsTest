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
<title>상세회원정보</title>
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
<body background="/images/img/bg.jpg">
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
									<p><img src="/images/img/infoview_img.jpg" alt="회원정보보기" /></p>
								</div>
								<div class="serviceHeaderCont">
									<h3><img src="/images/img/title-infoview.gif" alt="회원정보보기" /></h3>
									<p>회원님의 정확한 정보를 다시 한번 확인하여 주시기 바랍니다.</p>
								</div>
							</div><!--// serviceHeader-->
					<form name="detailForm" id="detailForm" action ="<c:url value='/admin/viewUser.do'/>" method="post">
						<input type="hidden" id="message" name="message" value="${message}">
						<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input type="hidden" name="party_seq" id="party_seq" value="<c:out value='${vo.party_seq }'/>"/>
					<!-- 표 시작 -->
					<div class="serviceBox">
<!-- 						<h4><img src="/introTit01.gif" alt="" /></h4> -->
							<table summary="회원정보 입력" class="introTable">
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
										<th>성명</th>
										<td><div><c:out value="${vo.user_nm }"></c:out></div></td>
									    <th>직급</th>
									    <td><div><c:out value="${vo.duty_if }"></c:out></div></td>
									</tr>
									<tr>
										<th>부서</th>
										<td><div><c:out value="${vo.dept_nm }"></c:out></div></td>
									    <td colspan="2">&nbsp;</td>
								    </tr>
									<tr>
										<th>회사이메일</th>
										<td><div><c:out value="${vo.email_if }"></c:out></div></td>
									    <th>회사번호</th>
									    <td><div><c:out value="${vo.tel_no_no }"></c:out></div></td>
									</tr>
									<tr>
										<th>회원상태</th>
										<td><div><c:out value="${vo.partystt_nm }"></c:out></div></td>
									    <th>문서업로드</th>
									    <td>
									    	<div>
									    		<c:if test="${vo.docregaut_yn == 'Y'}">
													YES
												</c:if>
												<c:if test="${vo.docregaut_yn == 'N'}">
													NO
												</c:if>
											</div>
										</td>
									</tr>
									<tr class="bottom">
									  <td colspan="4">
									  		<div>※ 사번, 성명, 부서, 회사번호, 이메일 등 회원정보를 다시 한번 확인하여 주시기 바랍니다.
											</div>
									  </td>
							      </tr>
								</tbody>
							</table>
							<p style=" padding-top:30px; text-align:right;">
								<a href="#" onclick="javascript:fn_select_userlist(1);"><img src="/images/img/bt_list.gif" alt="목록"></a>&nbsp;&nbsp;&nbsp;
								<a href="#" onclick="javascript:fn_move_updateUser();"><img src="/images/img/bt_edit3.gif" alt="수정"></a>
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
		<span class="Click Pro-open" onclick="javascript:OpenPro();"><img src="/btn-promotion-open.gif" alt="Open"/></span>
		<a class="Click Pro-close" href="#" onclick="javascript:ClosePro();"><img src="/btn-promotion-close.gif" alt="Close"/></a>
		<a href="#"><img src="/btn-content-top.gif" alt="top으로"/></a>
	</div> --> 
</div>
		<!-- 메뉴끝 -->	
</div></div>
</body>

</html>


